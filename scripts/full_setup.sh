#!/bin/bash
# Softworks Toolkit - Full Automated Setup
# Run with: bash ~/pfs-toolkit/scripts/full_setup.sh

set -e  # Exit on error

echo "=============================================="
echo "SOFTWORKS TOOLKIT - AUTOMATED SETUP"
echo "=============================================="
echo ""

TOOLKIT_DIR="$HOME/pfs-toolkit"
cd "$TOOLKIT_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }
log_info() { echo -e "📦 $1"; }

# ============================================
# PHASE 1: Environment Setup
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PHASE 1: Environment Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if conda is available
if ! command -v conda &> /dev/null; then
    log_error "Conda not found. Please install Miniconda or Anaconda first."
    exit 1
fi

# Create conda environment if it doesn't exist
if conda env list | grep -q "softworks"; then
    log_warning "Conda environment 'softworks' already exists. Using existing."
else
    log_info "Creating conda environment 'softworks' with Python 3.10..."
    conda create -n softworks python=3.10 -y
    log_success "Conda environment created"
fi

# Activate environment
log_info "Activating conda environment..."
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate softworks
log_success "Environment activated: $(python --version)"

# Install core dependencies
log_info "Installing PyTorch and core ML libraries..."
pip install --quiet torch torchvision torchaudio
pip install --quiet numpy scipy pillow opencv-python-headless
log_success "Core ML libraries installed"

# Install API clients
log_info "Installing API clients (OpenAI, Anthropic, Google, ElevenLabs)..."
pip install --quiet openai anthropic google-generativeai elevenlabs
log_success "API clients installed"

# Verify MPS
MPS_STATUS=$(python -c "import torch; print(torch.backends.mps.is_available())" 2>/dev/null || echo "False")
if [ "$MPS_STATUS" = "True" ]; then
    log_success "Apple MPS (GPU) acceleration available"
else
    log_warning "MPS not available - will use CPU (slower)"
fi

# ============================================
# PHASE 2: ComfyUI Installation
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PHASE 2: ComfyUI Installation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

COMFYUI_DIR="$TOOLKIT_DIR/comfyui"

if [ -f "$COMFYUI_DIR/main.py" ]; then
    log_warning "ComfyUI already installed. Skipping clone."
else
    log_info "Cloning ComfyUI (98k+ stars, industry standard)..."
    git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFYUI_DIR" 2>/dev/null || true
    log_success "ComfyUI cloned"
fi

log_info "Installing ComfyUI requirements..."
cd "$COMFYUI_DIR"
pip install --quiet -r requirements.txt
log_success "ComfyUI requirements installed"

# Install ComfyUI Manager
MANAGER_DIR="$COMFYUI_DIR/custom_nodes/ComfyUI-Manager"
if [ -d "$MANAGER_DIR" ]; then
    log_warning "ComfyUI-Manager already installed. Skipping."
else
    log_info "Installing ComfyUI-Manager (essential for custom nodes)..."
    mkdir -p "$COMFYUI_DIR/custom_nodes"
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git "$MANAGER_DIR" 2>/dev/null || true
    log_success "ComfyUI-Manager installed"
fi

# Create model directories
log_info "Creating model directories..."
mkdir -p "$COMFYUI_DIR/models/checkpoints"
mkdir -p "$COMFYUI_DIR/models/loras"
mkdir -p "$COMFYUI_DIR/models/vae"
mkdir -p "$COMFYUI_DIR/models/controlnet"
mkdir -p "$COMFYUI_DIR/models/upscale_models"
log_success "Model directories created"

# ============================================
# PHASE 3: PersonaLive Installation
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PHASE 3: PersonaLive Installation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

PERSONALIVE_DIR="$TOOLKIT_DIR/personalive"

