F5-TTS: Ein Märchenerzähler, der flüssige und treue Sprache mit Flow-Matching simuliert
=======================================================================================

### CPU-Only Inference-Fork mit Auto-Installer und Launcher von @Raxephion

Dieser Fork wurde angepasst, um einen reibungslosen und stabilen Betrieb auf **rein CPU-basierten** Maschinen zu gewährleisten. Er behebt kritische Fehler, die auftreten, wenn das Original-Repository ohne dedizierte GPU genutzt wird.

**Getestet auf:**

*   **CPU:** Intel(R) Core(TM) i5-10210U CPU @ 1.60GHz (2.11 GHz)
    
*   **RAM:** 16 GB
    

### Über diesen Fork und wichtige Änderungen

Diese Version enthält spezifische Anpassungen für stabile CPU-Inferenz:

*   **Code-Update:** Das Inferenz-Skript (src/f5\_tts/infer/utils\_infer.py) wurde geändert, um einen Absturz beim Start (AttributeError: module 'torch' has no attribute 'xpu') bei einer CPU-only PyTorch-Installation zu verhindern.
    
*   **Abhängigkeits-Update:** Die Projektabhängigkeitsdatei (pyproject.toml) wurde aktualisiert, um einen Low-Level-Bug in neueren PyTorch-Versionen zu beheben, der einen IndexError während der Audio-Transkription auf CPU verursachte.
    
    *   PyTorch ist nun auf eine bekannte stabile Version festgelegt: torch==2.1.2
        
    *   Das GPU-only Paket bitsandbytes wird nicht mehr installiert, wodurch Installationsfehler verhindert werden
        

Diese Änderungen stellen sicher, dass jeder dieses Repository klonen und auf einem Standard-CPU-System ausführen kann, ohne auf die ursprünglichen Fehler zu stoßen.

**F5-TTS**: Diffusions-Transformer mit ConvNeXt V2, schnellere Trainings- und Inferenzzeiten**E2 TTS**: Flat-UNet Transformer, bestmögliche Reproduktion laut [Paper](https://arxiv.org/abs/2406.18009)**Sway Sampling**: Inferenzzeit-Flow-Step-Sampling-Strategie, verbessert die Leistung erheblich

### Dank an alle Mitwirkenden!

Schnellstart (Windows)
----------------------

### 🔧 Installation

Wenn [Anaconda](https://www.anaconda.com/) oder [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installiert ist und conda im Terminal verfügbar ist:

1.  Repository herunterladen und nach C:\\F5-TTS-CPU\_ONLY extrahieren
    
2.  **Anaconda Prompt** oder ein Terminal mit Conda öffnen
    
3.  Ausführen:
    

install.bat

Dieses Skript wird:

*   Eine neue Conda-Umgebung F5-TTS-CPU\_ONLY erstellen
    
*   Die Umgebung aktivieren
    
*   Das Projekt im Editiermodus installieren
    

### ▶️ App starten

Nach der Installation kann die Gradio-App mit folgendem Befehl gestartet werden:

launch.bat

Dieses Skript wird:

*   Die richtige Umgebung aktivieren
    
*   Die Gradio-basierte TTS-Oberfläche starten
    

Manuelle Installation (falls nicht install.bat genutzt wird)
------------------------------------------------------------

conda create -n F5-TTS-CPU\_ONLY python=3.10conda activate F5-TTS-CPU\_ONLY

cd C:\\F5-TTS-CPU\_ONLY

pip install -e .

Inferenz (Gradio oder CLI)
--------------------------

### 1\. Gradio App

f5-tts\_infer-gradio

Optionale Flags:f5-tts\_infer-gradio --port 7860 --host 0.0.0.0f5-tts\_infer-gradio --share

### 2\. CLI Inferenz

Mit benutzerdefiniertem Input
=============================

f5-tts\_infer-cli --model F5TTS\_v1\_Base --ref\_audio "prompt.wav" --ref\_text "Transkription der Referenz-Audio" --gen\_text "Text, den das TTS-Modell generieren soll."

Standardkonfiguration nutzen
============================

f5-tts\_infer-cli

Mit benutzerdefiniertem TOML
============================

f5-tts\_infer-cli -c custom.toml

Multi-Voice/Story Konfiguration
===============================

f5-tts\_infer-cli -c src/f5\_tts/infer/examples/multi/story.toml

Training
--------

Web-UI-basiertes Fine-Tuning
============================

f5-tts\_finetune-gradio

Alternativ den Trainingsleitfaden für Accelerate-Workflows nutzen.

Entwicklung & Codequalität
--------------------------

pre-commit nutzen, um Code automatisch zu formatieren und zu prüfen:

pip install pre-commitpre-commit installpre-commit run --all-files

Danksagungen
------------

*   Brillante Arbeit von E2-TTS, einfach und effektiv
    
*   Emilia, WenetSpeech4TTS, LibriTTS, LJSpeech wertvolle Datensätze
    
*   lucidrains initiale CFM-Struktur, auch bfs18 für Diskussion
    
*   SD3 & Hugging Face diffusers DiT und MMDiT Code-Struktur
    
*   torchdiffeq als ODE-Löser, Vocos und BigVGAN als Vocoder
    
*   FunASR, faster-whisper, UniSpeech, SpeechMOS für Evaluierungstools
    
*   ctc-forced-aligner für Speech-Editing-Tests
    
*   mrfakename HuggingFace Space Demo
    
*   f5-tts-mlx Implementierung mit MLX-Framework von Lucas Newman
    
*   F5-TTS-ONNX ONNX Runtime Version von DakeQQ
    
*   Yuekai Zhang Triton und TensorRT-LLM Support
    

Zitation
--------

Wenn unsere Arbeit oder Codebasis nützlich ist, bitte zitieren:

@article{chen-etal-2024-f5tts, title={F5-TTS: Ein Märchenerzähler, der flüssige und treue Sprache mit Flow-Matching simuliert}, author={Yushen Chen und Zhikang Niu und Ziyang Ma und Keqi Deng und Chunhui Wang und Jian Zhao und Kai Yu und Xie Chen}, journal={arXiv preprint arXiv:2410.06885}, year={2024}}

Lizenz
------

Unser Code ist unter der MIT-Lizenz veröffentlicht.Die vortrainierten Modelle sind aufgrund der Trainingsdaten (Emilia), eines Open-World-Datensatzes, unter der CC-BY-NC Lizenz lizenziert.Entschuldigung für eventuelle Unannehmlichkeiten.
