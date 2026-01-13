#!/bin/bash
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate pfs
cd ~/pfs-toolkit/personalive
echo "Starting PersonaLive at http://localhost:7860"
python inference_online.py --acceleration xformers
