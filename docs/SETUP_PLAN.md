# Softworks Toolkit - Complete Setup Plan
**Version:** 1.0
**Date:** December 26, 2025
**Mode:** YOLO (Full Automation)

---

## Overview

This plan sets up a complete AI media production and agent development stack for Frederick Aya's business ecosystem:

| Business | Primary Tools | Use Case |
|----------|--------------|----------|
| **Softworks Trading** | ComfyUI, Agent frameworks | AI consultancy, client setups |
| **Pitch Film Studios** | ComfyUI, PersonaLive, ElevenLabs | Digital training avatars, media production |
| **PrePurchasePro** | Mobile AI tools | Vehicle inspection automation |
| **Tiwa.ai** | Agent orchestration | White-label AI assistants |

---

## Phase 1: Environment Setup (5 min)

### 1.1 Create Isolated Python Environment
```bash
# Create dedicated conda environment for AI tools
conda create -n softworks python=3.10 -y
conda activate softworks

# Verify
python --version  # Should show 3.10.x
```

### 1.2 Install Core Dependencies
```bash
# PyTorch with MPS support (Apple Silicon)
pip install torch torchvision torchaudio

# Common ML libraries
pip install numpy scipy pillow opencv-python-headless

# API clients we already use
pip install openai anthropic google-generativeai elevenlabs
```

### 1.3 Verify GPU/MPS Access
```bash
python -c "import torch; print(f'MPS available: {torch.backends.mps.is_available()}')"
```

---

## Phase 2: ComfyUI Installation (10 min)

### 2.1 Install ComfyUI
```bash
cd ~/pfs-toolkit/comfyui

# Clone official repo
git clone https://github.com/comfyanonymous/ComfyUI.git .

# Install requirements
pip install -r requirements.txt

# Install ComfyUI Manager (essential for custom nodes)
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ..
```

### 2.2 Download Base Models
```bash
# Create model directories
mkdir -p models/checkpoints models/loras models/vae models/controlnet

# Download Flux.1-schnell (fast, good quality, 12GB)
# Via ComfyUI Manager or manually from HuggingFace
```

### 2.3 First Run Test
```bash
python main.py --listen 0.0.0.0 --port 8188

# Open http://localhost:8188
# Should see ComfyUI interface
```

### 2.4 Recommended Custom Nodes
Install via ComfyUI Manager:
- **ComfyUI-VideoHelperSuite** - Video I/O
- **ComfyUI-Impact-Pack** - Essential utilities
- **ComfyUI-AnimateDiff-Evolved** - Video generation
- **ComfyUI-Advanced-ControlNet** - Precise control

---

## Phase 3: PersonaLive Installation (15 min)

### 3.1 Setup PersonaLive
```bash
cd ~/pfs-toolkit/personalive

# Move cloned repo contents
mv ~/PersonaLive/* . 2>/dev/null || cp -r ~/PersonaLive/* .

# Install dependencies
pip install -r requirements_base.txt
```

### 3.2 Download Pretrained Weights
PersonaLive requires several model weights (~5GB total):
- LivePortrait weights
- Audio2Mesh weights
- Face detection models

```bash
# Download links are in the official README
# Store in: ~/pfs-toolkit/personalive/pretrained_weights/
```

### 3.3 Test Run
```bash
# Basic test with xformers acceleration
python inference_online.py --acceleration xformers

# Should open WebUI at localhost:7860
```

### 3.4 Integration with ElevenLabs
```bash
# Create audio generation script
cat > ~/softworks-toolkit/scripts/generate_avatar_audio.py << 'EOF'
import os
from elevenlabs import generate, save

def create_avatar_audio(text: str, voice_id: str, output_path: str):
    """Generate audio for PersonaLive avatar"""
    audio = generate(
        text=text,
        voice=voice_id,
        model="eleven_multilingual_v2"
    )
    save(audio, output_path)
    return output_path

if __name__ == "__main__":
    import sys
    text = sys.argv[1] if len(sys.argv) > 1 else "Hello, this is a test."
    create_avatar_audio(text, "default", "output.mp3")
EOF
```

