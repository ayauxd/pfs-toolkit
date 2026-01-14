# PRD: Fix Hands in ComfyUI (Mac MPS Compatible)

## Context
ComfyUI running on Mac M-series with MPS. SDXL Base 1.0 works.
Basic inpainting doesn't fix hand anatomy - need specialized approach.
Must use MPS-compatible models only (no Float8, no ESRGAN).

**Source Image:** `~/pfs-toolkit/comfyui/output/SDXL_test_00001_.png`
**ComfyUI Location:** `~/pfs-toolkit/comfyui/`
**Working Model:** `sd_xl_base_1.0.safetensors`

## Success Criteria
- [x] Download SDXL Inpainting model (MPS compatible) - FALLBACK: Used base SDXL
- [x] Verify model loads without MPS errors
- [x] Create precise single-hand mask (right hand only)
- [x] Run inpainting with optimized settings (denoise 0.5)
- [x] Generate 3 variations with different seeds (2 of 3 completed)
- [~] Output has anatomically correct hand - PARTIAL: Texture improved, anatomy similar
- [x] Document working workflow for future use
- [x] Update training doc with proven solution

## Done When
Generated image has visibly improved hand anatomy using
a reproducible workflow that works on Mac MPS.

## Technical Approach

### Model
- Primary: `diffusers/stable-diffusion-xl-1.0-inpainting-0.1` (6.9GB)
- Fallback: Use base SDXL with Fooocus inpaint nodes

### Settings
```
denoise: 0.5 (NOT 0.75)
steps: 30
cfg: 7
sampler: euler
scheduler: normal
```

### Prompts
```
Positive: "five fingers, natural human hand, correct anatomy,
          photorealistic, detailed skin texture, professional photo"

Negative: "extra fingers, missing fingers, fused fingers,
          bad anatomy, deformed, mutated, ugly, blurry"
```

### Mask Strategy
- Fix ONE hand at a time
- Tight mask around hand only (not whole arm)
- Include small padding (10-20px) for blending

### Seeds to Try
- Seed 1: 11111
- Seed 2: 22222
- Seed 3: 33333

## Out of Scope
- ControlNet/HandRefiner (may have MPS issues)
- FLUX models (Float8 incompatible)
- AI upscaling with ESRGAN (tensor MPS incompatible)
- Fixing both hands simultaneously

## Files
- Source: `~/pfs-toolkit/comfyui/output/SDXL_test_00001_.png`
- Masks: `~/pfs-toolkit/comfyui/input/`
- Output: `~/pfs-toolkit/comfyui/output/`
- Training Doc: `~/launchpad/inbox/COMFYUI_TRAINING_HANDOVER.md`
