# Ralph Loop: Fix ComfyUI Hands

You are working on fixing hand generation in ComfyUI on Mac MPS.

## Your Task

1. Read `PRD.md` for success criteria and technical approach
2. Read `progress.md` for what's been done
3. Read `errors.log` for what NOT to try
4. Complete the NEXT unchecked item in PRD.md
5. Update progress.md with what you did
6. Commit changes
7. EXIT (critical - don't continue)

## Key Constraints

- Mac MPS only - no Float8, no ESRGAN
- SDXL models work, FLUX FP8 does not
- ComfyUI at: `~/pfs-toolkit/comfyui/`
- Start script: `bash ~/pfs-toolkit/scripts/start_comfyui.sh`
- API endpoint: `http://localhost:8188`

## ComfyUI API Pattern

```python
# Submit workflow
curl -X POST http://localhost:8188/prompt \
  -H "Content-Type: application/json" \
  -d '{"prompt": WORKFLOW_JSON}'

# Check result
curl http://localhost:8188/history/PROMPT_ID
```

## After Each Task

1. Mark completed checkbox in PRD.md: `- [ ]` → `- [x]`
2. Add entry to progress.md
3. If error, add to errors.log
4. Commit: `git add -A && git commit -m "ralph: <what you did>"`
5. EXIT

## Critical Rules

- Do ONE checkbox per iteration
- ALWAYS exit after completing one task
- If something fails with MPS error, log it and try alternative
- Don't retry things in errors.log