---

## Phase 4: Workflow Templates (5 min)

### 4.1 PFS Digital Avatar Workflow
```bash
cat > ~/softworks-toolkit/workflows/pfs_avatar_pipeline.md << 'EOF'
# PFS Digital Training Avatar Pipeline

## Input Requirements
1. Portrait photo (high-res, neutral expression, good lighting)
2. Script text (what avatar will say)
3. Voice selection (ElevenLabs voice ID or client recording)

## Pipeline Steps
1. **Audio Generation** → ElevenLabs API → MP3 file
2. **Avatar Animation** → PersonaLive → Raw video
3. **Post-Processing** → ComfyUI → Apply look system
4. **Export** → FFmpeg → 9:16, 1:1, 16:9 versions

## Look Systems
- Realistic-Anonymous: Face blur + matte overlay
- Luxury-Tech: Graphite exoskeleton + HUD graphics

## Deliverables
- Training module video (MP4, H.264)
- Thumbnail image (PNG)
- Transcript (TXT/SRT)
EOF
```

### 4.2 Softworks Client Setup Workflow
```bash
cat > ~/softworks-toolkit/workflows/softworks_client_setup.md << 'EOF'
# Softworks AI Setup Service

## Tier 1: Basic Setup ($500)
- Install ComfyUI locally
- Configure 2-3 base models
- Basic usage training

## Tier 2: Professional Setup ($1,500)
- Full ComfyUI + custom nodes
- Curated model library
- Custom workflow templates
- 2-hour training session

## Tier 3: Enterprise Setup ($5,000+)
- Dedicated cloud instance
- API integration
- Custom agent development
- Ongoing support
EOF
```

---

## Phase 5: Security Hardening (2 min)

### 5.1 Copy Security Guardrails
```bash
cp ~/.claude/skills/repo-security-guardrails/skill.md ~/softworks-toolkit/security/

# Create pre-install checklist
cat > ~/softworks-toolkit/security/PRE_INSTALL_CHECKLIST.md << 'EOF'
# Pre-Installation Security Checklist

Before installing ANY external package or cloning ANY repo:

## Repo Verification
- [ ] Check star count (>100 for utilities, >1000 for frameworks)
- [ ] Verify it's NOT a fork (or fork has clear reason)
- [ ] Check last commit date (within 6 months)
- [ ] Review open issues for security concerns
- [ ] Confirm organization/author is legitimate

## Package Verification
- [ ] Check for postinstall scripts in package.json
- [ ] Verify package name matches official (no typosquatting)
- [ ] Review dependencies for known vulnerabilities
- [ ] Check npm/pypi download counts

## Code Review
- [ ] Scan for eval(), exec(), os.system() calls
- [ ] Check for network requests to unknown hosts
- [ ] Look for encoded/obfuscated strings
- [ ] Verify file system access is scoped

## Environment
- [ ] Using isolated conda/venv environment
- [ ] API keys in .env, not hardcoded
- [ ] .gitignore includes sensitive files
EOF
```

---

## Phase 6: Quick Reference Scripts (3 min)

### 6.1 Launcher Scripts
```bash
# ComfyUI launcher
cat > ~/softworks-toolkit/scripts/start_comfyui.sh << 'EOF'
#!/bin/bash
cd ~/pfs-toolkit/comfyui
conda activate softworks
python main.py --listen 0.0.0.0 --port 8188
EOF
chmod +x ~/softworks-toolkit/scripts/start_comfyui.sh

# PersonaLive launcher
cat > ~/softworks-toolkit/scripts/start_personalive.sh << 'EOF'
#!/bin/bash
cd ~/pfs-toolkit/personalive
conda activate softworks
python inference_online.py --acceleration xformers
EOF
chmod +x ~/softworks-toolkit/scripts/start_personalive.sh
```

