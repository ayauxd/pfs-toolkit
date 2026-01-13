# Softworks Toolkit - Visual Workflow Reference

**Version:** 1.0
**Date:** December 26, 2025
**Purpose:** Comprehensive visual guide for all production workflows
**Audience:** Team members, contractors, and new hires

---

## Table of Contents

1. [Master Architecture Diagram](#1-master-architecture-diagram)
2. [Production Pipelines](#2-production-pipelines)
   - [Digital Training Avatar Pipeline](#21-digital-training-avatar-pipeline)
   - [AI Image Generation Pipeline](#22-ai-image-generation-pipeline)
   - [Batch Processing Workflow](#23-batch-processing-workflow)
3. [Integration Patterns](#3-integration-patterns)
   - [ComfyUI + PersonaLive Integration](#31-comfyui--personalive-integration)
   - [ElevenLabs + PersonaLive Integration](#32-elevenlabs--personalive-integration)
   - [API-Driven Automation](#33-api-driven-automation)
4. [Client Delivery Workflows](#4-client-delivery-workflows)
   - [Multi-Format Export](#41-multi-format-export)
   - [Quality Assurance Checkpoints](#42-quality-assurance-checkpoints)
   - [Client Handoff Procedures](#43-client-handoff-procedures)
5. [Revenue-Generating Workflows](#5-revenue-generating-workflows)
   - [Pilot Package ($4,500)](#51-pilot-package-4500)
   - [Per-Module Pricing ($150-220/unit)](#52-per-module-pricing-150-220unit)
   - [Enterprise Setup ($18,000+)](#53-enterprise-setup-18000)
   - [AI Setup Support Tiers](#54-ai-setup-support-tiers)
6. [Quick Reference Cards](#6-quick-reference-cards)

---

# 1. Master Architecture Diagram

## Complete System Overview

```
+==============================================================================+
|                    SOFTWORKS AI TOOLKIT - MASTER ARCHITECTURE                |
+==============================================================================+

                              BUSINESS UNITS
    +------------------+  +------------------+  +------------------+
    |    SOFTWORKS     |  |   PITCH FILM     |  |  PREPURCHASE     |
    |     TRADING      |  |    STUDIOS       |  |     PRO          |
    |                  |  |                  |  |                  |
    | - AI Consulting  |  | - Digital Avatars|  | - Vehicle AI     |
    | - Agent Setup    |  | - Media Prod     |  | - Mobile Tools   |
    | - Voice AI       |  | - Training Video |  | - Inspection     |
    +--------+---------+  +--------+---------+  +--------+---------+
             |                     |                     |
             +----------+----------+----------+----------+
                        |                     |
                        v                     v
    +==============================================================+
    |                     CORE AI ENGINES                          |
    +==============================================================+
    |                                                              |
    |   +------------------+        +------------------+           |
    |   |    COMFYUI       |<------>|   PERSONALIVE    |           |
    |   |                  |        |                  |           |
    |   | - Image Gen      |        | - Portrait Anim  |           |
    |   | - Video Gen      |        | - Real-time      |           |
    |   | - Upscaling      |        | - Infinite-len   |           |
    |   | - Post-process   |        | - WebUI          |           |
    |   +--------+---------+        +--------+---------+           |
    |            |                           |                     |
    |            v                           v                     |
    |   +--------------------------------------------------+       |
    |   |              SHARED MODEL REPOSITORY              |       |
    |   |                                                  |       |
    |   |  ~/softworks-toolkit/models/                     |       |
    |   |  +- checkpoints/   (Flux, SDXL, SD3)            |       |
    |   |  +- loras/         (Style adaptors)             |       |
    |   |  +- vae/           (Image decoders)             |       |
    |   |  +- controlnet/    (Pose, depth, edge)          |       |
    |   +--------------------------------------------------+       |
    |                                                              |
    +==============================================================+
                        |
                        v
    +==============================================================+
    |                    API INTEGRATIONS                          |
    +==============================================================+
    |                                                              |
    |  +--------------+  +--------------+  +--------------+        |
    |  |  ELEVENLABS  |  |   ANTHROPIC  |  |   OPENAI     |        |
    |  |              |  |              |  |              |        |
    |  | Voice Synth  |  |  Claude API  |  |  GPT-4/DALL-E|        |
    |  | Voice Clone  |  |  Claude Code |  |  Whisper     |        |
    |  +--------------+  +--------------+  +--------------+        |
    |                                                              |
    |  +--------------+  +--------------+  +--------------+        |
    |  |   GOOGLE     |  |    GLIF      |  |    OTHER     |        |
    |  |              |  |              |  |              |        |
    |  | Gemini API   |  | Agent Orch   |  | Runway, etc  |        |
    |  | Nano Banana  |  | Workflow     |  |              |        |
    |  +--------------+  +--------------+  +--------------+        |
    |                                                              |
    +==============================================================+
                        |
                        v
    +==============================================================+
    |                    OUTPUT PIPELINE                           |
    +==============================================================+
    |                                                              |
    |   RAW --> SELECTS --> RENDERS --> QA --> DELIVERABLES        |
    |                                                              |
    |  +--------+  +--------+  +--------+  +--------+  +--------+  |
    |  |01_RAW/ |->|02_SEL/ |->|04_REND/|->|  QA    |->|06_DEL/ |  |
    |  |        |  |        |  |        |  | CHECK  |  |        |  |
    |  | Source |  | Curated|  | Output |  | Review |  | Final  |  |
    |  | Assets |  | Assets |  | Files  |  | Approve|  | Export |  |
    |  +--------+  +--------+  +--------+  +--------+  +--------+  |
    |                                                              |
    +==============================================================+
```

## Data Flow Overview

```
+==============================================================================+
|                         MASTER DATA FLOW                                     |
+==============================================================================+

  CLIENT INPUT                    PROCESSING                      OUTPUT
  ============                    ==========                      ======

  +-------------+             +------------------+           +--------------+
  | Portrait    |------------>|                  |---------->| 9:16 Video   |
  | Photo       |             |                  |           | (Vertical)   |
  +-------------+             |                  |           +--------------+
                              |                  |
  +-------------+             |   SOFTWORKS      |           +--------------+
  | Script      |------------>|   TOOLKIT        |---------->| 1:1 Video    |
  | Text        |             |                  |           | (Square)     |
  +-------------+             |   +----------+   |           +--------------+
                              |   | ComfyUI  |   |
  +-------------+             |   +----------+   |           +--------------+
  | Voice       |------------>|        |        |---------->| 16:9 Video   |
  | Selection   |             |        v        |           | (Widescreen) |
  +-------------+             |   +----------+   |           +--------------+
                              |   |PersonaL. |   |
  +-------------+             |   +----------+   |           +--------------+
  | Brand       |------------>|        |        |---------->| Thumbnail    |
  | Guidelines  |             |        v        |           | (PNG)        |
  +-------------+             |   +----------+   |           +--------------+
                              |   |ElevenLabs|   |
                              |   +----------+   |           +--------------+
                              |                  |---------->| Transcript   |
                              +------------------+           | (SRT/TXT)    |
                                                             +--------------+
```

---

# 2. Production Pipelines

## 2.1 Digital Training Avatar Pipeline

### Complete End-to-End Flow

```
+==============================================================================+
|            DIGITAL TRAINING AVATAR PIPELINE - COMPLETE FLOW                  |
+==============================================================================+

  PHASE 1: INTAKE                    PHASE 2: AUDIO
  ================                   ===============

  +-------------+                    +------------------+
  | CLIENT      |                    |   ELEVENLABS     |
  | PORTRAIT    |                    |   API            |
  |             |                    |                  |
  | - Hi-res    |                    | Voice Selection: |
  | - Neutral   |                    | - Clone client   |
  | - Good light|                    | - Stock voice    |
  +------+------+                    | - Custom train   |
         |                           +--------+---------+
         v                                    |
  +-------------+                             v
  | SCRIPT      |                    +------------------+
  | DOCUMENT    |                    |  AUDIO FILE      |
  |             |------------------->|                  |
  | - Training  |   Voice matches    | Format: MP3/WAV  |
  | - Modules   |   script content   | Quality: 44.1kHz |
  | - Timing    |                    | Length: Variable |
  +-------------+                    +--------+---------+
                                              |
                                              v

  PHASE 3: ANIMATION                 PHASE 4: POST-PROCESSING
  ==================                 =====================

  +------------------+               +------------------+
  |   PERSONALIVE    |               |    COMFYUI       |
  |                  |               |                  |
  | Inputs:          |               | Apply:           |
  | - Portrait photo |               | - Look system    |
  | - Audio file     |-------------->| - Color grade    |
  |                  |    Raw        | - Overlay/HUD    |
  | Output:          |    Video      | - Brand elements |
  | - Animated face  |               |                  |
  | - Lip sync       |               | Look Options:    |
  | - Head movement  |               | - Realistic-Anon |
  +------------------+               | - Luxury-Tech    |
                                     +--------+---------+
                                              |
                                              v

  PHASE 5: EXPORT                    PHASE 6: DELIVERY
  ===============                    =================

  +------------------+               +------------------+
  |     FFMPEG       |               |   DELIVERABLES   |
  |                  |               |                  |
  | Multi-format:    |               | Package:         |
  | - 9:16 (1080x1920)               | - Video files    |
  | - 1:1  (1080x1080)-------------->| - Thumbnails     |
  | - 16:9 (1920x1080)               | - Transcripts    |
  |                  |               | - Usage guide    |
  | Codec: H.264     |               |                  |
  | Quality: High    |               | Delivery:        |
  +------------------+               | - Cloud upload   |
                                     | - Client portal  |
                                     +------------------+
```

### Detailed Step-by-Step Process

```
+==============================================================================+
|                    AVATAR PIPELINE - STEP BY STEP                            |
+==============================================================================+

STEP 1: PORTRAIT CAPTURE
=========================
                                    REQUIREMENTS
+-------------+                     +----------------------------------+
|   CAPTURE   |                     | Resolution: 2048x2048 minimum   |
|   PORTRAIT  |-------------------->| Format: PNG or TIFF             |
|             |                     | Lighting: Soft, even, frontal   |
|   /-----\   |                     | Expression: Neutral             |
|  |  O O  |  |                     | Background: Solid, no patterns  |
|  |   >   |  |                     | Head angle: Straight to camera  |
|  | \___/ |  |                     +----------------------------------+
|   \_____/   |
+-------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/01_RAW/portrait.png
      v

STEP 2: SCRIPT PREPARATION
===========================
+------------------+                +----------------------------------+
|  SCRIPT PREP     |                | Script Guidelines:               |
|                  |                |                                  |
|  Training Module |                | - Clear sentence breaks          |
|  =============== |--------------->| - Phonetic spellings for names   |
|                  |                | - Timing markers if needed       |
|  1. Introduction |                | - 150 words = ~1 minute audio    |
|  2. Key concepts |                | - Avoid complex abbreviations    |
|  3. Examples     |                |                                  |
|  4. Summary      |                +----------------------------------+
|                  |
+------------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/03_PROMPTS/script.txt
      v

STEP 3: AUDIO GENERATION
=========================
+------------------+     API Call    +------------------+
|  ELEVENLABS      |<----------------|  SCRIPT TEXT     |
|                  |                 +------------------+
|  Voice Config:   |
|  - Voice ID      |     Returns     +------------------+
|  - Model: v2     |---------------->|  AUDIO FILE      |
|  - Stability: 75%|                 |                  |
|  - Similarity:85%|                 |  Module_01.mp3   |
+------------------+                 +------------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/03_PROMPTS/audio/
      v

STEP 4: PERSONALIVE ANIMATION
==============================
+------------------+                 +------------------+
|                  |                 |                  |
|   PORTRAIT.PNG   |====+            |    AUDIO.MP3     |
|                  |    |            |                  |
+------------------+    |            +------------------+
                        |                    |
                        v                    v
               +----------------------------+
               |       PERSONALIVE          |
               |                            |
               |  WebUI: localhost:7860     |
               |                            |
               |  Settings:                 |
               |  - Acceleration: xformers  |
               |  - Output: 1920x1080       |
               |  - FPS: 30                 |
               |  - Quality: High           |
               +-------------+--------------+
                             |
                             v
               +----------------------------+
               |      RAW_VIDEO.MP4         |
               |                            |
               |  - Lip-synced animation    |
               |  - Natural head movement   |
               |  - Eye tracking            |
               +----------------------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/04_RENDERS/raw/
      v

STEP 5: COMFYUI POST-PROCESSING
================================
                    +-------------------------------------------+
                    |              COMFYUI WORKFLOW              |
                    +-------------------------------------------+
                                        |
         +------------------------------+------------------------------+
         |                              |                              |
         v                              v                              v
+------------------+         +------------------+         +------------------+
| LOOK SYSTEM      |         | COLOR GRADE      |         | OVERLAY/HUD      |
|                  |         |                  |         |                  |
| Realistic-Anon:  |         | - Contrast       |         | - Brand logo     |
| - Face blur      |         | - Saturation     |         | - Progress bar   |
| - Matte overlay  |         | - White balance  |         | - Chapter titles |
|                  |         | - Lift/Gamma/Gain|         | - Lower thirds   |
| Luxury-Tech:     |         |                  |         |                  |
| - Exoskeleton    |         +------------------+         +------------------+
| - HUD graphics   |
+------------------+
         |
         +------------------------------+------------------------------+
                                        |
                                        v
                    +-------------------------------------------+
                    |           PROCESSED_VIDEO.MP4             |
                    +-------------------------------------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/04_RENDERS/processed/
      v

STEP 6: MULTI-FORMAT EXPORT
============================
                    +-------------------------------------------+
                    |           PROCESSED_VIDEO.MP4             |
                    +-------------------------------------------+
                                        |
              +-------------------------+-------------------------+
              |                         |                         |
              v                         v                         v
+-------------------+      +-------------------+      +-------------------+
|                   |      |                   |      |                   |
|   9:16 VERTICAL   |      |    1:1 SQUARE     |      |  16:9 WIDESCREEN  |
|                   |      |                   |      |                   |
|   1080 x 1920     |      |   1080 x 1080     |      |   1920 x 1080     |
|                   |      |                   |      |                   |
| +---------------+ |      | +---------------+ |      | +---------------+ |
| |               | |      | |               | |      | |     VIDEO     | |
| |               | |      | |               | |      | |               | |
| |    VIDEO      | |      | |    VIDEO      | |      | +---------------+ |
| |               | |      | |               | |      |                   |
| |               | |      | +---------------+ |      | Use: YouTube,     |
| +---------------+ |      |                   |      | Presentations     |
|                   |      | Use: Instagram,   |      |                   |
| Use: TikTok,      |      | LinkedIn          |      +-------------------+
| Reels, Shorts     |      |                   |
+-------------------+      +-------------------+
      |
      | Save to: ~/softworks-toolkit/projects/{client}/06_DELIVERABLES/
      v

STEP 7: DELIVERY PACKAGE
=========================
+-----------------------------------------------------------------------+
|                         FINAL DELIVERABLES                             |
+-----------------------------------------------------------------------+
|                                                                       |
|  ~/softworks-toolkit/projects/{client}/06_DELIVERABLES/               |
|  |                                                                    |
|  +-- videos/                                                          |
|  |   +-- Module_01_9x16.mp4                                           |
|  |   +-- Module_01_1x1.mp4                                            |
|  |   +-- Module_01_16x9.mp4                                           |
|  |                                                                    |
|  +-- thumbnails/                                                      |
|  |   +-- Module_01_thumb.png                                          |
|  |                                                                    |
|  +-- transcripts/                                                     |
|  |   +-- Module_01.srt                                                |
|  |   +-- Module_01.txt                                                |
|  |                                                                    |
|  +-- docs/                                                            |
|      +-- usage_guide.pdf                                              |
|      +-- technical_specs.txt                                          |
|                                                                       |
+-----------------------------------------------------------------------+
```

---

## 2.2 AI Image Generation Pipeline

### Complete Image Generation Flow

```
+==============================================================================+
|                    AI IMAGE GENERATION PIPELINE                              |
+==============================================================================+

  INPUT                        PROCESSING                         OUTPUT
  =====                        ==========                         ======

  +-----------+               +------------------------+         +-----------+
  |           |               |                        |         |           |
  |  PROMPT   |               |   +----------------+   |         | UPSCALED  |
  |  TEXT     |-------------->|   |    COMFYUI     |   |-------->| IMAGE     |
  |           |               |   +----------------+   |         |           |
  +-----------+               |          |             |         +-----------+
                              |          v             |
  +-----------+               |   +----------------+   |         +-----------+
  |           |               |   |   BASE MODEL   |   |         |           |
  | REFERENCE |-------------->|   | (Flux/SDXL)    |   |-------->| WEB       |
  | IMAGE     |               |   +----------------+   |         | OPTIMIZED |
  |           |               |          |             |         |           |
  +-----------+               |          v             |         +-----------+
                              |   +----------------+   |
  +-----------+               |   |  CONTROLNET    |   |         +-----------+
  |           |               |   |  (optional)    |   |         |           |
  | CONTROL   |-------------->|   +----------------+   |-------->| PRINT     |
  | INPUTS    |               |          |             |         | READY     |
  | (pose,etc)|               |          v             |         |           |
  +-----------+               |   +----------------+   |         +-----------+
                              |   |   UPSCALER     |   |
                              |   +----------------+   |
                              |                        |
                              +------------------------+
```

### Detailed ComfyUI Workflow

```
+==============================================================================+
|                    COMFYUI WORKFLOW - NODE BY NODE                           |
+==============================================================================+

  +---------------+     +---------------+     +---------------+
  |  CHECKPOINT   |     |    CLIP       |     |     VAE       |
  |    LOADER     |     |   ENCODE      |     |   DECODE      |
  |               |     |               |     |               |
  | Model: Flux   |---->| Prompt text   |---->| Latent->Image |
  | schnell       |     | Negative text |     |               |
  +-------+-------+     +-------+-------+     +-------+-------+
          |                     |                     |
          v                     v                     v
  +---------------------------------------------------------------+
  |                         K SAMPLER                             |
  |                                                               |
  |  +-----------------+  +-----------------+  +-----------------+ |
  |  | Steps: 20       |  | CFG: 7.0        |  | Sampler: euler  | |
  |  +-----------------+  +-----------------+  +-----------------+ |
  |                                                               |
  |  +-----------------+  +-----------------+  +-----------------+ |
  |  | Scheduler:      |  | Denoise: 1.0    |  | Seed: random    | |
  |  | normal          |  |                 |  |                 | |
  |  +-----------------+  +-----------------+  +-----------------+ |
  +---------------------------------------------------------------+
          |
          v
  +---------------------------------------------------------------+
  |                      POST PROCESSING                           |
  +---------------------------------------------------------------+
          |
          +-------------------+-------------------+
          |                   |                   |
          v                   v                   v
  +--------------+    +--------------+    +--------------+
  |  UPSCALE     |    | COLOR GRADE  |    |  SHARPEN     |
  |  (4x ESRGAN) |    | (LUT apply)  |    |  (optional)  |
  +--------------+    +--------------+    +--------------+
          |                   |                   |
          +-------------------+-------------------+
                              |
                              v
                    +------------------+
                    |   SAVE IMAGE     |
                    |                  |
                    | Format: PNG      |
                    | Quality: Max     |
                    | Metadata: On     |
                    +------------------+
```

### Prompt Engineering Template

```
+==============================================================================+
|                    PROMPT ENGINEERING TEMPLATE                               |
+==============================================================================+

  STRUCTURE:
  ==========

  +-----------------------------------------------------------------------+
  |  [SUBJECT] + [STYLE] + [COMPOSITION] + [LIGHTING] + [QUALITY]         |
  +-----------------------------------------------------------------------+

  EXAMPLE BREAKDOWN:
  ==================

  +-----------------+----------------------------------------------------+
  | SUBJECT         | "Professional business executive in navy suit"     |
  +-----------------+----------------------------------------------------+
  | STYLE           | "corporate photography, editorial, magazine cover" |
  +-----------------+----------------------------------------------------+
  | COMPOSITION     | "centered, head and shoulders, slight angle"       |
  +-----------------+----------------------------------------------------+
  | LIGHTING        | "soft studio lighting, rim light, subtle shadows"  |
  +-----------------+----------------------------------------------------+
  | QUALITY         | "8k, ultra detailed, professional, sharp focus"    |
  +-----------------+----------------------------------------------------+

  NEGATIVE PROMPT:
  ================

  +-----------------+----------------------------------------------------+
  | AVOID           | "blurry, low quality, distorted, amateur,          |
  |                 |  oversaturated, underexposed, grainy, noise"       |
  +-----------------+----------------------------------------------------+

  COMPLETE PROMPT:
  ================

  +-----------------------------------------------------------------------+
  | "Professional business executive in navy suit, corporate photography, |
  |  editorial, magazine cover, centered, head and shoulders, slight     |
  |  angle, soft studio lighting, rim light, subtle shadows, 8k, ultra   |
  |  detailed, professional, sharp focus"                                 |
  +-----------------------------------------------------------------------+
```

---

## 2.3 Batch Processing Workflow

### Multi-Input Parallel Processing

```
+==============================================================================+
|                    BATCH PROCESSING WORKFLOW                                 |
+==============================================================================+

  BATCH INPUT                 PARALLEL PROCESSING              ORGANIZED OUTPUT
  ===========                 ===================              ================

  +-------------+
  | Input_01    |----+
  +-------------+    |
                     |        +------------------------+
  +-------------+    |        |    PROCESSING QUEUE    |
  | Input_02    |----+------->|                        |
  +-------------+    |        |  +-----------------+   |
                     |        |  | Worker Thread 1 |   |--------> Output_01
  +-------------+    |        |  +-----------------+   |
  | Input_03    |----+------->|  | Worker Thread 2 |   |--------> Output_02
  +-------------+    |        |  +-----------------+   |
                     |        |  | Worker Thread 3 |   |--------> Output_03
  +-------------+    |        |  +-----------------+   |
  | Input_04    |----+------->|  | Worker Thread 4 |   |--------> Output_04
  +-------------+    |        |  +-----------------+   |
                     |        |                        |
  +-------------+    |        | GPU Memory: 12GB       |
  | Input_05    |----+        | Batch Size: 4          |
  +-------------+             | Queue Depth: 10        |
                              +------------------------+
```

### Batch Job Configuration

```
+==============================================================================+
|                    BATCH JOB CONFIGURATION                                   |
+==============================================================================+

  JOB DEFINITION:
  ===============

  +-----------------------------------------------------------------------+
  |  batch_config.json                                                    |
  +-----------------------------------------------------------------------+
  |  {                                                                    |
  |    "job_name": "client_training_batch",                               |
  |    "input_directory": "~/projects/client/01_RAW/",                    |
  |    "output_directory": "~/projects/client/04_RENDERS/",               |
  |    "process_type": "avatar_animation",                                |
  |    "parallel_workers": 4,                                             |
  |    "settings": {                                                      |
  |      "output_formats": ["9x16", "1x1", "16x9"],                       |
  |      "quality": "high",                                               |
  |      "look_system": "luxury-tech"                                     |
  |    }                                                                  |
  |  }                                                                    |
  +-----------------------------------------------------------------------+

  EXECUTION FLOW:
  ===============

    +----------+     +----------+     +----------+     +----------+
    |  SCAN    |---->|  QUEUE   |---->| PROCESS  |---->|  VERIFY  |
    |  INPUTS  |     |  JOBS    |     |  BATCH   |     |  OUTPUT  |
    +----------+     +----------+     +----------+     +----------+
         |                |                |                |
         v                v                v                v
    Find all         Create job       Run workers      Validate
    valid files      queue with       in parallel      all outputs
    in input dir     priorities       (GPU limited)    exist & ok

  OUTPUT ORGANIZATION:
  ====================

  ~/projects/client/04_RENDERS/
  |
  +-- batch_20251226_143022/
  |   |
  |   +-- success/
  |   |   +-- Module_01/
  |   |   |   +-- Module_01_9x16.mp4
  |   |   |   +-- Module_01_1x1.mp4
  |   |   |   +-- Module_01_16x9.mp4
  |   |   |
  |   |   +-- Module_02/
  |   |       +-- Module_02_9x16.mp4
  |   |       +-- ...
  |   |
  |   +-- failed/
  |   |   +-- Module_05/
  |   |       +-- error.log
  |   |       +-- input_backup/
  |   |
  |   +-- batch_report.json
  |   +-- batch_log.txt
```

---

# 3. Integration Patterns

## 3.1 ComfyUI + PersonaLive Integration

```
+==============================================================================+
|                    COMFYUI + PERSONALIVE INTEGRATION                         |
+==============================================================================+

  PRE-PROCESSING (ComfyUI)        ANIMATION (PersonaLive)        POST (ComfyUI)
  =======================        =====================          ==============

  +------------------+           +------------------+           +------------------+
  |                  |           |                  |           |                  |
  |  INPUT PORTRAIT  |           |  ANIMATED VIDEO  |           |  FINAL OUTPUT    |
  |                  |           |                  |           |                  |
  +--------+---------+           +--------+---------+           +--------+---------+
           |                              |                              |
           v                              |                              ^
  +------------------+                    |                     +------------------+
  | FACE RESTORATION |                    |                     | VIDEO UPSCALE    |
  | - GFPGAN         |                    |                     | - Temporal       |
  | - CodeFormer     |                    |                     | - Frame-aware    |
  +--------+---------+                    |                     +--------+---------+
           |                              |                              ^
           v                              |                              |
  +------------------+                    |                     +------------------+
  | COLOR CORRECT    |                    |                     | COLOR GRADE      |
  | - White balance  |                    |                     | - LUT apply      |
  | - Exposure       |                    |                     | - Match look     |
  +--------+---------+                    |                     +--------+---------+
           |                              |                              ^
           v                              |                              |
  +------------------+                    v                     +------------------+
  | ENHANCE QUALITY  |           +------------------+           | ADD OVERLAYS     |
  | - Upscale        |---------->| PERSONALIVE      |---------->| - Brand          |
  | - Sharpen        |           | ANIMATION        |           | - HUD            |
  +------------------+           | ENGINE           |           | - Titles         |
                                 +------------------+           +------------------+

  INTEGRATION API:
  ================

  +-----------------------------------------------------------------------+
  |  ComfyUI Workflow Node Configuration                                  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [Load Portrait] -> [Face Restore] -> [Enhance] -> [Save Temp]        |
  |                                                                       |
  |  [External Process: PersonaLive]                                      |
  |       |                                                               |
  |       +-> Input: temp_portrait.png, audio.mp3                         |
  |       +-> Output: animated_raw.mp4                                    |
  |                                                                       |
  |  [Load Video] -> [Upscale] -> [Color Grade] -> [Overlay] -> [Export]  |
  |                                                                       |
  +-----------------------------------------------------------------------+
```

## 3.2 ElevenLabs + PersonaLive Integration

```
+==============================================================================+
|                    ELEVENLABS + PERSONALIVE INTEGRATION                      |
+==============================================================================+

  TEXT SCRIPT                 VOICE SYNTHESIS              AVATAR ANIMATION
  ===========                 ===============              ================

  +------------------+        +------------------+        +------------------+
  |                  |        |                  |        |                  |
  | "Welcome to      |        |   ELEVENLABS     |        |   PERSONALIVE    |
  |  our training    |------->|   API            |------->|   ENGINE         |
  |  module..."      |        |                  |        |                  |
  |                  |        | Voice: Rachel    |        | Portrait + Audio |
  +------------------+        | Model: v2        |        | = Animated Video |
                              | Quality: High    |        |                  |
                              +------------------+        +------------------+

  DETAILED FLOW:
  ==============

  STEP 1: Script Preparation
  --------------------------
  +-----------------------------------------------------------------------+
  | Script File: training_module_01.txt                                   |
  +-----------------------------------------------------------------------+
  | [INTRO]                                                               |
  | Welcome to Module One of our training series.                         |
  | Today, we'll cover the fundamentals of...                             |
  |                                                                       |
  | [SECTION 1]                                                           |
  | The first concept to understand is...                                 |
  +-----------------------------------------------------------------------+

  STEP 2: ElevenLabs API Call
  ---------------------------
  +-----------------------------------------------------------------------+
  | generate_avatar_audio.py                                              |
  +-----------------------------------------------------------------------+
  |                                                                       |
  | from elevenlabs import generate, save                                 |
  |                                                                       |
  | audio = generate(                                                     |
  |     text=script_text,                                                 |
  |     voice="Rachel",  # or client voice clone ID                       |
  |     model="eleven_multilingual_v2",                                   |
  |     settings={                                                        |
  |         "stability": 0.75,                                            |
  |         "similarity_boost": 0.85,                                     |
  |         "style": 0.0,                                                 |
  |         "use_speaker_boost": True                                     |
  |     }                                                                 |
  | )                                                                     |
  |                                                                       |
  | save(audio, "module_01_audio.mp3")                                    |
  |                                                                       |
  +-----------------------------------------------------------------------+

  STEP 3: PersonaLive Processing
  ------------------------------
  +-----------------------------------------------------------------------+
  | Input Files:                                                          |
  |   - portrait.png (client headshot)                                    |
  |   - module_01_audio.mp3 (ElevenLabs output)                          |
  |                                                                       |
  | PersonaLive Settings:                                                 |
  |   - Acceleration: xformers                                            |
  |   - Output Resolution: 1920x1080                                      |
  |   - FPS: 30                                                           |
  |   - Audio Sync: Enabled                                               |
  |                                                                       |
  | Output:                                                               |
  |   - module_01_animated.mp4                                            |
  +-----------------------------------------------------------------------+

  VOICE OPTIONS:
  ==============

  +------------------+------------------+------------------+
  |  STOCK VOICES    |  VOICE CLONING   |  CUSTOM TRAINED  |
  +------------------+------------------+------------------+
  |                  |                  |                  |
  | - Rachel         | Client provides  | Deep training    |
  | - Josh           | 30+ sec sample   | with 3+ hours    |
  | - Arnold         | ->               | ->               |
  | - Bella          | Instant clone    | Professional     |
  | - Elli           | for quick use    | voice match      |
  |                  |                  |                  |
  | Cost: Per char   | Cost: Per char   | Cost: $150+      |
  | Use: Demos       | Use: Personalized| Use: Enterprise  |
  +------------------+------------------+------------------+
```

## 3.3 API-Driven Automation

```
+==============================================================================+
|                    API-DRIVEN AUTOMATION WORKFLOW                            |
+==============================================================================+

  CLIENT REQUEST                ORCHESTRATION                    DELIVERY
  ==============                =============                    ========

  +------------------+          +------------------+          +------------------+
  |  CLIENT PORTAL   |          |   AUTOMATION     |          |  CLOUD STORAGE   |
  |                  |          |   SERVER         |          |                  |
  |  Upload:         |          |                  |          |  Download:       |
  |  - Portrait      |--------->|  Process Queue   |--------->|  - Videos        |
  |  - Script        |          |  API Calls       |          |  - Thumbnails    |
  |  - Settings      |          |  Status Updates  |          |  - Transcripts   |
  |                  |          |                  |          |                  |
  +------------------+          +------------------+          +------------------+

  API ARCHITECTURE:
  =================

  +-----------------------------------------------------------------------+
  |                         API GATEWAY                                   |
  +-----------------------------------------------------------------------+
                                  |
          +-----------------------+-----------------------+
          |                       |                       |
          v                       v                       v
  +---------------+       +---------------+       +---------------+
  | /api/upload   |       | /api/process  |       | /api/status   |
  |               |       |               |       |               |
  | - Validate    |       | - Queue job   |       | - Job status  |
  | - Store files |       | - Trigger     |       | - Progress %  |
  | - Return ID   |       |   pipeline    |       | - ETA         |
  +---------------+       +---------------+       +---------------+
          |                       |                       |
          v                       v                       v
  +-----------------------------------------------------------------------+
  |                      JOB PROCESSING ENGINE                            |
  +-----------------------------------------------------------------------+
          |
          +--------+--------+--------+--------+
          |        |        |        |        |
          v        v        v        v        v
       Eleven   Persona  ComfyUI  FFmpeg   Cloud
       Labs     Live     API      Export   Upload

  AUTOMATION SCRIPT EXAMPLE:
  ==========================

  +-----------------------------------------------------------------------+
  | automated_avatar_pipeline.py                                          |
  +-----------------------------------------------------------------------+
  |                                                                       |
  | import asyncio                                                        |
  | from elevenlabs import generate                                       |
  | from comfyui_api import ComfyUIClient                                 |
  | from personalive_api import PersonaLiveClient                         |
  |                                                                       |
  | async def process_training_module(                                    |
  |     portrait_path: str,                                               |
  |     script_text: str,                                                 |
  |     voice_id: str,                                                    |
  |     output_dir: str                                                   |
  | ):                                                                    |
  |     # Step 1: Generate audio                                          |
  |     audio_path = await generate_audio(script_text, voice_id)          |
  |                                                                       |
  |     # Step 2: Pre-process portrait                                    |
  |     clean_portrait = await comfyui.enhance_portrait(portrait_path)    |
  |                                                                       |
  |     # Step 3: Animate                                                 |
  |     raw_video = await personalive.animate(clean_portrait, audio_path) |
  |                                                                       |
  |     # Step 4: Post-process                                            |
  |     final_video = await comfyui.post_process(raw_video)               |
  |                                                                       |
  |     # Step 5: Export formats                                          |
  |     await export_all_formats(final_video, output_dir)                 |
  |                                                                       |
  |     return {"status": "complete", "output_dir": output_dir}           |
  |                                                                       |
  +-----------------------------------------------------------------------+
```

---

# 4. Client Delivery Workflows

## 4.1 Multi-Format Export

```
+==============================================================================+
|                    MULTI-FORMAT EXPORT WORKFLOW                              |
+==============================================================================+

  SOURCE VIDEO                    FORMAT CONVERSION                OUTPUT
  ============                    =================                ======

  +-------------------+
  |                   |
  |   SOURCE VIDEO    |
  |   1920 x 1080     |
  |   30 fps          |
  |   H.264           |
  |                   |
  +--------+----------+
           |
           +------------------+------------------+------------------+
           |                  |                  |                  |
           v                  v                  v                  v
  +----------------+  +----------------+  +----------------+  +----------------+
  |                |  |                |  |                |  |                |
  |  9:16 VERTICAL |  |  1:1 SQUARE    |  | 16:9 WIDESCREEN|  |   THUMBNAIL    |
  |                |  |                |  |                |  |                |
  |  1080 x 1920   |  |  1080 x 1080   |  |  1920 x 1080   |  |  1920 x 1080   |
  |                |  |                |  |                |  |                |
  |  +----------+  |  |  +----------+  |  |  +----------+  |  |  +----------+  |
  |  |          |  |  |  |          |  |  |  |          |  |  |  |          |  |
  |  |  CROP    |  |  |  |  CROP    |  |  |  |  FULL    |  |  |  | EXTRACT  |  |
  |  |  CENTER  |  |  |  |  CENTER  |  |  |  |  FRAME   |  |  |  |  FRAME   |  |
  |  |          |  |  |  |          |  |  |  |          |  |  |  |          |  |
  |  |          |  |  |  +----------+  |  |  +----------+  |  |  +----------+  |
  |  |          |  |  |                |  |                |  |                |
  |  |          |  |  +----------------+  +----------------+  +----------------+
  |  +----------+  |
  |                |
  +----------------+

  FFMPEG COMMANDS:
  ================

  +-----------------------------------------------------------------------+
  | 9:16 Vertical (TikTok, Reels, Shorts)                                 |
  +-----------------------------------------------------------------------+
  | ffmpeg -i source.mp4 -vf "crop=607:1080:656:0,scale=1080:1920"       |
  |        -c:v libx264 -crf 18 -preset slow -c:a aac -b:a 192k          |
  |        output_9x16.mp4                                                |
  +-----------------------------------------------------------------------+

  +-----------------------------------------------------------------------+
  | 1:1 Square (Instagram, LinkedIn)                                      |
  +-----------------------------------------------------------------------+
  | ffmpeg -i source.mp4 -vf "crop=1080:1080:420:0,scale=1080:1080"      |
  |        -c:v libx264 -crf 18 -preset slow -c:a aac -b:a 192k          |
  |        output_1x1.mp4                                                 |
  +-----------------------------------------------------------------------+

  +-----------------------------------------------------------------------+
  | 16:9 Widescreen (YouTube, Web)                                        |
  +-----------------------------------------------------------------------+
  | ffmpeg -i source.mp4 -vf "scale=1920:1080"                           |
  |        -c:v libx264 -crf 18 -preset slow -c:a aac -b:a 192k          |
  |        output_16x9.mp4                                                |
  +-----------------------------------------------------------------------+

  +-----------------------------------------------------------------------+
  | Thumbnail Extraction                                                  |
  +-----------------------------------------------------------------------+
  | ffmpeg -i source.mp4 -ss 00:00:02 -vframes 1 thumbnail.png           |
  +-----------------------------------------------------------------------+
```

## 4.2 Quality Assurance Checkpoints

```
+==============================================================================+
|                    QUALITY ASSURANCE CHECKPOINTS                             |
+==============================================================================+

  QA STAGE 1: INPUT VALIDATION
  ============================

  +-----------------------------------------------------------------------+
  |  CHECKLIST: Input Assets                                    [ ] Pass  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [ ] Portrait resolution >= 2048x2048                                 |
  |  [ ] Portrait file format: PNG or TIFF                                |
  |  [ ] Portrait lighting: Even, no harsh shadows                        |
  |  [ ] Portrait expression: Neutral                                     |
  |  [ ] Portrait background: Clean, minimal distractions                 |
  |                                                                       |
  |  [ ] Script spell-checked and grammar-verified                        |
  |  [ ] Script timing markers present (if needed)                        |
  |  [ ] Script approved by client                                        |
  |                                                                       |
  |  [ ] Voice selection confirmed with client                            |
  |  [ ] Voice sample approved (if cloned)                                |
  |                                                                       |
  +-----------------------------------------------------------------------+

  QA STAGE 2: AUDIO VERIFICATION
  ==============================

  +-----------------------------------------------------------------------+
  |  CHECKLIST: Audio Quality                                   [ ] Pass  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [ ] No distortion or clipping                                        |
  |  [ ] Consistent volume throughout                                     |
  |  [ ] Natural pacing and rhythm                                        |
  |  [ ] Correct pronunciation of key terms                               |
  |  [ ] No background noise or artifacts                                 |
  |  [ ] Audio length matches expected duration                           |
  |                                                                       |
  |  Duration Expected: _______ min                                       |
  |  Duration Actual:   _______ min                                       |
  |                                                                       |
  +-----------------------------------------------------------------------+

  QA STAGE 3: ANIMATION REVIEW
  ============================

  +-----------------------------------------------------------------------+
  |  CHECKLIST: Animation Quality                               [ ] Pass  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [ ] Lip sync accurate to audio                                       |
  |  [ ] Natural head movement                                            |
  |  [ ] No visual artifacts or glitches                                  |
  |  [ ] Eye movement appears natural                                     |
  |  [ ] Expression appropriate to content                                |
  |  [ ] No uncanny valley effects                                        |
  |                                                                       |
  |  [ ] Frame rate consistent (30 fps)                                   |
  |  [ ] Resolution maintained throughout                                 |
  |  [ ] Audio/video sync maintained                                      |
  |                                                                       |
  +-----------------------------------------------------------------------+

  QA STAGE 4: POST-PROCESSING CHECK
  =================================

  +-----------------------------------------------------------------------+
  |  CHECKLIST: Final Video                                     [ ] Pass  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [ ] Look system applied correctly                                    |
  |  [ ] Color grading matches brand guidelines                           |
  |  [ ] Overlays/HUD positioned correctly                                |
  |  [ ] Brand logo visible and properly sized                            |
  |  [ ] Text/titles readable                                             |
  |                                                                       |
  |  [ ] 9:16 format: Subject properly framed                             |
  |  [ ] 1:1 format: Subject properly framed                              |
  |  [ ] 16:9 format: Subject properly framed                             |
  |                                                                       |
  |  [ ] Thumbnail representative of content                              |
  |  [ ] Transcript accurate to audio                                     |
  |                                                                       |
  +-----------------------------------------------------------------------+

  QA STAGE 5: DELIVERY VERIFICATION
  =================================

  +-----------------------------------------------------------------------+
  |  CHECKLIST: Deliverables Package                            [ ] Pass  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  [ ] All video formats present and playable                           |
  |  [ ] File naming follows convention                                   |
  |  [ ] Thumbnails present for all videos                                |
  |  [ ] Transcripts accurate (SRT and TXT)                               |
  |  [ ] Usage guide included                                             |
  |  [ ] Technical specs documented                                       |
  |                                                                       |
  |  [ ] Files uploaded to client portal                                  |
  |  [ ] Download links tested and working                                |
  |  [ ] Client notification sent                                         |
  |                                                                       |
  +-----------------------------------------------------------------------+

  QA FLOW DIAGRAM:
  ================

     START
       |
       v
  +----------+     FAIL     +----------+
  |  INPUT   |------------->|  REJECT  |
  |  CHECK   |              |  & FIX   |
  +----+-----+              +----+-----+
       |                         |
       | PASS                    |
       v                         |
  +----------+     FAIL          |
  |  AUDIO   |-------------------+
  |  CHECK   |
  +----+-----+
       |
       | PASS
       v
  +----------+     FAIL
  |  ANIM    |-------------------+
  |  CHECK   |                   |
  +----+-----+                   |
       |                         |
       | PASS                    |
       v                         |
  +----------+     FAIL          |
  |  POST    |-------------------+
  |  CHECK   |
  +----+-----+
       |
       | PASS
       v
  +----------+     FAIL
  | DELIVERY |-------------------+
  |  CHECK   |
  +----+-----+
       |
       | PASS
       v
    DELIVER
```

## 4.3 Client Handoff Procedures

```
+==============================================================================+
|                    CLIENT HANDOFF PROCEDURES                                 |
+==============================================================================+

  HANDOFF WORKFLOW:
  =================

  +------------------+     +------------------+     +------------------+
  |                  |     |                  |     |                  |
  |  FINALIZE        |---->|  PACKAGE         |---->|  DELIVER         |
  |  ASSETS          |     |  DELIVERABLES    |     |  TO CLIENT       |
  |                  |     |                  |     |                  |
  +------------------+     +------------------+     +------------------+
           |                        |                        |
           v                        v                        v
  - QA Approved            - Organize files          - Upload to portal
  - All formats done       - Create manifest         - Send notification
  - Docs complete          - Zip package             - Schedule call

  DELIVERY PACKAGE STRUCTURE:
  ===========================

  +-----------------------------------------------------------------------+
  |  Client_ProjectName_YYYYMMDD.zip                                      |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  +-- README.txt (First thing to read!)                                |
  |  |                                                                    |
  |  +-- videos/                                                          |
  |  |   +-- Module_01_Vertical_9x16.mp4                                  |
  |  |   +-- Module_01_Square_1x1.mp4                                     |
  |  |   +-- Module_01_Widescreen_16x9.mp4                                |
  |  |   +-- Module_02_Vertical_9x16.mp4                                  |
  |  |   +-- Module_02_Square_1x1.mp4                                     |
  |  |   +-- Module_02_Widescreen_16x9.mp4                                |
  |  |                                                                    |
  |  +-- thumbnails/                                                      |
  |  |   +-- Module_01_thumb.png                                          |
  |  |   +-- Module_02_thumb.png                                          |
  |  |                                                                    |
  |  +-- transcripts/                                                     |
  |  |   +-- Module_01.srt                                                |
  |  |   +-- Module_01.txt                                                |
  |  |   +-- Module_02.srt                                                |
  |  |   +-- Module_02.txt                                                |
  |  |                                                                    |
  |  +-- documentation/                                                   |
  |      +-- usage_guide.pdf                                              |
  |      +-- technical_specifications.pdf                                 |
  |      +-- platform_recommendations.pdf                                 |
  |                                                                       |
  +-----------------------------------------------------------------------+

  CLIENT COMMUNICATION TEMPLATE:
  ==============================

  +-----------------------------------------------------------------------+
  |  EMAIL: Delivery Notification                                         |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  Subject: Your Training Modules Are Ready - [Project Name]            |
  |                                                                       |
  |  Hi [Client Name],                                                    |
  |                                                                       |
  |  Great news! Your training modules are complete and ready for         |
  |  download.                                                            |
  |                                                                       |
  |  WHAT'S INCLUDED:                                                     |
  |  - [X] Training Module videos (3 format variants each)                |
  |  - [X] Thumbnails for each module                                     |
  |  - [X] Transcripts (SRT and TXT formats)                              |
  |  - [X] Usage guide and technical specifications                       |
  |                                                                       |
  |  DOWNLOAD LINK:                                                       |
  |  [Secure Link - Expires in 7 days]                                    |
  |                                                                       |
  |  NEXT STEPS:                                                          |
  |  1. Download and review all files                                     |
  |  2. Let us know if any revisions are needed                           |
  |  3. Schedule a handoff call if you'd like a walkthrough               |
  |                                                                       |
  |  Questions? Reply to this email or call [phone].                      |
  |                                                                       |
  |  Best regards,                                                        |
  |  [Your Name]                                                          |
  |  Pitch Film Studios                                                   |
  |                                                                       |
  +-----------------------------------------------------------------------+

  REVISION REQUEST HANDLING:
  ==========================

  +------------------+     +------------------+     +------------------+
  |                  |     |                  |     |                  |
  |  RECEIVE         |---->|  ASSESS          |---->|  EXECUTE         |
  |  REQUEST         |     |  SCOPE           |     |  REVISION        |
  |                  |     |                  |     |                  |
  +------------------+     +------------------+     +------------------+
           |                        |                        |
           v                        v                        v
  - Log request            - Minor: Included       - Make changes
  - Acknowledge            - Major: Quote cost     - Re-run QA
  - Set timeline           - Re-do: Quote full     - Re-deliver

  REVISION TIERS:
  ===============

  +-------------------+--------------------------------------------------+
  |  MINOR REVISION   |  Included in original quote                      |
  |  (No extra cost)  |  - Typo fixes in overlays                        |
  |                   |  - Minor color adjustment                        |
  |                   |  - Thumbnail swap                                |
  +-------------------+--------------------------------------------------+
  |  MAJOR REVISION   |  Additional fee ($50-150)                        |
  |  (Extra charge)   |  - Script changes requiring re-record            |
  |                   |  - Different look system                         |
  |                   |  - Additional format variants                    |
  +-------------------+--------------------------------------------------+
  |  RE-DO            |  Quote as new project (50% of original)          |
  |  (New quote)      |  - Different portrait                            |
  |                   |  - Complete script rewrite                       |
  |                   |  - Change of avatar style                        |
  +-------------------+--------------------------------------------------+
```

---

# 5. Revenue-Generating Workflows

## 5.1 Pilot Package ($4,500)

```
+==============================================================================+
|                    PILOT PACKAGE WORKFLOW - $4,500                           |
+==============================================================================+

  CLIENT ENGAGEMENT                PRODUCTION                   DELIVERY
  =================                ==========                   ========

  WEEK 1                          WEEK 2-3                     WEEK 4
  ------                          --------                     ------

  +------------------+            +------------------+         +------------------+
  |  DISCOVERY       |            |  PRODUCTION      |         |  HANDOFF         |
  |  CALL            |            |  SPRINT          |         |  & TRAINING      |
  +------------------+            +------------------+         +------------------+

  DAY 1-2                         DAY 8-18                     DAY 22-28
  +------------------+            +------------------+         +------------------+
  |                  |            |                  |         |                  |
  | - Understand     |            | - Audio Gen      |         | - Deliver files  |
  |   client needs   |            | - Animation      |         | - Client call    |
  | - Define modules |            | - Post-process   |         | - Usage training |
  | - Collect assets |            | - QA review      |         | - Support setup  |
  |                  |            |                  |         |                  |
  +------------------+            +------------------+         +------------------+

  PILOT PACKAGE INCLUDES:
  =======================

  +-----------------------------------------------------------------------+
  |                                                                       |
  |  DELIVERABLES:                                                        |
  |  +-- 3-5 Training Modules (3-5 min each)                             |
  |  +-- 3 Format Variants per module (9:16, 1:1, 16:9)                  |
  |  +-- Thumbnails for each module                                       |
  |  +-- Transcripts (SRT + TXT)                                         |
  |  +-- Usage Guide PDF                                                  |
  |                                                                       |
  |  SERVICES:                                                            |
  |  +-- Discovery consultation (1 hour)                                  |
  |  +-- Script review and optimization                                   |
  |  +-- Custom voice selection/cloning                                   |
  |  +-- 2 rounds of revisions                                            |
  |  +-- Handoff training call (30 min)                                   |
  |                                                                       |
  +-----------------------------------------------------------------------+

  COST BREAKDOWN:
  ===============

  +-----------------------------+---------------+---------------+
  |  ITEM                       |  COST         |  MARGIN       |
  +-----------------------------+---------------+---------------+
  |  ElevenLabs API usage       |  $150         |               |
  |  GPU compute time           |  $200         |               |
  |  Staff time (15 hrs @ $50)  |  $750         |               |
  |  Overhead & tools           |  $250         |               |
  +-----------------------------+---------------+---------------+
  |  TOTAL COST                 |  $1,350       |               |
  +-----------------------------+---------------+---------------+
  |  CLIENT PRICE               |  $4,500       |               |
  +-----------------------------+---------------+---------------+
  |  GROSS PROFIT               |  $3,150       |  ~70%         |
  +-----------------------------+---------------+---------------+

  TIMELINE:
  =========

  Week 1          Week 2          Week 3          Week 4
  +-------+       +-------+       +-------+       +-------+
  |DISCOV |       |PRODUCE|       |PRODUCE|       |DELIVER|
  |-------|       |-------|       |-------|       |-------|
  |Consult|       |Audio  |       |Post   |       |QA     |
  |Assets |       |Animate|       |Process|       |Handoff|
  |Scripts|       |Review |       |Export |       |Train  |
  +-------+       +-------+       +-------+       +-------+
      |               |               |               |
      v               v               v               v
   INTAKE          SPRINT 1       SPRINT 2        CLOSE
```

## 5.2 Per-Module Pricing ($150-220/unit)

```
+==============================================================================+
|                    PER-MODULE PRICING - $150-220/UNIT                        |
+==============================================================================+

  PRICING TIERS:
  ==============

  +------------------+------------------+------------------+
  |    STANDARD      |    ENHANCED      |    PREMIUM       |
  |    $150/unit     |    $185/unit     |    $220/unit     |
  +------------------+------------------+------------------+
  |                  |                  |                  |
  | - 3-5 min video  | - 3-5 min video  | - 3-5 min video  |
  | - Stock voice    | - Cloned voice   | - Custom voice   |
  | - Basic look     | - Enhanced look  | - Premium look   |
  | - 3 formats      | - 3 formats      | - 3 formats      |
  | - Transcript     | - Transcript     | - Transcript     |
  |                  | - Thumbnail      | - Thumbnail      |
  |                  |                  | - Motion graphics|
  |                  |                  | - 1 revision     |
  +------------------+------------------+------------------+

  VOLUME DISCOUNTS:
  =================

  +-----------------------------+---------------+
  |  QUANTITY                   |  DISCOUNT     |
  +-----------------------------+---------------+
  |  1-10 modules               |  0%           |
  |  11-25 modules              |  10%          |
  |  26-50 modules              |  15%          |
  |  51-100 modules             |  20%          |
  |  100+ modules               |  25%          |
  +-----------------------------+---------------+

  EXAMPLE: 25 ENHANCED MODULES
  ============================

  +-----------------------------------------------------------------------+
  |  Calculation:                                                         |
  |                                                                       |
  |  25 modules x $185/unit = $4,625                                      |
  |  Volume discount (10%):   -$462.50                                    |
  |  --------------------------------                                     |
  |  TOTAL:                   $4,162.50                                   |
  |                                                                       |
  |  Cost per module after discount: $166.50                              |
  +-----------------------------------------------------------------------+

  PRODUCTION EFFICIENCY AT SCALE:
  ================================

  Single Module:                    Batch of 25 Modules:

  +------------------+              +------------------+
  |  Setup: 30 min   |              |  Setup: 45 min   |  (shared)
  |  Audio: 15 min   |              |  Audio: 5 min/ea |  (batch API)
  |  Animate: 30 min |              |  Animate: 15 min |  (parallel)
  |  Post: 30 min    |              |  Post: 10 min    |  (template)
  |  Export: 15 min  |              |  Export: 5 min   |  (batch)
  +------------------+              +------------------+
  |  TOTAL: 2 hrs    |              |  TOTAL: ~1 hr/ea |
  +------------------+              +------------------+

  WORKFLOW FOR BULK ORDERS:
  =========================

  +------------------+     +------------------+     +------------------+
  |  BATCH PREP      |---->|  PARALLEL        |---->|  BATCH EXPORT    |
  |                  |     |  PROCESSING      |     |                  |
  +------------------+     +------------------+     +------------------+
         |                        |                        |
         v                        v                        v
  - All scripts ready      - Multiple GPU        - FFmpeg batch
  - All audio gen'd        - Queue all jobs      - Auto-organize
  - Templates set          - Monitor status      - QA sampling
```

## 5.3 Enterprise Setup ($18,000+)

```
+==============================================================================+
|                    ENTERPRISE SETUP - $18,000+                               |
+==============================================================================+

  ENTERPRISE PACKAGE COMPONENTS:
  ==============================

  +-----------------------------------------------------------------------+
  |                                                                       |
  |  BASE PACKAGE: $18,000                                                |
  |                                                                       |
  |  +-- Dedicated Cloud Instance                                         |
  |  |   - PersonaLive + ComfyUI deployed                                |
  |  |   - 24/7 availability                                              |
  |  |   - Auto-scaling based on usage                                    |
  |  |                                                                    |
  |  +-- Custom Avatar Setup                                              |
  |  |   - Professional portrait session                                  |
  |  |   - Custom voice cloning (deep training)                          |
  |  |   - Branded look system design                                     |
  |  |                                                                    |
  |  +-- Integration Package                                              |
  |  |   - API access to all services                                     |
  |  |   - Webhook notifications                                          |
  |  |   - SSO integration                                                |
  |  |                                                                    |
  |  +-- Training & Support                                               |
  |      - 5 hours training sessions                                      |
  |      - 3 months priority support                                      |
  |      - Documentation package                                          |
  |                                                                       |
  +-----------------------------------------------------------------------+

  ADD-ONS:
  ========

  +-----------------------------+---------------+
  |  OPTION                     |  PRICE        |
  +-----------------------------+---------------+
  |  Additional avatars         |  $3,000/each  |
  |  Multi-language support     |  $5,000       |
  |  Advanced analytics         |  $2,500       |
  |  Extended support (12 mo)   |  $6,000       |
  |  Custom workflow dev        |  $8,000+      |
  |  On-premise deployment      |  $25,000+     |
  +-----------------------------+---------------+

  ENTERPRISE DEPLOYMENT ARCHITECTURE:
  ====================================

  +-----------------------------------------------------------------------+
  |                      CLIENT INFRASTRUCTURE                            |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  +------------------+        +------------------+                     |
  |  |  CLIENT PORTAL   |        |  API GATEWAY     |                     |
  |  |  (Custom UI)     |<------>|  (Auth, Rate)    |                     |
  |  +------------------+        +--------+---------+                     |
  |                                       |                               |
  +---------------------------------------|-------------------------------+
                                          |
  +---------------------------------------|-------------------------------+
  |                      SOFTWORKS CLOUD                                  |
  +---------------------------------------|-------------------------------+
  |                                       v                               |
  |                    +------------------+------------------+            |
  |                    |                                     |            |
  |           +--------v--------+               +------------v-------+   |
  |           |  PERSONALIVE    |               |     COMFYUI        |   |
  |           |  CLUSTER        |               |     CLUSTER        |   |
  |           |                 |               |                    |   |
  |           | GPU: 4x A100    |               | GPU: 2x A100       |   |
  |           | Auto-scale      |               | Auto-scale         |   |
  |           +-----------------+               +--------------------+   |
  |                    |                                     |            |
  |                    +------------------+------------------+            |
  |                                       |                               |
  |                           +-----------v-----------+                   |
  |                           |   STORAGE CLUSTER     |                   |
  |                           |                       |                   |
  |                           |   - Models (500GB)    |                   |
  |                           |   - Client assets     |                   |
  |                           |   - Output cache      |                   |
  |                           +-----------------------+                   |
  |                                                                       |
  +-----------------------------------------------------------------------+

  IMPLEMENTATION TIMELINE:
  ========================

  MONTH 1                 MONTH 2                 MONTH 3
  +------------------+    +------------------+    +------------------+
  |  SETUP &         |    |  INTEGRATION &   |    |  LAUNCH &        |
  |  CONFIGURATION   |    |  TESTING         |    |  TRAINING        |
  +------------------+    +------------------+    +------------------+
         |                       |                       |
         v                       v                       v
  Week 1-2:               Week 5-6:               Week 9-10:
  - Cloud provisioning    - API integration       - Staff training
  - Base deployment       - SSO setup             - Workflow sessions

  Week 3-4:               Week 7-8:               Week 11-12:
  - Custom avatar         - UAT testing           - Go-live support
  - Look system design    - Performance tuning    - Documentation

  ROI FOR CLIENT:
  ===============

  +-----------------------------------------------------------------------+
  |  BEFORE (Traditional Video Production)                                |
  +-----------------------------------------------------------------------+
  |  Per training video: $2,000-5,000 (agency + talent + studio)          |
  |  Lead time: 2-4 weeks per video                                       |
  |  Updates: Full reshoot required                                       |
  +-----------------------------------------------------------------------+

  +-----------------------------------------------------------------------+
  |  AFTER (Enterprise Avatar System)                                     |
  +-----------------------------------------------------------------------+
  |  Setup cost: $18,000 (one-time)                                       |
  |  Per video cost: $50-100 (API + compute)                              |
  |  Lead time: Same day                                                  |
  |  Updates: Script change only, regenerate                              |
  +-----------------------------------------------------------------------+

  +-----------------------------------------------------------------------+
  |  BREAK-EVEN ANALYSIS                                                  |
  +-----------------------------------------------------------------------+
  |                                                                       |
  |  Traditional: 10 videos x $3,000 = $30,000                            |
  |  Enterprise:  $18,000 + (10 x $75) = $18,750                          |
  |                                                                       |
  |  SAVINGS AFTER 10 VIDEOS: $11,250                                     |
  |  SAVINGS AFTER 50 VIDEOS: $131,250                                    |
  |                                                                       |
  +-----------------------------------------------------------------------+
```

## 5.4 AI Setup Support Tiers

```
+==============================================================================+
|                    AI SETUP SUPPORT TIERS                                    |
+==============================================================================+

  +===========================================================================+
  |                           TIER 1: BASIC - $500                            |
  +===========================================================================+
  |                                                                           |
  |  TARGET: Solo creators, small businesses                                  |
  |  DURATION: 2-3 hours                                                      |
  |                                                                           |
  |  INCLUDES:                                                                |
  |  +-----------------------------------------------------------------------+|
  |  |  - ComfyUI installation on client machine                            ||
  |  |  - 2-3 base models configured (Flux, SDXL, etc.)                     ||
  |  |  - Basic workflow templates (5 pre-built)                            ||
  |  |  - 30-minute training call                                           ||
  |  |  - Quick-start guide PDF                                             ||
  |  +-----------------------------------------------------------------------+|
  |                                                                           |
  |  WORKFLOW:                                                                |
  |                                                                           |
  |  +----------+     +----------+     +----------+     +----------+          |
  |  | CONSULT  |---->| INSTALL  |---->| TRAIN    |---->| HANDOFF  |          |
  |  | 30 min   |     | 1 hour   |     | 30 min   |     | 30 min   |          |
  |  +----------+     +----------+     +----------+     +----------+          |
  |                                                                           |
  |  PROFIT: ~90% margin ($450 gross profit)                                  |
  |                                                                           |
  +===========================================================================+


  +===========================================================================+
  |                       TIER 2: PROFESSIONAL - $1,500                       |
  +===========================================================================+
  |                                                                           |
  |  TARGET: Creative professionals, agencies                                 |
  |  DURATION: 1 week                                                         |
  |                                                                           |
  |  INCLUDES:                                                                |
  |  +-----------------------------------------------------------------------+|
  |  |  Everything in Basic, PLUS:                                          ||
  |  |  - Full ComfyUI + essential custom nodes                             ||
  |  |  - Curated model library (10+ models)                                ||
  |  |  - 10 custom workflow templates                                      ||
  |  |  - 2-hour training session                                           ||
  |  |  - 30-day email support                                              ||
  |  |  - Best practices documentation                                      ||
  |  +-----------------------------------------------------------------------+|
  |                                                                           |
  |  WORKFLOW:                                                                |
  |                                                                           |
  |  DAY 1           DAY 2-3          DAY 4-5          DAY 6-7               |
  |  +----------+    +----------+     +----------+     +----------+          |
  |  | CONSULT  |    | INSTALL  |     | CUSTOMIZE|     | TRAIN &  |          |
  |  | & PLAN   |--->| & CONFIG |---->| WORKFLOWS|---->| HANDOFF  |          |
  |  +----------+    +----------+     +----------+     +----------+          |
  |                                                                           |
  |  PROFIT: ~85% margin ($1,275 gross profit)                                |
  |                                                                           |
  +===========================================================================+


  +===========================================================================+
  |                        TIER 3: ENTERPRISE - $5,000+                       |
  +===========================================================================+
  |                                                                           |
  |  TARGET: Businesses, production teams                                     |
  |  DURATION: 2-4 weeks                                                      |
  |                                                                           |
  |  INCLUDES:                                                                |
  |  +-----------------------------------------------------------------------+|
  |  |  Everything in Professional, PLUS:                                   ||
  |  |  - Dedicated cloud instance OR on-premise deployment                 ||
  |  |  - API integration with existing systems                             ||
  |  |  - Custom workflow development                                       ||
  |  |  - Team training (up to 5 people)                                    ||
  |  |  - 90-day priority support                                           ||
  |  |  - Quarterly optimization reviews                                    ||
  |  +-----------------------------------------------------------------------+|
  |                                                                           |
  |  WORKFLOW:                                                                |
  |                                                                           |
  |  WEEK 1          WEEK 2           WEEK 3           WEEK 4                |
  |  +----------+    +----------+     +----------+     +----------+          |
  |  | DISCOVER |    | BUILD    |     | INTEGRATE|     | TRAIN &  |          |
  |  | & PLAN   |--->| & DEPLOY |---->| & TEST   |---->| SUPPORT  |          |
  |  +----------+    +----------+     +----------+     +----------+          |
  |                                                                           |
  |  PROFIT: ~70% margin ($3,500+ gross profit)                               |
  |                                                                           |
  +===========================================================================+


  TIER COMPARISON CHART:
  ======================

  +------------------------+----------+----------+----------+
  |  FEATURE               |  BASIC   |   PRO    |  ENTER.  |
  +------------------------+----------+----------+----------+
  |  ComfyUI Install       |    X     |    X     |    X     |
  |  Custom Nodes          |    -     |    X     |    X     |
  |  Models Included       |   2-3    |   10+    |   20+    |
  |  Workflow Templates    |    5     |   10     |  Custom  |
  |  Training Time         |  30 min  |  2 hrs   |  5 hrs   |
  |  Support Duration      |    -     | 30 days  | 90 days  |
  |  Cloud Deployment      |    -     |    -     |    X     |
  |  API Integration       |    -     |    -     |    X     |
  |  Team Training         |    -     |    -     | Up to 5  |
  +------------------------+----------+----------+----------+
  |  PRICE                 |   $500   |  $1,500  |  $5,000+ |
  +------------------------+----------+----------+----------+

  UPSELL PATH:
  ============

                    +------------+
                    |   BASIC    |
                    |   $500     |
                    +-----+------+
                          |
          "Want custom workflows?"
                          |
                          v
                    +------------+
                    |    PRO     |
                    |  $1,500    |
                    +-----+------+
                          |
         "Need API access or team?"
                          |
                          v
                    +------------+
                    | ENTERPRISE |
                    |  $5,000+   |
                    +------------+
                          |
        "Need full avatar production?"
                          |
                          v
                    +------------+
                    |  PFS PILOT |
                    |  $4,500    |
                    +------------+
```

---

# 6. Quick Reference Cards

## 6.1 Digital Training Avatar - Quick Reference

```
+==============================================================================+
|               DIGITAL TRAINING AVATAR - QUICK REFERENCE CARD                 |
+==============================================================================+
|                                                                              |
|  INPUT CHECKLIST:                     PROCESSING STEPS:                      |
|  =================                    ==================                     |
|                                                                              |
|  [ ] Portrait (2048x2048+, PNG)       1. Generate audio (ElevenLabs)         |
|  [ ] Script (spell-checked)           2. Animate portrait (PersonaLive)      |
|  [ ] Voice selection                  3. Post-process (ComfyUI)              |
|  [ ] Brand guidelines                 4. Export formats (FFmpeg)             |
|                                                                              |
|  LOOK SYSTEMS:                        OUTPUT FORMATS:                        |
|  =============                        ===============                        |
|                                                                              |
|  - Realistic-Anonymous               - 9:16  (1080x1920) - TikTok, Reels    |
|  - Luxury-Tech (HUD)                 - 1:1   (1080x1080) - Instagram         |
|                                       - 16:9  (1920x1080) - YouTube          |
|                                                                              |
|  COMMANDS:                                                                   |
|  =========                                                                   |
|                                                                              |
|  Start PersonaLive:  ~/softworks-toolkit/scripts/start_personalive.sh       |
|  Start ComfyUI:      ~/softworks-toolkit/scripts/start_comfyui.sh           |
|  Health Check:       python ~/softworks-toolkit/scripts/health_check.py     |
|                                                                              |
|  ACCESS POINTS:                                                              |
|  ==============                                                              |
|                                                                              |
|  PersonaLive:  http://localhost:7860                                         |
|  ComfyUI:      http://localhost:8188                                         |
|                                                                              |
+==============================================================================+
```

## 6.2 ComfyUI Image Generation - Quick Reference

```
+==============================================================================+
|               COMFYUI IMAGE GENERATION - QUICK REFERENCE CARD                |
+==============================================================================+
|                                                                              |
|  MODELS AVAILABLE:                    QUICK SETTINGS:                        |
|  =================                    ===============                        |
|                                                                              |
|  Image:                               Steps:     20 (fast) / 40 (quality)   |
|  - Flux.1 Schnell (fast)              CFG:       7.0 (default)              |
|  - Flux.1 Dev (quality)               Sampler:   euler                       |
|  - SDXL (compatible)                  Scheduler: normal                      |
|                                                                              |
|  PROMPT STRUCTURE:                    NEGATIVE PROMPT:                       |
|  =================                    ================                       |
|                                                                              |
|  [Subject] + [Style] +                blurry, low quality, distorted,        |
|  [Composition] + [Lighting] +         amateur, noise, grainy, artifacts      |
|  [Quality keywords]                                                          |
|                                                                              |
|  ESSENTIAL NODES:                     CUSTOM NODES:                          |
|  ================                     =============                          |
|                                                                              |
|  - Checkpoint Loader                  - ComfyUI-Manager (install first!)     |
|  - CLIP Text Encode                   - VideoHelperSuite                     |
|  - KSampler                           - Impact-Pack                          |
|  - VAE Decode                         - AnimateDiff-Evolved                  |
|  - Save Image                         - Advanced-ControlNet                  |
|                                                                              |
|  DIRECTORY STRUCTURE:                                                        |
|  ====================                                                        |
|                                                                              |
|  ~/softworks-toolkit/comfyui/                                                |
|  +-- models/checkpoints/    <- Put .safetensors here                         |
|  +-- models/loras/          <- Put LoRA files here                           |
|  +-- models/vae/            <- Put VAE files here                            |
|  +-- custom_nodes/          <- Custom nodes installed here                   |
|  +-- output/                <- Generated images saved here                   |
|                                                                              |
+==============================================================================+
```

## 6.3 Pricing Quick Reference

```
+==============================================================================+
|                      PRICING - QUICK REFERENCE CARD                          |
+==============================================================================+
|                                                                              |
|  PITCH FILM STUDIOS:                  SOFTWORKS TRADING:                     |
|  ===================                  ==================                     |
|                                                                              |
|  Pilot Package:        $4,500         Basic Setup:         $500              |
|  (3-5 modules, all formats)           (ComfyUI + 2-3 models)                 |
|                                                                              |
|  Per Module:                          Pro Setup:           $1,500            |
|  - Standard:           $150           (Full stack + 10 templates)            |
|  - Enhanced:           $185                                                  |
|  - Premium:            $220           Enterprise:          $5,000+           |
|                                       (Cloud + API + training)               |
|  Enterprise:           $18,000+                                              |
|  (Dedicated instance)                                                        |
|                                                                              |
|  VOLUME DISCOUNTS:                    MARGINS:                               |
|  =================                    ========                               |
|                                                                              |
|  11-25 modules:    10% off            Pilot Package:       ~70%              |
|  26-50 modules:    15% off            Per Module:          ~80%              |
|  51-100 modules:   20% off            Basic Setup:         ~90%              |
|  100+ modules:     25% off            Pro Setup:           ~85%              |
|                                       Enterprise:          ~70%              |
|                                                                              |
|  QUICK QUOTES:                                                               |
|  =============                                                               |
|                                                                              |
|  "I need 25 training videos" -> 25 x $185 x 0.90 = $4,162.50                 |
|  "Full avatar system"        -> Enterprise $18,000+                          |
|  "Just try it out"          -> Pilot $4,500                                 |
|  "Help me setup AI tools"   -> $500 / $1,500 / $5,000                       |
|                                                                              |
+==============================================================================+
```

## 6.4 Quality Assurance Quick Reference

```
+==============================================================================+
|                   QUALITY ASSURANCE - QUICK REFERENCE CARD                   |
+==============================================================================+
|                                                                              |
|  STAGE 1: INPUT                       STAGE 2: AUDIO                         |
|  ==============                       ==============                         |
|                                                                              |
|  [ ] Portrait 2048x2048+              [ ] No distortion/clipping             |
|  [ ] PNG or TIFF format               [ ] Consistent volume                  |
|  [ ] Even lighting                    [ ] Natural pacing                     |
|  [ ] Neutral expression               [ ] Correct pronunciations             |
|  [ ] Clean background                 [ ] No background noise                |
|                                                                              |
|  STAGE 3: ANIMATION                   STAGE 4: POST                          |
|  ==================                   =============                          |
|                                                                              |
|  [ ] Accurate lip sync                [ ] Look system applied                |
|  [ ] Natural head movement            [ ] Color grading correct              |
|  [ ] No visual artifacts              [ ] Brand elements present             |
|  [ ] 30 fps consistent                [ ] All 3 formats rendered             |
|  [ ] Audio/video in sync              [ ] Thumbnails generated               |
|                                                                              |
|  STAGE 5: DELIVERY                    REVISION POLICY:                       |
|  =================                    ================                       |
|                                                                              |
|  [ ] All formats playable             MINOR (included):                      |
|  [ ] Correct file naming              - Typo fixes                           |
|  [ ] Transcripts accurate             - Minor color tweaks                   |
|  [ ] Usage guide included                                                    |
|  [ ] Download link works              MAJOR ($50-150):                       |
|                                       - Script changes                       |
|                                       - New look system                      |
|                                                                              |
|                                       RE-DO (50% new):                       |
|                                       - Different portrait                   |
|                                       - Complete rewrite                     |
|                                                                              |
+==============================================================================+
```

## 6.5 Emergency Troubleshooting Quick Reference

```
+==============================================================================+
|                  EMERGENCY TROUBLESHOOTING - QUICK REFERENCE                 |
+==============================================================================+
|                                                                              |
|  PERSONALIVE ISSUES:                  COMFYUI ISSUES:                        |
|  ===================                  ===============                        |
|                                                                              |
|  "Out of memory"                      "Model not loading"                    |
|  -> Reduce output resolution          -> Check models/checkpoints/ path      |
|  -> Close other GPU apps              -> Verify .safetensors file size       |
|  -> Use xformers acceleration                                                |
|                                       "Black image output"                   |
|  "Audio not syncing"                  -> Check VAE is connected              |
|  -> Check audio format (MP3/WAV)      -> Verify CLIP text encoder            |
|  -> Ensure sample rate 44.1kHz                                               |
|                                       "Very slow generation"                 |
|  "Portrait not animating"             -> Enable MPS (Apple Silicon)          |
|  -> Check face detection              -> Reduce image size                   |
|  -> Use neutral expression photo      -> Lower step count                    |
|                                                                              |
|  ELEVENLABS ISSUES:                   GENERAL ISSUES:                        |
|  ==================                   ===============                        |
|                                                                              |
|  "API key invalid"                    "Python environment broken"            |
|  -> Check ELEVEN_API_KEY env          -> conda activate softworks            |
|  -> Verify billing active             -> pip install -r requirements.txt     |
|                                                                              |
|  "Voice sounds robotic"               "GPU not detected"                     |
|  -> Increase stability setting        -> python -c "import torch;            |
|  -> Use multilingual_v2 model            print(torch.backends.mps.           |
|                                          is_available())"                    |
|                                                                              |
|  HEALTH CHECK COMMAND:                                                       |
|  =====================                                                       |
|                                                                              |
|  python ~/softworks-toolkit/scripts/health_check.py                          |
|                                                                              |
|  RESTART COMMANDS:                                                           |
|  =================                                                           |
|                                                                              |
|  ComfyUI:      ~/softworks-toolkit/scripts/start_comfyui.sh                  |
|  PersonaLive:  ~/softworks-toolkit/scripts/start_personalive.sh              |
|                                                                              |
|  EMERGENCY CONTACT:                                                          |
|  ==================                                                          |
|                                                                              |
|  Technical Lead: agents@softworkstrading.com                                 |
|                                                                              |
+==============================================================================+
```

---

## Document Information

| Field | Value |
|-------|-------|
| **Created** | December 26, 2025 |
| **Version** | 1.0 |
| **Location** | `/Users/fredpro/softworks-toolkit/docs/WORKFLOW_REFERENCE.md` |
| **Maintainer** | Softworks Trading Company |

---

## Related Documents

- `/Users/fredpro/softworks-toolkit/SETUP_PLAN.md` - Complete setup instructions
- `/Users/fredpro/softworks-toolkit/RECOMMENDED_SAUCE.md` - Open source project recommendations
- `/Users/fredpro/softworks-toolkit/workflows/` - Workflow template files

---

*This document is designed to be printed for quick reference. Each section fits on standard letter-size pages when printed.*
