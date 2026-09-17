# AI Batch Translator

A **Windows desktop translation tool**: batch-translate whole folders of `txt / json / md / csv / srt` files,
plus a **two-panel dialogue translator** for translating sentences on the fly. Arbitrary language pairs,
multiple API presets with one-click switching, **pure Python standard library — zero third-party dependencies**.

[简体中文](README.md) | **English**

[![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows&logoColor=white)](#requirements)
[![Dependencies](https://img.shields.io/badge/Dependencies-none-brightgreen.svg)](#requirements)
[![GitHub stars](https://img.shields.io/github/stars/HeSheng114514/AI-Batch-Translator?style=social)](https://github.com/HeSheng114514/AI-Batch-Translator)

---

## Screenshots

| Batch translation (main window) | Dialogue translation |
| :---: | :---: |
| ![Main window](screenshots/main.png) | ![Dialogue translator](screenshots/chat.png) |

## Features

- **Batch translation** — pick many files or a whole folder (recursive); results go to a separate output
  folder, **originals are never overwritten**.
- **Live progress bar** — advances per AI request batch, plus per-file request counts and timing in the log.
- **Any language pair** — two dropdowns (source → target), e.g. **English→Korean, Japanese→Vietnamese, Chinese→Japanese**,
  or "Auto detect" which decides by writing system (kana / hangul / Cyrillic / …).
- **Multiple API presets** — store several `Base URL + API Key + model` sets and switch with one click
  (DeepSeek / OpenAI / Qwen / GLM / Kimi …).
- **Dialogue translator window** — two large panels, sample phrase chips, tone (default / casual / formal),
  one-click copy and text-to-speech. **Translation only runs when you click ▶ Translate** (also `Ctrl+Enter`).
- **Smart format handling**
  - `json` — keeps structure and keys, translates string values only, skips URLs/paths/numbers/UUIDs/code identifiers;
  - `srt` — keeps indices and timecodes, translates subtitle text only;
  - `csv` — keeps header and layout, auto-detects `,` `;` `\t` delimiters;
  - `txt / md / log / text` — line by line, paragraph structure preserved.
- **Zero dependencies** — standard library only (tkinter + urllib), no `pip install` needed.
- **Encoding friendly** — auto-detects input UTF-8 / UTF-16 / GBK; output encoding selectable
  (UTF-8 / UTF-8 with BOM / GBK) so Excel opens CSV correctly.

## Requirements

- Windows 10 / 11
- Python 3.8+ (python.org installer includes tkinter; tick *Add Python to PATH*)
- Network access and an API key for any OpenAI-compatible endpoint

## Quick start

1. Clone the repo:
   ```bash
   git clone https://github.com/HeSheng114514/AI-Batch-Translator.git
   ```
2. Double-click **`start.bat`** (or run `python main.py`).
3. Click **Settings…** (bottom right) → **＋ New preset…**, fill in Base URL / API Key / model, then **Test connection**.
4. **Batch mode**: add files/folder → choose output folder → pick source → target → **▶ Start**.
5. **Dialogue mode**: click **💬 对话翻译** at the bottom → type on the left → click **▶ 翻译** (`Ctrl+Enter`).

## API configuration

| Service | Base URL | Model example |
| --- | --- | --- |
| DeepSeek | `https://api.deepseek.com/v1` | `deepseek-chat` |
| OpenAI | `https://api.openai.com/v1` | `gpt-4o-mini` |
| Qwen (compatible mode) | `https://dashscope.aliyuncs.com/compatible-mode/v1` | `qwen-plus` |
| Zhipu GLM | `https://open.bigmodel.cn/api/paas/v4` | `glm-4-flash` |
| Moonshot Kimi | `https://api.moonshot.cn/v1` | `moonshot-v1-8k` |

> 🔐 **API keys are stored in plain text in `config.json` next to the program** (local use only).
> The file is listed in `.gitignore` — never commit or share it.

## Supported languages

18 languages for both source (plus *Auto detect*) and target: English, Chinese, Japanese, Korean, French,
German, Russian, Spanish, Italian, Portuguese, Thai, Vietnamese, Arabic, Hindi, Greek, Dutch, Polish, Turkish.

- Text already in the target language is left untouched (e.g. Korean stays as-is in an EN→KO run).
- Latin-script languages (EN/FR/DE…) cannot be told apart by script; pick the one matching your content.

## Project layout

```
AI-Batch-Translator/
├─ main.py                    entry point
├─ app.py                     main window (batch translation + progress + presets)
├─ chat_window.py             dialogue translator (two panels, TTS, copy, tone)
├─ engine.py                  translation engine (txt/json/csv/srt pipeline + progress)
├─ ai_client.py               OpenAI-compatible client (urllib, no deps)
├─ langs.py                   language detection / dropdowns / direction pairs
├─ config.py                  settings I/O (config.json) + app identity
├─ start.bat                  double-click launcher
├─ samples/                   sample.txt / sample.json
├─ screenshots/               README images
├─ .gitignore / .gitattributes
├─ requirements.txt           note: no third-party dependencies
├─ CHANGELOG.md
└─ LICENSE                    GPL-3.0
```

## FAQ

1. **"Not configured" when starting** — create/select a preset in Settings and fill Base URL, API key and model.
2. **Test connection errors** — `401/403` invalid key or quota; `404` wrong Base URL (usually ends with `/v1`);
   `429` rate limited or out of credit.
3. **Stop mid-run** — click **Stop**; it stops after the current batch.
4. **Chinese text got translated** — check that source/target are not swapped, or use *Auto detect*.
5. **Speech keeps playing** — click 🔊 again to stop; closing the window or the app also stops it immediately.
6. **Garbled Chinese in Excel** — set output encoding to "UTF-8 with BOM" for CSV.

## Contributing

Issues and pull requests are welcome — please make sure `python -m py_compile *.py` passes.
If this tool helps you, a ⭐ star is appreciated.

## License

[GNU General Public License v3.0](LICENSE) © 2025 HeSheng114514
