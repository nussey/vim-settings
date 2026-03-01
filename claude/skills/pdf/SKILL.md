---
name: pdf
description: Build a PDF from markdown files using pandoc + tectonic
allowed-tools: Read, Write, Edit, Glob, Grep, AskUserQuestion, Task
user-invocable: true
---

Build a PDF from a collection of markdown files using the pandoc → .tex → tectonic pipeline.

## Invocation

`/pdf <directory>` — e.g., `/pdf kb/LossAccounting`

If no directory is given, infer from conversation context or ask.

## Prerequisites

Requires `pandoc` and `tectonic` (`brew install pandoc tectonic`). Check that both are available before starting. If either is missing, tell the user how to install and stop.

## Step 1: Determine source files

Look for `BUILD.md` or `pdf_build/BUILD.md` in the target directory.

**If BUILD.md exists**: Follow its file list (names and order), image references, TOC placement, and any project-specific instructions.

**If no BUILD.md**: Use these defaults:
- Include all `.md` files in the directory (excluding README.md and any existing BUILD.md)
- Sort alphabetically
- No images (skip all `// [SCREENSHOT]` lines)
- No TOC
- Output filename = directory name + `.pdf`

## Step 2: Set up build directory

**If only one `.md` file**: Skip the build directory entirely. Work directly on a copy in the same directory (copy to `<name>_build.md`, transform that, compile, then clean up the copy).

**If multiple files**:

```
mkdir -p <target>/pdf_build
```

Copy the listed markdown files (and any referenced images from BUILD.md) into `pdf_build/`. All subsequent work happens in `pdf_build/`.

## Step 3: Transform markdown files

Apply ALL of the following to each `.md` file in `pdf_build/`. Use the Edit tool so the user can see diffs. Process files one at a time.

### a. Strip meta-notes

Remove lines starting with `// [eng]`, `// [product]`, `// [sales]`, `// [all]`, `// [ai]` (with or without the space after `//`). Also remove continuation lines — subsequent lines starting with `//` that belong to the same note block.

### b. Handle screenshot markers

- If BUILD.md defines image mappings for specific `// [SCREENSHOT]` lines, replace them with the corresponding `![alt](filename.png)` embed.
- All other `// [SCREENSHOT] ...` lines → remove entirely.
- If no BUILD.md, remove ALL `// [SCREENSHOT]` lines.

### c. Convert callouts

`// [CALLOUT] Some text` → `> Some text`

### d. Rewrite cross-document links

For files included in this PDF: `[text](./FileName.md#anchor)` → `[text](#anchor)`. For `[text](./FileName.md)` with no anchor, link to the H1 anchor of that file (generate from the file's first `# Heading`).

### e. Neutralize external links

For any `[text](./SomeFile.md...)` where SomeFile.md is NOT included in this PDF, replace the link with plain text (just `text`). This prevents broken links in the output.

### f. Replace problematic Unicode

Latin Modern (the default LaTeX font) can't render these. Replace throughout:
- Box-drawing characters: `├──` → `|--`, `└──` → `\--`, `│` → `|`
- Less-than-or-equal: `≤` → `<=`
- Greater-than-or-equal: `≥` → `>=`
- Any other non-ASCII that causes tectonic errors (fix as discovered)

### g. Convert standalone bold labels to H4

Lines where bold text acts as a standalone section label (e.g., `**Methodology**`, `**When to Use**`, `**Warning**`, `**Fields:**`, `**Example**:`, `**Steps**:`) become `#### -- Label --`.

Only convert bold text that is alone on its line (possibly with a trailing colon). Do NOT convert bold text inline within paragraphs or bullet points. Do NOT convert `**Label**: followed by text on the same line`.

### h. Ensure blank lines before bullet lists

Pandoc requires a blank line before the first `-` or `*` or `1.` of a list. Insert one if missing.

### i. Clean up excessive blank lines

Reduce 3+ consecutive blank lines to 2.

## Step 4: Generate .tex with pandoc

Run from within `pdf_build/`:

```bash
pandoc \
  <file1.md> <file2.md> ... \
  -o <OutputName>.tex \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V colorlinks=true \
  -V linkcolor=blue \
  -V toccolor=blue \
  --standalone
```

**NEVER** use `--toc` (we place it manually if BUILD.md specifies).
**NEVER** use `--pdf-engine=tectonic` (intermittent failures).
**NEVER** use `-H header.tex` or `-V header-includes=...` (path/escaping issues).

## Step 5: Post-process the .tex file

Apply these modifications to the generated `.tex` using the Edit tool:

### a. Fix H4 headings (always)

Insert before `\begin{document}`:

```latex
\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}{3.25ex \@plus1ex \@minus.2ex}{1em}{\normalfont\normalsize\bfseries}}
\makeatother
```

This makes H4 (`####`) headings display as block headings instead of run-in paragraphs.

### b. Add table row separators (always)

This is critical for readability. Run this awk command to add `\hline` after each data row in longtables:

```bash
awk '
/\\endlastfoot/ { inside=1 }
/\\end\{longtable\}/ { inside=0 }
{ print }
inside && / \\\\$/ { print "\\hline" }
' <OutputName>.tex > tmp_fixed.tex && mv tmp_fixed.tex <OutputName>.tex
```

### c. Insert TOC (only if BUILD.md specifies)

If BUILD.md specifies where the TOC goes, find that section heading in the .tex and insert before it:

```latex
\newpage
\setcounter{tocdepth}{2}
\tableofcontents
\newpage
```

## Step 6: Compile with tectonic

Run as a **separate command** (never chained with pandoc via `&&`):

```bash
tectonic <OutputName>.tex
```

If tectonic fails, read the error output carefully. Common fixes:
- Missing Unicode character → go back and add it to the replacement list in Step 3f
- Missing package → tectonic auto-downloads, but network issues can cause failures; retry once

## Step 7: Deliver

Always deliver the final PDF to `~/Downloads/<OutputName>.pdf`.

```bash
cp <OutputName>.pdf ~/Downloads/<OutputName>.pdf
rm <OutputName>.tex
```

If a `pdf_build/` directory was used, leave it in place (it contains the transformed markdown which may be useful for debugging or iteration). If working in single-file mode, delete the `_build.md` copy.

Tell the user where the PDF is.

## Important rules

- **Run each bash step as its own command.** Do not chain pandoc, awk, and tectonic together.
- **Use Edit for markdown and .tex transformations** so the user sees what changed.
- **If a transformation step has nothing to change** in a file, skip it silently.
- **For large builds (7+ files)**, use Task tool with `general-purpose` subagents to transform files in parallel.

$ARGUMENTS