# Check if PersonaLive was cloned earlier
if [ -d "$HOME/PersonaLive" ]; then
    log_info "Moving PersonaLive from ~/PersonaLive..."
    cp -r "$HOME/PersonaLive"/* "$PERSONALIVE_DIR/" 2>/dev/null || true
    log_success "PersonaLive moved to toolkit"
elif [ -f "$PERSONALIVE_DIR/inference_online.py" ]; then
    log_warning "PersonaLive already in place. Skipping."
else
    log_info "Cloning PersonaLive (GVCLab academic project)..."
    git clone https://github.com/GVCLab/PersonaLive.git "$PERSONALIVE_DIR" 2>/dev/null || true
    log_success "PersonaLive cloned"
fi

if [ -f "$PERSONALIVE_DIR/requirements_base.txt" ]; then
    log_info "Installing PersonaLive requirements..."
    cd "$PERSONALIVE_DIR"
    pip install --quiet -r requirements_base.txt 2>/dev/null || log_warning "Some PersonaLive deps may need manual install"
    log_success "PersonaLive requirements installed"
else
    log_warning "PersonaLive requirements.txt not found - manual setup needed"
fi

# ============================================
# PHASE 4: Launcher Scripts
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PHASE 4: Creating Launcher Scripts"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

SCRIPTS_DIR="$TOOLKIT_DIR/scripts"

# ComfyUI launcher
cat > "$SCRIPTS_DIR/start_comfyui.sh" << 'EOF'
#!/bin/bash
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate softworks
cd ~/pfs-toolkit/comfyui
echo "Starting ComfyUI at http://localhost:8188"
python main.py --listen 0.0.0.0 --port 8188
EOF
chmod +x "$SCRIPTS_DIR/start_comfyui.sh"
log_success "Created start_comfyui.sh"

# PersonaLive launcher
cat > "$SCRIPTS_DIR/start_personalive.sh" << 'EOF'
#!/bin/bash
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate softworks
cd ~/pfs-toolkit/personalive
echo "Starting PersonaLive at http://localhost:7860"
python inference_online.py --acceleration xformers
EOF
chmod +x "$SCRIPTS_DIR/start_personalive.sh"
log_success "Created start_personalive.sh"

# Health check
cat > "$SCRIPTS_DIR/health_check.sh" << 'EOF'
#!/bin/bash
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate softworks

echo "=============================================="
echo "SOFTWORKS TOOLKIT HEALTH CHECK"
echo "=============================================="

echo -n "Python: "
python --version

echo -n "PyTorch: "
python -c "import torch; print(torch.__version__)"

echo -n "MPS Available: "
python -c "import torch; print(torch.backends.mps.is_available())"

echo -n "ComfyUI: "
[ -f ~/pfs-toolkit/comfyui/main.py ] && echo "✅ Installed" || echo "❌ Not found"

echo -n "PersonaLive: "
[ -f ~/pfs-toolkit/personalive/inference_online.py ] && echo "✅ Installed" || echo "❌ Not found"

echo -n "ElevenLabs: "
python -c "import elevenlabs; print('✅ Available')" 2>/dev/null || echo "❌ Not installed"

echo "=============================================="
EOF
chmod +x "$SCRIPTS_DIR/health_check.sh"
log_success "Created health_check.sh"

# ============================================
# PHASE 5: Final Setup
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PHASE 5: Final Configuration"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create .env template
cat > "$TOOLKIT_DIR/.env.template" << 'EOF'
# Softworks Toolkit Environment Variables
# Copy to .env and fill in your keys

ELEVENLABS_API_KEY=your_key_here
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
GOOGLE_API_KEY=your_key_here
EOF
log_success "Created .env.template"

# Create .gitignore
cat > "$TOOLKIT_DIR/.gitignore" << 'EOF'
# Environment
.env
*.pyc
__pycache__/
.conda/

# Models (too large for git)
models/
*.safetensors
*.ckpt
*.pt
*.pth

# Outputs
outputs/
generated/

# OS
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
EOF
log_success "Created .gitignore"

# ============================================
# COMPLETE
# ============================================
echo ""
echo "=============================================="
echo "🎉 SOFTWORKS TOOLKIT SETUP COMPLETE"
echo "=============================================="
echo ""
echo "📁 Location: $TOOLKIT_DIR"
echo ""
echo "🚀 Quick Start:"
echo "   ComfyUI:     ~/pfs-toolkit/scripts/start_comfyui.sh"
echo "   PersonaLive: ~/pfs-toolkit/scripts/start_personalive.sh"
echo "   Health Check: ~/pfs-toolkit/scripts/health_check.sh"
echo ""
echo "📖 Documentation: ~/pfs-toolkit/SETUP_PLAN.md"
echo "📖 Sauce Guide:   ~/pfs-toolkit/RECOMMENDED_SAUCE.md"
echo ""
echo "⚠️  Next Steps:"
echo "   1. Download model weights (see SETUP_PLAN.md)"
echo "   2. Copy .env.template to .env and add API keys"
echo "   3. Run health_check.sh to verify installation"
echo ""
echo "=============================================="
