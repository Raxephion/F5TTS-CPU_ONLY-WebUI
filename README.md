# F5-TTS: A Fairytaler that Fakes Fluent and Faithful Speech with Flow Matching
### CPU-Only Inference Fork with auto-installer and launcher by @Raxephion

This fork has been modified to ensure smooth and stable inference on **CPU-only** machines. It addresses critical bugs that occur when running the original repository without a dedicated GPU.

**Tested on:**
- **CPU:** Intel(R) Core(TM) i5-10210U CPU @ 1.60GHz (2.11 GHz)
- **RAM:** 16 GB

---

### About This Fork and Key Changes

This version includes specific fixes to enable stable CPU inference:
- **Code Update:** The inference script (`src/f5_tts/infer/utils_infer.py`) was modified to prevent a crash on startup (`AttributeError: module 'torch' has no attribute 'xpu'`) when using a CPU-only PyTorch installation.
- **Dependency Update:** The project's dependency file (`pyproject.toml`) was updated to resolve a low-level bug in newer PyTorch versions that caused an `IndexError` during audio transcription on CPU.
  - PyTorch is now pinned to a known stable version: `torch==2.1.2`
  - The GPU-only package `bitsandbytes` is no longer installed, preventing installation failures

These changes ensure that anyone can clone this repository and run it on a standard CPU without encountering the original errors.

---

[![python](https://img.shields.io/badge/Python-3.10-brightgreen)](https://github.com/SWivid/F5-TTS)
[![arXiv](https://img.shields.io/badge/arXiv-2410.06885-b31b1b.svg?logo=arXiv)](https://arxiv.org/abs/2410.06885)
[![demo](https://img.shields.io/badge/GitHub-Demo%20page-orange.svg)](https://swivid.github.io/F5-TTS/)
[![hfspace](https://img.shields.io/badge/🤗-Space%20demo-yellow)](https://huggingface.co/spaces/mrfakename/E2-F5-TTS)
[![msspace](https://img.shields.io/badge/🤖-Space%20demo-blue)](https://modelscope.cn/studios/modelscope/E2-F5-TTS)
[![lab](https://img.shields.io/badge/X--LANCE-Lab-grey?labelColor=lightgrey)](https://x-lance.sjtu.edu.cn/)
[![lab](https://img.shields.io/badge/Peng%20Cheng-Lab-grey?labelColor=lightgrey)](https://www.pcl.ac.cn)

---

**F5-TTS**: Diffusion Transformer with ConvNeXt V2, faster training and inference  
**E2 TTS**: Flat-UNet Transformer, closest reproduction from [paper](https://arxiv.org/abs/2406.18009)  
**Sway Sampling**: Inference-time flow step sampling strategy, greatly improves performance

### Thanks to all the contributors!

---

## Quick Start (Windows)

### 🔧 Installation

If you have [Anaconda](https://www.anaconda.com/) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installed and `conda` is available in your terminal:

1. Download and extract this repository to `C:\F5-TTS-CPU_ONLY`
2. Open **Anaconda Prompt** or a Conda-enabled terminal
3. Run:

```bat
install.bat
```

This script will:
- Create a new Conda environment `F5-TTS-CPU_ONLY`
- Activate the environment
- Install the project in editable mode

---

### ▶️ Launch the App

Once installed, you can start the Gradio app by running:

```bat
run.bat
```

This script will:
- Activate the correct environment
- Launch the Gradio-based TTS interface

---

## Manual Installation (if not using install.bat)

```bash
# Create conda environment
conda create -n F5-TTS-CPU_ONLY python=3.10
conda activate F5-TTS-CPU_ONLY

# Navigate to the folder
cd C:\F5-TTS-CPU_ONLY

# Install the project
pip install -e .
```

---

## Inference (Gradio or CLI)

### 1. Gradio App

```bash
f5-tts_infer-gradio

# Optional flags:
f5-tts_infer-gradio --port 7860 --host 0.0.0.0
f5-tts_infer-gradio --share
```

### 2. CLI Inference

```bash
# Run with custom input
f5-tts_infer-cli --model F5TTS_v1_Base \
--ref_audio "prompt.wav" \
--ref_text "transcription of reference audio" \
--gen_text "Text you want the TTS model to generate."

# Use default config
f5-tts_infer-cli

# With custom TOML
f5-tts_infer-cli -c custom.toml

# Multi-voice/story config
f5-tts_infer-cli -c src/f5_tts/infer/examples/multi/story.toml
```

---

## Training

```bash
# Web UI-based fine-tuning
f5-tts_finetune-gradio
```

Or refer to the training guide for Accelerate-based workflows.

---

## Development & Code Quality

Use `pre-commit` to automatically format and lint code:

```bash
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

---

## Acknowledgements

- E2-TTS brilliant work, simple and effective  
- Emilia, WenetSpeech4TTS, LibriTTS, LJSpeech valuable datasets  
- lucidrains initial CFM structure with also bfs18 for discussion  
- SD3 & Hugging Face diffusers DiT and MMDiT code structure  
- torchdiffeq as ODE solver, Vocos and BigVGAN as vocoder  
- FunASR, faster-whisper, UniSpeech, SpeechMOS for evaluation tools  
- ctc-forced-aligner for speech edit test  
- mrfakename HuggingFace Space demo  
- f5-tts-mlx implementation with MLX framework by Lucas Newman  
- F5-TTS-ONNX ONNX Runtime version by DakeQQ  
- Yuekai Zhang Triton and TensorRT-LLM support  

---

## Citation

If our work and codebase is useful for you, please cite:

```bibtex
@article{chen-etal-2024-f5tts,
  title={F5-TTS: A Fairytaler that Fakes Fluent and Faithful Speech with Flow Matching},
  author={Yushen Chen and Zhikang Niu and Ziyang Ma and Keqi Deng and Chunhui Wang and Jian Zhao and Kai Yu and Xie Chen},
  journal={arXiv preprint arXiv:2410.06885},
  year={2024},
}
```

---

## License

Our code is released under the MIT License.  
The pre-trained models are licensed under the CC-BY-NC license due to the training data (Emilia), which is an in-the-wild dataset.  
Sorry for any inconvenience this m
