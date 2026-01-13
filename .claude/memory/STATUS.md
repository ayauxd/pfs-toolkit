# pfs-toolkit Status

**Phase:** Production Ready
**Last Updated:** 2026-01-13

## Overview
Pitch Film Studios production toolkit containing ComfyUI and PersonaLive for visual workflow editing and digital avatar creation.

## Components

| Component | Status | Port | Purpose |
|-----------|--------|------|---------|
| ComfyUI | Ready | 8188 | Node-based visual workflows |
| PersonaLive | Ready | 7860 | Digital avatar animation |

## Launch Commands

```bash
# ComfyUI
bash ~/pfs-toolkit/scripts/start_comfyui.sh

# PersonaLive
bash ~/pfs-toolkit/scripts/start_personalive.sh
```

## Dependencies

- conda env: `pfs`
- PyTorch with MPS support
- xformers for acceleration

## Pending Tasks

- [ ] Create ComfyUI workflow templates for common PFS tasks
- [ ] Document PersonaLive avatar creation process
- [ ] Integrate with pfs-core for provider cost tracking
- [ ] Add health check script

## Integration Points

- **pfs-media-gen**: Can use ComfyUI for post-processing
- **pfs-core**: Could share provider implementations
- **pitchfilm-analyzer**: Video analysis → ComfyUI workflow

## Next Session

Continue with PersonaLive documentation and workflow templates.
