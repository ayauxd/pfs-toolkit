# Pitch Film Studios - New Employee Guide
## What You'll Be Working With: The AI Production Toolkit

**Welcome to Pitch Film Studios (PFS)**

You're joining a team that uses cutting-edge AI technology to create something that was impossible just two years ago: **infinite-length, lifelike video content from a single photograph**.

This guide will show you exactly what our tools can do and how they fit together to serve our clients.

---

## Table of Contents

1. [What Does Pitch Film Studios Actually Do?](#1-what-does-pitch-film-studios-actually-do)
2. [The Three Core Tools You'll Use](#2-the-three-core-tools-youll-use)
3. [What Each Tool Can Produce](#3-what-each-tool-can-produce)
4. [The Complete Production Pipeline](#4-the-complete-production-pipeline)
5. [Our Look Systems (Visual Brand Identity)](#5-our-look-systems-visual-brand-identity)
6. [What You Can Create: Real Examples](#6-what-you-can-create-real-examples)
7. [Revenue Model: What We Sell](#7-revenue-model-what-we-sell)
8. [Quick Reference: Daily Operations](#8-quick-reference-daily-operations)

---

# 1. What Does Pitch Film Studios Actually Do?

## The Problem We Solve

Traditional corporate training video production is:
- **Expensive**: $2,000-5,000 per video (studio, crew, talent)
- **Slow**: 2-4 weeks per video
- **Inflexible**: Any change requires a complete reshoot
- **Inconsistent**: Different shoots = different lighting, energy, quality

## Our Solution: Digital Training Avatars

We create **AI-powered digital presenters** that:
- Cost **$50-100 per video** after initial setup
- Deliver **same-day turnaround**
- Update instantly with **script changes only**
- Maintain **perfect consistency** across all content

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE PFS VALUE PROPOSITION                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   TRADITIONAL VIDEO              PFS DIGITAL AVATAR             │
│   ==================             =================              │
│                                                                 │
│   Per video: $3,000              Setup: $4,500 (one-time)       │
│   Timeline: 3 weeks              Per video: $75                 │
│   Updates: Full reshoot          Updates: Change script         │
│                                                                 │
│   10 videos = $30,000            10 videos = $5,250             │
│   50 videos = $150,000           50 videos = $8,250             │
│                                                                 │
│   CLIENT SAVES: $141,750 AFTER 50 VIDEOS                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Who Are Our Clients?

- **Corporate L&D Teams**: Onboarding, compliance, skills training
- **Healthcare Organizations**: Patient education, staff training
- **Financial Services**: Regulatory training, client communications
- **Tech Companies**: Product tutorials, developer education
- **Consultancies**: Scalable delivery of expertise

---

# 2. The Three Core Tools You'll Use

Your daily work involves three AI systems working together:

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE PFS PRODUCTION STACK                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│                      ┌──────────────┐                           │
│                      │  ELEVENLABS  │                           │
│                      │              │                           │
│                      │ Voice Synth  │                           │
│                      └──────┬───────┘                           │
│                             │ Audio                             │
│                             ▼                                   │
│   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐       │
│   │   PORTRAIT   │──▶│ PERSONALIVE  │──▶│   COMFYUI    │       │
│   │   (Photo)    │   │              │   │              │       │
│   └──────────────┘   │ Animation    │   │ Post-Process │       │
│                      │ Engine       │   │ & Export     │       │
│                      └──────────────┘   └──────┬───────┘       │
│                                                │               │
│                                                ▼               │
│                                    ┌───────────────────┐       │
│                                    │  FINAL VIDEO      │       │
│                                    │  9:16 / 1:1 / 16:9│       │
│                                    └───────────────────┘       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Tool 1: ElevenLabs (Voice Generation)

**What it is**: An AI voice synthesis platform that creates natural-sounding speech from text.

**What it does for us**:
- Converts training scripts into professional voice audio
- Offers 100+ stock voices in multiple languages
- Can clone a specific person's voice from a 30-second sample
- Produces broadcast-quality audio instantly

**Where you access it**: API integration via our scripts

**Key capability**: Turn any written script into spoken audio in minutes, not hours.

```
INPUT:  "Welcome to Module 3. Today we'll cover customer service best practices..."
OUTPUT: Natural-sounding MP3 audio file, ready for animation
```

---

## Tool 2: PersonaLive (Portrait Animation)

**What it is**: A real-time AI system that animates static photographs into talking videos.

**What it does for us**:
- Takes ONE portrait photo
- Takes ONE audio file
- Produces INFINITE-LENGTH video of that person "speaking" the audio
- Includes natural lip sync, head movement, eye tracking, and subtle expressions

**Where you access it**: http://localhost:7860

**Key capability**: Generate a 30-minute training video from a single headshot.

```
┌─────────────────────────────────────────────────────────────────┐
│                    PERSONALIVE CAPABILITIES                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   INPUT                           OUTPUT                        │
│   =====                           ======                        │
│                                                                 │
│   ┌───────────┐                   ┌───────────────────────┐     │
│   │           │                   │                       │     │
│   │  Single   │                   │  Animated Video       │     │
│   │  Portrait │  + Audio File  ──▶│                       │     │
│   │  Photo    │                   │  - Lip sync           │     │
│   │           │                   │  - Head movement      │     │
│   └───────────┘                   │  - Eye tracking       │     │
│                                   │  - Natural expression │     │
│   Requirements:                   │  - Infinite length    │     │
│   - 1024x1024+ pixels             │                       │     │
│   - Neutral expression            └───────────────────────┘     │
│   - Good lighting                                               │
│   - Face clearly visible                                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Technical specs on our system**:
- Runs on Apple Silicon Mac (24GB unified memory)
- Uses MPS (Metal Performance Shaders) for GPU acceleration
- Can process in real-time for live streaming applications
- Supports xformers acceleration for memory efficiency

---

## Tool 3: ComfyUI (Image/Video Processing)

**What it is**: A node-based visual AI engine for image and video processing.

**What it does for us**:
- Applies our branded "look systems" to raw PersonaLive output
- Adds overlays, HUD graphics, logos, lower thirds
- Color grades footage for consistent visual identity
- Exports to multiple aspect ratios (9:16, 1:1, 16:9)
- Can generate standalone AI images using Flux model

**Where you access it**: http://localhost:8188

**Key capability**: Transform raw animation into polished, branded content.

```
┌─────────────────────────────────────────────────────────────────┐
│                    COMFYUI CAPABILITIES                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   POST-PRODUCTION                 IMAGE GENERATION              │
│   ===============                 ================              │
│                                                                 │
│   • Apply look systems            • Text-to-image (Flux)        │
│   • Color grading                 • Image-to-image transform    │
│   • Add brand overlays            • Style transfer              │
│   • Insert HUD graphics           • Upscaling (4x ESRGAN)       │
│   • Lower thirds / titles         • Face restoration            │
│   • Multi-format export           • ControlNet pose matching    │
│                                                                 │
│   AVAILABLE MODELS (Installed):                                 │
│   ────────────────────────────                                  │
│   • flux1-schnell-fp8 (16GB) - Fast image generation            │
│   • clip_l (235MB) - Text understanding                         │
│   • t5xxl_fp8 (4.6GB) - Advanced text encoding                  │
│   • flux-vae-bf16 (160MB) - Image decoding                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

# 3. What Each Tool Can Produce

## ElevenLabs Output Examples

| Input | Output | Use Case |
|-------|--------|----------|
| 500-word script | 3-minute audio file | Single training module |
| 2,000-word script | 12-minute audio file | Full lesson |
| Client voice sample (30 sec) | Cloned voice model | Personalized content |
| Script in English | Audio in 29 languages | International training |

**Audio quality**: Broadcast-ready, 44.1kHz MP3/WAV

---

## PersonaLive Output Examples

| Input | Output | Duration | Quality |
|-------|--------|----------|---------|
| Portrait + 3-min audio | Talking head video | 3 minutes | 1080p @ 30fps |
| Portrait + 30-min audio | Full training course | 30 minutes | 1080p @ 30fps |
| Portrait + live stream | Real-time avatar | Unlimited | 720p @ 25fps |

**What makes it realistic**:
- Lip movements match phonemes in audio
- Natural head sway and micro-movements
- Eye tracking simulates engagement
- Expressions adapt to speech content

---

## ComfyUI Output Examples

| Task | Input | Output |
|------|-------|--------|
| Look system application | Raw PersonaLive video | Branded, graded video |
| Multi-format export | 16:9 master | 9:16 + 1:1 + 16:9 versions |
| Thumbnail generation | Video file | PNG thumbnail image |
| AI image generation | Text prompt | High-quality image |
| Upscaling | 512x512 image | 2048x2048 image |

---

# 4. The Complete Production Pipeline

This is the step-by-step process for creating a Digital Training Avatar module:

```
┌─────────────────────────────────────────────────────────────────┐
│              COMPLETE PFS PRODUCTION PIPELINE                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  DAY 1: CLIENT INTAKE                                           │
│  ════════════════════                                           │
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │  PORTRAIT   │  │   SCRIPT    │  │   VOICE     │             │
│  │   PHOTO     │  │   TEXT      │  │  SELECTION  │             │
│  │             │  │             │  │             │             │
│  │ From client │  │ Approved    │  │ Stock or    │             │
│  │ or photo    │  │ training    │  │ client      │             │
│  │ session     │  │ content     │  │ clone       │             │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘             │
│         │                │                │                     │
│         └────────────────┼────────────────┘                     │
│                          ▼                                      │
│  DAY 2-3: PRODUCTION                                            │
│  ═══════════════════                                            │
│                                                                 │
│  STEP 1: Audio Generation (ElevenLabs)                          │
│  ┌─────────────────────────────────────────┐                    │
│  │  Script → ElevenLabs API → Audio.mp3    │                    │
│  │  Time: 5-10 minutes per module          │                    │
│  └─────────────────────────────────────────┘                    │
│                          │                                      │
│                          ▼                                      │
│  STEP 2: Portrait Animation (PersonaLive)                       │
│  ┌─────────────────────────────────────────┐                    │
│  │  Portrait + Audio → PersonaLive → Video │                    │
│  │  Time: Real-time to 2x video length     │                    │
│  └─────────────────────────────────────────┘                    │
│                          │                                      │
│                          ▼                                      │
│  STEP 3: Post-Processing (ComfyUI)                              │
│  ┌─────────────────────────────────────────┐                    │
│  │  Raw Video + Look System → Final Video  │                    │
│  │  Time: 15-30 minutes per module         │                    │
│  └─────────────────────────────────────────┘                    │
│                          │                                      │
│                          ▼                                      │
│  STEP 4: Multi-Format Export (FFmpeg)                           │
│  ┌─────────────────────────────────────────┐                    │
│  │  Master → 9:16 + 1:1 + 16:9 variants    │                    │
│  │  Time: 5 minutes per module             │                    │
│  └─────────────────────────────────────────┘                    │
│                          │                                      │
│                          ▼                                      │
│  DAY 4: DELIVERY                                                │
│  ═══════════════                                                │
│                                                                 │
│  ┌─────────────────────────────────────────┐                    │
│  │  DELIVERABLES PACKAGE:                  │                    │
│  │                                         │                    │
│  │  • Module_01_16x9.mp4 (YouTube)         │                    │
│  │  • Module_01_9x16.mp4 (TikTok/Reels)    │                    │
│  │  • Module_01_1x1.mp4 (Instagram)        │                    │
│  │  • Module_01_thumb.png                  │                    │
│  │  • Module_01.srt (captions)             │                    │
│  │  • Module_01.txt (transcript)           │                    │
│  └─────────────────────────────────────────┘                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Project Folder Structure

Every client project follows this structure:

```
~/projects/[ClientName]/
│
├── 01_RAW/
│   ├── portrait_original.jpg      # Client's headshot
│   └── scripts/
│       ├── module_01.txt          # Training script
│       ├── module_02.txt
│       └── module_03.txt
│
├── 02_SELECTS/
│   └── portrait_approved.png      # Approved, processed portrait
│
├── 03_PROMPTS/
│   └── audio/
│       ├── module_01.mp3          # ElevenLabs output
│       ├── module_02.mp3
│       └── module_03.mp3
│
├── 04_RENDERS/
│   ├── raw/                       # PersonaLive output
│   │   ├── module_01_raw.mp4
│   │   └── module_02_raw.mp4
│   └── processed/                 # ComfyUI output
│       ├── module_01_final.mp4
│       └── module_02_final.mp4
│
├── 05_SOW/
│   ├── agreement.pdf              # Client contract
│   └── project_notes.md           # Internal notes
│
└── 06_DELIVERABLES/
    ├── videos/
    │   ├── Module_01_16x9.mp4
    │   ├── Module_01_9x16.mp4
    │   ├── Module_01_1x1.mp4
    │   └── ...
    ├── thumbnails/
    │   └── Module_01_thumb.png
    └── transcripts/
        ├── Module_01.srt
        └── Module_01.txt
```

---

# 5. Our Look Systems (Visual Brand Identity)

PFS offers two signature visual styles that differentiate client content:

## Look System 1: Realistic-Anonymous

**Purpose**: Privacy-focused training where presenter identity is secondary

**Visual Characteristics**:
- Face blur or soft matte overlay
- Matte black background
- Clean, minimal aesthetic
- Professional but anonymous presenter

**Use Cases**:
- Compliance training (legal protection)
- Sensitive corporate communications
- Multi-market content (no cultural bias)
- Evergreen content (presenter never "ages")

```
┌─────────────────────────────────────────────────────────────────┐
│                    REALISTIC-ANONYMOUS LOOK                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│    BEFORE (Raw PersonaLive)       AFTER (Look System Applied)   │
│    ────────────────────────       ───────────────────────────   │
│                                                                 │
│    ┌───────────────────┐          ┌───────────────────┐        │
│    │                   │          │                   │        │
│    │   Clear face      │          │   Softened face   │        │
│    │   visible         │    ──▶   │   + matte overlay │        │
│    │                   │          │   + color grade   │        │
│    │   Natural BG      │          │   + dark BG       │        │
│    │                   │          │                   │        │
│    └───────────────────┘          └───────────────────┘        │
│                                                                 │
│    Color Palette: Blacks, charcoals, soft ivory               │
│    Typography: Clean sans-serif (Inter style)                   │
│    Mood: Professional, trustworthy, timeless                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Look System 2: Luxury-Tech (Stylized)

**Purpose**: Premium, futuristic content for tech-forward brands

**Visual Characteristics**:
- Graphite "exoskeleton" frame overlay
- Subtle HUD graphics (data visualization aesthetic)
- Light neon accent tracing
- High-tech dashboard feel

**Use Cases**:
- Technology company training
- Premium product launches
- Executive communications
- Innovation/R&D presentations

```
┌─────────────────────────────────────────────────────────────────┐
│                     LUXURY-TECH LOOK                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│    BEFORE (Raw PersonaLive)       AFTER (Look System Applied)   │
│    ────────────────────────       ───────────────────────────   │
│                                                                 │
│    ┌───────────────────┐          ┌───────────────────┐        │
│    │                   │          │ ╔═══════════════╗ │        │
│    │   Standard        │          │ ║   Enhanced    ║ │        │
│    │   presenter       │    ──▶   │ ║   presenter   ║ │        │
│    │                   │          │ ║ + HUD overlay ║ │        │
│    │   Plain BG        │          │ ║ + exoskeleton ║ │        │
│    │                   │          │ ╚═══════════════╝ │        │
│    └───────────────────┘          └───────────────────┘        │
│                                                                 │
│    Color Palette: Graphite, subtle neon, dark backgrounds       │
│    Graphics: Minimal HUD elements, data visualization style     │
│    Mood: Cutting-edge, premium, innovative                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

# 6. What You Can Create: Real Examples

## Example 1: Corporate Onboarding Series

**Client**: Financial services firm
**Need**: 12-module new hire training program

**What we delivered**:
- 12 x 5-minute training videos
- Single consistent presenter (digital avatar)
- Realistic-Anonymous look system
- All three aspect ratios per module
- Captions and transcripts

**Production time**: 5 days
**Client investment**: $4,500 pilot + $2,160 (12 modules @ $180)

---

## Example 2: Product Tutorial Library

**Client**: SaaS company
**Need**: Ongoing product tutorials for new features

**What we delivered**:
- Monthly batch of 4-6 tutorial videos
- Luxury-Tech look system (matches their brand)
- Quick turnaround (48 hours per module)
- Consistent presenter across all content

**Production time**: Ongoing monthly retainer
**Client investment**: $185/module (Enhanced tier)

---

## Example 3: Multilingual Training

**Client**: Global manufacturing company
**Need**: Safety training in 5 languages

**What we delivered**:
- Same visual content, 5 language audio tracks
- ElevenLabs multilingual synthesis
- Localized captions for each language
- Single production, 5x output

**Production time**: 1 week
**Client investment**: $4,500 pilot + translation upcharges

---

## Example 4: Live Event Avatar

**Client**: Conference organizer
**Need**: AI host for virtual segments

**What we delivered**:
- Real-time PersonaLive streaming
- Live avatar responding to event flow
- Luxury-Tech look for tech conference aesthetic

**Production time**: 1 day setup + live event
**Client investment**: $3,000/event

---

# 7. Revenue Model: What We Sell

## Service Tiers

```
┌─────────────────────────────────────────────────────────────────┐
│                    PFS SERVICE TIERS                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PILOT PACKAGE                                    $4,500        │
│  ═════════════                                                  │
│  • 3-5 training modules                                         │
│  • Portrait session or processing                               │
│  • Voice selection/cloning                                      │
│  • All three aspect ratios                                      │
│  • 2 rounds of revisions                                        │
│  • 30-minute handoff call                                       │
│                                                                 │
│  Margin: ~70% ($3,150 gross profit)                             │
│  Timeline: 4 weeks                                              │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PER-MODULE PRICING                                             │
│  ═════════════════                                              │
│                                                                 │
│  ┌──────────────┬──────────┬────────────────────────────────┐  │
│  │ Tier         │ Price    │ Includes                       │  │
│  ├──────────────┼──────────┼────────────────────────────────┤  │
│  │ Standard     │ $150     │ Video + 3 formats + transcript │  │
│  │ Enhanced     │ $185     │ Standard + cloned voice        │  │
│  │ Premium      │ $220     │ Enhanced + motion graphics +   │  │
│  │              │          │ 1 revision                     │  │
│  └──────────────┴──────────┴────────────────────────────────┘  │
│                                                                 │
│  Margin: ~80%                                                   │
│                                                                 │
│  VOLUME DISCOUNTS:                                              │
│  • 11-25 modules: 10% off                                       │
│  • 26-50 modules: 15% off                                       │
│  • 51-100 modules: 20% off                                      │
│  • 100+ modules: 25% off                                        │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ENTERPRISE PACKAGE                               $18,000+      │
│  ════════════════════                                           │
│  • Dedicated cloud instance                                     │
│  • Custom avatar development                                    │
│  • API access for self-service                                  │
│  • 3 months priority support                                    │
│  • Team training (up to 5 people)                               │
│  • Unlimited renders during term                                │
│                                                                 │
│  Margin: ~60%                                                   │
│  Timeline: 3 months implementation                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Add-On Services

| Service | Price | What It Is |
|---------|-------|------------|
| Voice Cloning | $150 | Clone client's voice from sample |
| Look System Customization | $2,500-5,000 | Brand-specific visual identity |
| Additional Avatar | $3,000 | New presenter for same client |
| Multi-language Audio | +50% per language | Same video, different language |
| Rush Delivery (48hr) | +50% | Expedited production |
| Live Streaming Setup | $3,000/event | Real-time avatar for events |

---

# 8. Quick Reference: Daily Operations

## Starting Your Tools

```bash
# Terminal 1: Start ComfyUI (image/video processing)
~/softworks-toolkit/scripts/start_comfyui.sh
# Access at: http://localhost:8188

# Terminal 2: Start PersonaLive (avatar animation)
~/softworks-toolkit/scripts/start_personalive.sh
# Access at: http://localhost:7860

# Health check (verify everything works)
source /opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh
conda activate softworks
bash ~/softworks-toolkit/scripts/health_check.sh
```

---

## Quick Command Reference

| Task | Command/Location |
|------|------------------|
| Generate voice audio | `python ~/softworks-toolkit/scripts/generate_avatar_audio.py` |
| Start ComfyUI | `~/softworks-toolkit/scripts/start_comfyui.sh` |
| Start PersonaLive | `~/softworks-toolkit/scripts/start_personalive.sh` |
| Run health check | `~/softworks-toolkit/scripts/health_check.sh` |
| ComfyUI web interface | http://localhost:8188 |
| PersonaLive web interface | http://localhost:7860 |

---

## Portrait Requirements Checklist

Before accepting a client portrait:

- [ ] Resolution: 1024x1024 pixels minimum (2048x2048 preferred)
- [ ] Format: PNG or high-quality JPEG
- [ ] Expression: Neutral (slight smile acceptable)
- [ ] Lighting: Even, soft, no harsh shadows
- [ ] Face position: Centered, facing camera
- [ ] Background: Simple, non-distracting
- [ ] Obstructions: No sunglasses, masks, or heavy makeup
- [ ] Head angle: Straight to camera (no extreme angles)

---

## Quality Assurance Checkpoints

Before delivering to client:

**Audio Check**:
- [ ] No distortion or clipping
- [ ] Consistent volume throughout
- [ ] Correct pronunciation of key terms
- [ ] Natural pacing

**Animation Check**:
- [ ] Lip sync matches audio
- [ ] Natural head movement
- [ ] No visual glitches or artifacts
- [ ] Expression appropriate to content

**Post-Processing Check**:
- [ ] Look system applied correctly
- [ ] Brand elements present
- [ ] All three formats rendered
- [ ] File naming follows convention

**Delivery Check**:
- [ ] All files present and playable
- [ ] Transcripts accurate
- [ ] Thumbnails generated
- [ ] Download links working

---

## Key Contacts

| Role | Contact | For |
|------|---------|-----|
| Technical Lead | agents@softworkstrading.com | Tool issues, pipeline problems |
| Project Manager | [Your PM] | Client communications, timelines |
| Frederick (Founder) | Direct | Strategic decisions, new clients |

---

## Document Locations

| Document | Path |
|----------|------|
| This Guide | `~/softworks-toolkit/docs/PFS_NEW_EMPLOYEE_GUIDE.md` |
| Full Onboarding | `~/softworks-toolkit/docs/EMPLOYEE_ONBOARDING.md` |
| Workflow Diagrams | `~/softworks-toolkit/docs/WORKFLOW_REFERENCE.md` |
| Setup Instructions | `~/softworks-toolkit/SETUP_PLAN.md` |
| Tool Recommendations | `~/softworks-toolkit/RECOMMENDED_SAUCE.md` |

---

## Remember

**Our competitive advantage**:
1. **Speed**: Same-day turnaround vs. weeks for traditional video
2. **Cost**: 80% cheaper at scale
3. **Consistency**: Perfect presenter every time
4. **Flexibility**: Script changes = instant updates
5. **Scale**: One setup enables unlimited content

**The technology is impressive, but we sell the outcome**: Training content that's faster, cheaper, and more consistent than anything our clients could produce otherwise.

Welcome to the team.

---

*Document Version: 1.0*
*Last Updated: December 26, 2025*
*Location: /Users/fredpro/softworks-toolkit/docs/PFS_NEW_EMPLOYEE_GUIDE.md*
