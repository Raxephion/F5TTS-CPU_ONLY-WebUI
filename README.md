# F5-TTS: A Fairytaler that Fakes Fluent and Faithful Speech with Flow Matching
### CPU-Only Inference Fork by @Raxephion

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

## News

- **2025/03/12**: 🔥 F5-TTS v1 base model with better training and inference performance. [Few demo](https://swivid.github.io/F5-TTS_updates)
- **2024/10/08**: F5-TTS & E2 TTS base models on:
  - [🤗 Hugging Face](https://huggingface.co/SWivid/F5-TTS)
  - [🤖 Model Scope](https://www.modelscope.cn/models/SWivid/F5-TTS_Emilia-ZH-EN)
  - [🟣 Wisemodel](https://wisemodel.cn/models/SJTU_X-LANCE/F5-TTS_Emilia-ZH-EN)

---

## Installation

### Step 1: Create a Separate Environment

```bash
# Create a Python 3.10 conda environment (or use virtualenv)
conda create -n f5-tts python=3.10
conda activate f5-tts
```

### Step 2: Install the Correct PyTorch Version for CPU (Crucial)

```bash
pip install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cpu
```

### Step 3: Clone this Repository and Install

```bash
git clone https://github.com/Raxephion/F5-TTS-CPU_ONLY.git
cd F5-TTS-CPU_ONLY
pip install -e .
```

---

## Inference

### 1. Gradio App

Currently supported features:
- Basic TTS with Chunk Inference
- Multi-Style / Multi-Speaker Generation
- Voice Chat powered by Qwen2.5-3B-Instruct
- Custom inference with more language support

```bash
# Launch Gradio app (web interface)
f5-tts_infer-gradio

# Specify the port/host
f5-tts_infer-gradio --port 7860 --host 0.0.0.0

# Launch a shareable link
f5-tts_infer-gradio --share
```

### 2. CLI Inference

```bash
# Run with arguments
f5-tts_infer-cli --model F5TTS_v1_Base \
--ref_audio "provide_prompt_wav_path_here.wav" \
--ref_text "The content, subtitle or transcription of reference audio." \
--gen_text "Some text you want TTS model generate for you."

# Run with default config
f5-tts_infer-cli

# Run with your own .toml config
f5-tts_infer-cli -c custom.toml

# Multi-voice example
f5-tts_infer-cli -c src/f5_tts/infer/examples/multi/story.toml
```

---

## Training

### 1. With Hugging Face Accelerate  
Refer to training & finetuning guidance for best practice.

### 2. With Gradio App

```bash
# Quick start with Gradio web interface
f5-tts_finetune-gradio
```

Read training & finetuning guidance for more instructions.

---

## Evaluation & Development

Use `pre-commit` to ensure code quality (will run linters and formatters automatically):

```bash
pip install pre-commit
pre-commit install
```

Before making a pull request, run:

```bash
pre-commit run --all-files
```

Note: Some model components have linting exceptions for E722 to accommodate tensor notation.

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

If our work and codebase is useful for you, please cite as:

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
Sorry for any inconvenience this may cause.