### 6.2 Health Check Script
```bash
cat > ~/softworks-toolkit/scripts/health_check.py << 'EOF'
#!/usr/bin/env python3
"""Check all Softworks Toolkit components"""

import subprocess
import sys

checks = [
    ("Python 3.10", "python --version"),
    ("PyTorch", "python -c 'import torch; print(torch.__version__)'"),
    ("MPS Available", "python -c 'import torch; print(torch.backends.mps.is_available())'"),
    ("ComfyUI", "ls ~/pfs-toolkit/comfyui/main.py"),
    ("PersonaLive", "ls ~/pfs-toolkit/personalive/inference_online.py"),
    ("ElevenLabs", "python -c 'import elevenlabs; print(\"OK\")'"),
]

print("=" * 50)
print("SOFTWORKS TOOLKIT HEALTH CHECK")
print("=" * 50)

for name, cmd in checks:
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        status = "✅" if result.returncode == 0 else "❌"
        output = result.stdout.strip() or result.stderr.strip()
        print(f"{status} {name}: {output[:50]}")
    except Exception as e:
        print(f"❌ {name}: {e}")

print("=" * 50)
EOF
chmod +x ~/softworks-toolkit/scripts/health_check.py
```

---

## Phase 7: Revenue Integration (Reference)

### Service Offerings Enabled by This Toolkit

| Service | Tools Used | Price Point | Margin |
|---------|-----------|-------------|--------|
| **Digital Training Avatar - Pilot** | PersonaLive + ElevenLabs | $4,500 | ~70% |
| **Digital Training Avatar - Module** | PersonaLive + ElevenLabs | $150-220/unit | ~80% |
| **AI Media Production** | ComfyUI | $500-2,000/project | ~60% |
| **AI Setup Support - Basic** | ComfyUI install | $500 | ~90% |
| **AI Setup Support - Pro** | ComfyUI + workflows | $1,500 | ~85% |
| **Custom Agent Development** | LangChain + Claude | $5,000-20,000 | ~70% |

---

## Execution Commands (YOLO Mode)

Run this single command to execute the entire setup:

```bash
# Full setup script
bash ~/softworks-toolkit/scripts/full_setup.sh
```

Or run phases individually:
```bash
# Phase 1: Environment
conda create -n softworks python=3.10 -y && conda activate softworks && pip install torch torchvision torchaudio numpy scipy pillow opencv-python-headless openai anthropic google-generativeai elevenlabs

# Phase 2: ComfyUI
cd ~/pfs-toolkit/comfyui && git clone https://github.com/comfyanonymous/ComfyUI.git . && pip install -r requirements.txt && cd custom_nodes && git clone https://github.com/ltdrdata/ComfyUI-Manager.git

# Phase 3: PersonaLive
cd ~/pfs-toolkit/personalive && cp -r ~/PersonaLive/* . && pip install -r requirements_base.txt

# Phase 4-6: Workflows and Scripts
# (Already created by this plan)
```

---

## Post-Setup Verification

After running setup, verify with:
```bash
python ~/softworks-toolkit/scripts/health_check.py
```

Expected output:
```
✅ Python 3.10: Python 3.10.x
✅ PyTorch: 2.x.x
✅ MPS Available: True
✅ ComfyUI: main.py exists
✅ PersonaLive: inference_online.py exists
✅ ElevenLabs: OK
```

---

## Daily Operations

### Start Your Stack
```bash
# Terminal 1: ComfyUI
~/softworks-toolkit/scripts/start_comfyui.sh

# Terminal 2: PersonaLive
~/softworks-toolkit/scripts/start_personalive.sh
```

### Access Points
- ComfyUI: http://localhost:8188
- PersonaLive: http://localhost:7860

---

## Notes

- All tools run locally on your Mac
- No cloud dependencies except API calls (ElevenLabs, etc.)
- Models stored in ~/softworks-toolkit/models/
- Workflows saved in ~/softworks-toolkit/workflows/

**Total Setup Time:** ~35 minutes (with downloads)
**Disk Space Required:** ~20GB (with base models)
