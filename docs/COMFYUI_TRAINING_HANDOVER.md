# ComfyUI Training Video - Handover Document

**To:** Training Department
**From:** Frederick A / Claude Code Session
**Date:** 2026-01-13
**Subject:** Training Video Brief - ComfyUI for PFS Production Pipeline

---

## 1. Executive Summary

ComfyUI is a **local, free, node-based AI image generation tool** that complements our cloud-based video generation pipeline (pfs-media-gen). This training video should help the team understand:

- What ComfyUI does (and doesn't do)
- When to use it vs cloud APIs
- How to run basic workflows
- How it fits into the PFS production pipeline

**Key Message:** ComfyUI generates IMAGES locally for free. It does NOT replace cloud video generation (Veo, Luma, Sora).

---

## 2. The Premise: Why We Have Two Systems

### The Problem
- Cloud video APIs cost $0.07-$0.15 per second of video
- A 60-second promo = $4-$9 in generation costs
- Need consistent style across frames
- Sometimes need quick image mockups without API costs

### The Solution: Hybrid Pipeline
```
Cloud APIs (pfs-media-gen)          Local (ComfyUI)
─────────────────────────           ─────────────────
• Generate video clips              • Generate still images
• High-quality motion               • Post-process frames
• Text-to-video                     • Upscale resolution
• Costs money                       • Consistent styling
                                    • FREE
```

---

## 3. What ComfyUI Actually Is

### Technical Definition
ComfyUI is a **node-based visual programming interface** for running AI image models (primarily Stable Diffusion and FLUX) locally on your computer.

### Plain English
It's like Photoshop Actions meets AI. You connect boxes (nodes) to create workflows that transform prompts into images, or process existing images.

### Our Installation
| Component | Details |
|-----------|---------|
| Location | `~/pfs-toolkit/comfyui/` |
| Launch | `bash ~/pfs-toolkit/scripts/start_comfyui.sh` |
| Access | http://localhost:8188 |
| Model | SDXL Base 1.0 (6.5GB) - Mac compatible, high-quality |
| Hardware | Runs on Mac M-series via MPS (Metal) |
| Upscaler | Lanczos (built-in) - Real-ESRGAN not Mac compatible |

**Note:** FLUX Schnell FP8 (16GB) is also installed but has MPS compatibility issues. Use SDXL for reliable Mac generation.

---

## 4. What ComfyUI Can Do

### 4.1 Text-to-Image Generation
**Use Case:** Create concept art, product mockups, social media images

```
Input:  "Professional headshot, confident businesswoman,
         studio lighting, corporate background"

Output: 1024x1024 photorealistic image
Time:   ~10-15 seconds on M3 Max
Cost:   FREE
```

**Training Demo:** Show basic FLUX workflow, change prompt, generate variations

### 4.2 Image-to-Image (Style Transfer)
**Use Case:** Apply consistent visual style to existing images

```
Input:  Product photo (plain)
Prompt: "Same composition, cinematic color grading,
         dramatic lighting"
Output: Restyled version
```

**Training Demo:** Load image, adjust denoising strength, show style application

### 4.3 Inpainting (Selective Editing)
**Use Case:** Fix AI artifacts, replace backgrounds, edit specific areas

```
Input:  Generated image with bad hands
Mask:   Paint over hands
Prompt: "Natural human hands, correct anatomy"
Output: Fixed image with only hands regenerated
```

**Training Demo:** Use mask editor, demonstrate selective regeneration

### 4.4 Batch Processing
**Use Case:** Generate multiple variations, process video frames

```
Input:  One prompt
Output: 10 variations with different seeds
        Pick the best one
```

**Training Demo:** Queue multiple generations, compare outputs

### 4.5 Upscaling (Requires Additional Model)
**Use Case:** Enhance resolution for print or 4K delivery

```
Input:  1024x1024 generated image
Output: 4096x4096 with enhanced details
```

#### What is ESRGAN/Real-ESRGAN?

ESRGAN (Enhanced Super-Resolution GAN) is an AI model trained on millions of images to intelligently upscale. Unlike basic interpolation, it "hallucinates" realistic detail:

| Method | How It Works | Result |
|--------|--------------|--------|
| **Lanczos/Bilinear** | Mathematical interpolation | Bigger but blurry edges |
| **Real-ESRGAN (AI)** | Neural network adds detail | Bigger AND sharper - adds pores, texture, fabric detail |

```
Example: Upscaling a face from 256px to 1024px

Lanczos:     Skin stays smooth, edges soft
Real-ESRGAN: AI adds realistic pores, fine hair, skin texture
             Looks like it was originally shot at high resolution
```

#### Mac Limitation (IMPORTANT)

| Upscaler | Mac MPS Compatible? | Notes |
|----------|---------------------|-------|
| Real-ESRGAN | **NO** | PyTorch MPS doesn't support Float operations in this model |
| Lanczos (built-in) | YES | Basic interpolation, no AI enhancement |
| Nearest (built-in) | YES | Pixelated look |

**Workaround:** Use Lanczos for 4K output on Mac, or use cloud upscaling service (Topaz AI, etc.) for AI-enhanced results.

**Training Demo:** Show Lanczos 4x upscale workflow (ImageScale node)

---

### 4.6 Critical Concept: Upscaling vs Fixing Flaws

**IMPORTANT: Upscaling does NOT fix generation problems.**

```
UPSCALING does:                    UPSCALING does NOT:
─────────────────                  ────────────────────
✓ Make image bigger               ✗ Fix weird hands
✓ Add detail/sharpness (AI only)  ✗ Correct anatomy
✓ Enhance textures (AI only)      ✗ Change composition
✓ Improve print quality           ✗ Remove artifacts
                                  ✗ Regenerate content
```

**Why?** Flaws are GENERATION problems, not RESOLUTION problems:

| Flaw | Why Upscaling Can't Fix It |
|------|---------------------------|
| Weird hands | AI generated wrong anatomy - bigger image = bigger wrong hands |
| Waxy skin | Texture was generated incorrectly - upscaling preserves the flaw |
| Blurry watch | Detail wasn't generated - upscaling can't invent missing detail |
| Extra fingers | Anatomical error - needs regeneration, not enlargement |

**To fix flaws, use INPAINTING** (Section 4.3):
1. Load the flawed image
2. Mask the problem area (e.g., hands)
3. Prompt: "natural human hands, correct anatomy"
4. AI regenerates ONLY the masked area
5. Result: Fixed hands, everything else preserved

**Training Point:** Always inspect generated images for flaws BEFORE upscaling. Fix flaws first with inpainting, then upscale the corrected image.

---

## 5. What ComfyUI CANNOT Do

| Capability | Can ComfyUI Do It? | Alternative |
|------------|-------------------|-------------|
| Text-to-video | NO | pfs-media-gen (Veo, Luma, Sora) |
| Veo/Sora quality video | NO | Cloud APIs only |
| Voice generation | NO | ElevenLabs (pfs-core) |
| Real-time generation | NO (10+ seconds) | Cloud APIs |
| Perfect photorealistic humans | LIMITED | Cloud APIs better |

**Important Training Point:** Don't let trainees think ComfyUI replaces video generation. Be explicit about limitations.

---

## 6. The Node-Based Interface

### Visual Explanation
```
┌─────────────────────────────────────────────────────────────┐
│                    ComfyUI Workspace                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   [Load Model]──▶[CLIP Encode]──▶[KSampler]──▶[VAE Decode] │
│        │              │              │              │       │
│        │          Your prompt    Generation      Output     │
│        │          goes here      happens here    image      │
│        ▼                                           ▼        │
│   FLUX Schnell                                 Save/Preview │
│   (16GB model)                                              │
│                                                             │
│   • Drag nodes from menu                                    │
│   • Connect outputs to inputs                               │
│   • Press "Queue Prompt" to run                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Key Concepts for Training
1. **Nodes** - Individual processing steps (boxes)
2. **Connections** - Data flow between nodes (lines)
3. **Workflow** - Complete node graph (saved as JSON)
4. **Queue** - Run button that executes the workflow
5. **Seed** - Random number that determines variation

---

## 7. PFS Production Pipeline Integration

### Where ComfyUI Fits
```
┌─────────────────────────────────────────────────────────────┐
│              PFS Video Production Pipeline                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. CONCEPT (Musings)                                       │
│     └─ Write script, generate storyboard                    │
│                                                             │
│  2. STILLS (ComfyUI) ◄── THIS TRAINING                      │
│     └─ Generate concept images                              │
│     └─ Create thumbnails                                    │
│     └─ Mockup frames before expensive video gen             │
│                                                             │
│  3. VIDEO (pfs-media-gen)                                   │
│     └─ Luma Ray3 / Veo / Sora for actual video clips        │
│     └─ ElevenLabs for voiceover                             │
│                                                             │
│  4. POST-PROCESS (ComfyUI) ◄── THIS TRAINING                │
│     └─ Upscale frames to 4K                                 │
│     └─ Apply consistent color grade                         │
│     └─ Fix any artifacts                                    │
│                                                             │
│  5. ASSEMBLY (pfs-core FFmpeg)                              │
│     └─ Mix audio layers                                     │
│     └─ Export final video                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Cost Optimization Example
```
WITHOUT ComfyUI:
- Generate 10 video variations to find right style = $30-$50
- Pick one, continue

WITH ComfyUI:
- Generate 10 IMAGE variations = FREE
- Pick style direction
- Generate 1 video in that style = $3-$5
- Savings: $25-$45
```

---

## 8. Hands-On Training Outline

### Module 1: Setup & Launch (5 min)
1. Open Terminal
2. Run: `bash ~/pfs-toolkit/scripts/start_comfyui.sh`
3. Open browser: http://localhost:8188
4. Tour the interface

### Module 2: Basic Text-to-Image (10 min)
1. Load default FLUX workflow
2. Find the prompt node
3. Enter a prompt
4. Click "Queue Prompt"
5. View result
6. Change seed, regenerate

### Module 3: Understanding Nodes (10 min)
1. Identify each node's purpose
2. Trace data flow
3. Modify parameters (steps, CFG)
4. See how changes affect output

### Module 4: Saving & Loading Workflows (5 min)
1. Save workflow as JSON
2. Load existing workflow
3. Explain workflow sharing

### Module 5: Practical Exercise (15 min)
1. Generate a "PFS corporate headshot"
2. Create 5 variations
3. Pick best one
4. (If upscaler installed) Upscale to 4K

### Module 6: Pipeline Context (5 min)
1. When to use ComfyUI
2. When to use cloud APIs
3. Cost considerations
4. Q&A

**Total Training Time: ~50 minutes**

---

## 9. Common Mistakes to Address

| Mistake | Correction |
|---------|------------|
| "ComfyUI can make videos like Veo" | No - images only, use pfs-media-gen for video |
| "It's slow, something's wrong" | Normal - 10-15 sec per image on Mac |
| "The hands look weird" | Known AI limitation - use inpainting to fix |
| "How do I get more models?" | ComfyUI Manager → Install Models (careful with disk space) |
| "It crashed" | Check Console for errors, restart script |

---

## 10. Resources for Training Video

### Screen Recording Needed
- [ ] Launch sequence (Terminal → Browser)
- [ ] Interface tour
- [ ] Basic workflow execution
- [ ] Parameter adjustment
- [ ] Result comparison

### Graphics/Slides Needed
- [ ] Comparison chart: ComfyUI vs Cloud APIs
- [ ] Pipeline diagram (where ComfyUI fits)
- [ ] Node explanation diagram
- [ ] Cost savings example

### Voiceover Script Key Points
1. "ComfyUI is for images, not video"
2. "It runs locally on your Mac, completely free"
3. "Use it to prototype before spending money on video"
4. "It's part of our pipeline, not a replacement"

---

## 11. Technical Reference

### Launch Command
```bash
bash ~/pfs-toolkit/scripts/start_comfyui.sh
```

### Access URL
```
http://localhost:8188
```

### Stop Command
```bash
pkill -f "python main.py --listen 0.0.0.0 --port 8188"
```

### Model Location
```
~/pfs-toolkit/comfyui/models/checkpoints/
```

### Workflow Save Location
```
~/pfs-toolkit/comfyui/user/default/workflows/
```

---

## 12. Success Criteria for Training

After this training, team members should be able to:

- [ ] Launch ComfyUI independently
- [ ] Generate an image from a text prompt
- [ ] Explain why we use ComfyUI vs cloud APIs
- [ ] Know when ComfyUI is the right tool
- [ ] Save and load workflows
- [ ] Understand the PFS pipeline stages

---

## 13. Next Steps

1. **Training Department:** Review this document, create video script
2. **Record:** Screen capture + voiceover for each module
3. **Review:** Frederick to approve before distribution
4. **Distribute:** Add to PFS onboarding materials

---

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| Node | Single processing step in ComfyUI |
| Workflow | Complete graph of connected nodes |
| Checkpoint | Main AI model file (16GB for FLUX) |
| VAE | Encoder/decoder that converts images to/from AI format |
| CLIP | Model that understands text prompts |
| Seed | Random number that creates variation |
| CFG Scale | How closely to follow the prompt (7-8 typical) |
| Steps | Number of refinement passes (4 for FLUX Schnell) |
| Sampler | Algorithm for generation (euler, dpm++, etc.) |
| LoRA | Small add-on model for specific styles |
| Inpainting | Regenerating only part of an image |

---

## Appendix B: Proven Hand-Fixing Workflow (Mac MPS)

Tested 2026-01-14. This workflow provides **texture improvement** but not **anatomical correction**.

### What This Fixes
- Waxy/plastic skin texture
- Blending issues at edges
- Minor detail enhancement

### What This Does NOT Fix
- Wrong number of fingers (needs ControlNet)
- Impossible hand poses (needs ControlNet)
- Anatomical errors (needs specialized models)

### Optimized Settings

```
Model: sd_xl_base_1.0.safetensors (NOT inpainting-specific)
Denoise: 0.5 (lower = better blending, less change)
Steps: 30
CFG: 7
Sampler: euler
Scheduler: normal
```

### Prompts That Work

```
Positive:
"five fingers, natural human hand, correct anatomy,
 photorealistic, detailed skin texture, professional photo"

Negative:
"extra fingers, missing fingers, fused fingers,
 bad anatomy, deformed, mutated, six fingers, four fingers"
```

### Mask Strategy

1. Fix ONE hand at a time
2. Tight ellipse around hand only (not whole arm)
3. Include 10-20px padding for blending
4. Use ImageToMask node to convert

### For True Anatomical Fixes

Requires tools NOT compatible with Mac MPS:
- **HandRefiner** (ControlNet) - untested on MPS
- **MeshGraphormer** - may have MPS issues
- **Dedicated inpainting models** - download issues

**Recommendation:** For production work requiring perfect hands:
1. Generate multiple variations (different seeds)
2. Pick the best hand anatomy from the start
3. Use inpainting only for texture/blending fixes
4. Or use cloud-based tools (Midjourney V7 has 85%+ hand accuracy)

---

## Appendix C: Troubleshooting

| Issue | Solution |
|-------|----------|
| "ComfyUI not responding" | Wait 30 sec on first load, models are loading |
| "Out of memory" | Close other apps, reduce image size |
| "Black image output" | Check VAE is connected, try different seed |
| "Very slow generation" | Normal for Mac, ~10-15 sec is expected |
| "Node missing" | Install via ComfyUI Manager |
| "Real-ESRGAN not working" | **Known Mac limitation** - MPS doesn't support this model's float operations. Use Lanczos upscaler instead (ImageScale node) |
| "Float8_e4m3fn error" | FLUX FP8 model not compatible with Mac MPS. Use SDXL or download FLUX GGUF/BF16 version |
| "Upscaled image still has weird hands" | Upscaling doesn't fix flaws - use inpainting first to fix anatomy, then upscale |

---

**Document Version:** 1.1
**Created:** 2026-01-13
**Updated:** 2026-01-13
**Author:** Frederick A + Claude Code
**Status:** Ready for Training Department Review

---

## Changelog

**v1.2 (2026-01-14)**
- Added proven hand-fixing workflow tested on Mac MPS
- Documented what works vs what doesn't for anatomy fixes
- Added recommended settings: denoise 0.5, one hand at a time
- Clarified ControlNet requirement for true anatomical fixes

**v1.1 (2026-01-13)**
- Added Section 4.6: Critical distinction between upscaling vs fixing flaws
- Added ESRGAN explanation and Mac MPS limitation
- Updated model recommendation: SDXL over FLUX FP8 for Mac
- Added troubleshooting entries for common Mac errors
- Clarified that upscaling enlarges but doesn't fix generation artifacts
