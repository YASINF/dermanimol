# Dermanım Ol backend

FastAPI ile yazılmış API ve worker. Mimari: [../docs/04-teknik-mimari.md](../docs/04-teknik-mimari.md)

```bash
uv sync                                              # bağımlılıklar ve Python 3.12
cp .env.example .env                                 # yerel ayarlar
uv run fastapi dev src/dermanimol_backend/main.py    # http://127.0.0.1:8000/docs
uv run pytest                                        # testler
uv run ruff check . && uv run ruff format --check .  # lint
```
