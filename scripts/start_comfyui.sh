#!/bin/bash
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate softworks
cd ~/pfs-toolkit/comfyui
echo "Starting ComfyUI at http://localhost:8188"
python main.py --listen 0.0.0.0 --port 8188
