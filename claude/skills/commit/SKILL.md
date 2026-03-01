---
name: commit
description: Analyze changes, commit, and push
---

Prepare and execute a git commit, and optionally compact context.

## Steps

1. **Identify relevant files**: Based on the conversation history, determine which files were worked on in this session. Do NOT use `git status` to find all changed files—only include files that are relevant to this conversation thread.

2. **Analyze changes**: Run `git diff` on the identified files to understand what changed.

3. **Assess context health**: Review the conversation history for signs of context bloat:
   - Large tool outputs (long file reads, big diffs, failed web fetches)
   - Repeated file reads of the same content
   - Exploratory searches that are no longer relevant
   - Verbose error messages or stack traces
   - Any content that served its purpose and is no longer needed

   If you identify significant bloat, prepare a compaction recommendation with specific instructions about what to preserve and what can be safely summarized.

4. **Execute commit**:
   - Stage the files with `git add` (explicitly list files, never use `-A` or `.`)
   - Commit with a well-crafted message (see style below)
   - Check if a remote origin is configured (`git remote get-url origin`)
   - If origin exists, push

5. **Compaction command** (only if bloat detected in step 3): After the commit completes, output a ready-to-run `/compact` command in a code block. Do not ask—just include it if recommended, or omit it entirely if not needed.

## Commit message style

- Use imperative mood ("Add feature" not "Added feature")
- First line is a concise summary (≤50 chars if possible)
- If more detail is needed, add a blank line then bullet points
- End with: `Co-Authored-By: Claude <noreply@anthropic.com>`

## Compaction instructions style

When crafting compact instructions, be specific:
- Name the key files and concepts that must be preserved
- Identify specific bloat to remove (e.g., "the failed WebFetch of solargis.com", "the repeated reads of DurableMeteorologicalData.md")
- Mention any terminology decisions or user preferences that should be retained
- Keep it concise—a few sentences, not a paragraph

## Notes

- Only commit files relevant to this conversation—the user may have other agents working on other files in this repo
- Do not commit files that look like secrets (.env, credentials, etc.)—warn the user instead
- If no relevant files were changed in this conversation, inform the user and exit
- Include the compaction command liberally—smaller context means better reasoning
- Keep your own output concise to minimize context usage

$ARGUMENTS
