# MK Vox Studio

AI video studio for Windows — script to finished video on your own PC.
Forked from MK Story Studio v1.3.0, with a bigger voice system: free and
paid text-to-speech providers side by side, and an automatic fallback to
free Edge TTS so a production never stops for a missing or refused key.

## How to run (portable — no install)

1. Download `MKVoxStudio_v1.0.0_Portable.zip` from this repo's Releases.
2. Unzip it anywhere. You get one folder: `MK Vox Studio`.
3. Double-click **`MK Vox Studio.bat`** inside it.
4. The studio opens on localhost in its own app window. Done — no Setup,
   no Python install, nothing else.

The folder is self-contained: `runtime/` (bundled Python 3.14 + all
packages + Playwright Chromium), `app/` (the studio code, ffmpeg and
fonts) and the `.bat`. Move the folder anywhere; it just works. Your
projects, keys and settings live inside the folder (userdata), so a copy
of the folder is a full backup.

## Voice providers (bring your own keys — free tiers first)

Free, no key: **Edge TTS** (Microsoft). Local, no key: **Kokoro**.

Free with a free API key (monthly free quota):

- **Amazon Polly** — FREE: 5M chars/month for the first 12 months
  (needs AWS Access Key + Secret Key + Region)
- **Google Cloud TTS**, **Azure Speech** — free monthly quotas
- **Deepgram Aura** — $200 free credit on signup
- **Fish Audio**, **ElevenLabs**, **Cartesia**, **Sarvam AI** — free tiers

Paid: ElevenLabs / Cartesia plans, OpenAI TTS, AI33 (the original
production engine), and the paid tiers of all of the above.

Pick the production engine under **API Keys → Voiceover Provider**. If
the chosen provider fails (quota over, key refused, service down), the
pipeline logs it clearly and re-speaks the script with free Edge TTS —
a film never ships voiceless. All keys are stored locally in one place
(`tts_keys.json` in the userdata folder) and are only ever sent to the
provider you picked.

## What is in this repo

- `vidgen/` — main studio dashboard, web UI (`dash.html`), video pipeline
- `bulkgen/` — script, prompt, voice and character engine
- `ai_avatar_pipeline/` — AI avatar generator scripts
- `launch_desktop_app.py` — desktop launcher (starts the server on a free
  port from 5154, opens the app window, cleans up on close)
- `MK Vox Studio.bat` — the portable double-click entry point
- `launcher.cs` — optional native .NET launcher source (not needed for
  the portable package; the `.bat` does the same job)
- `requirements.txt` — Python dependencies
- `HOW_IT_WORKS.md` — architecture and pipeline guide

## What is NOT in this repo

- `runtime/` — bundled Python + Playwright browsers (~1.3 GB assembled;
  ships inside the portable ZIP on the Releases page, not in git)
- `app/tools/` binaries — ffmpeg/ffprobe and display fonts (also in the ZIP)
- Browser profiles, API keys, cloned voices, session files — personal
  data, never committed, never shipped

## Updates

The in-app updater checks this repo's GitHub Releases
(`mohdkhan-lab/mk-vox-studio`). Keep this repository PRIVATE — it is a
fork of a purchased tool, not a public release.
