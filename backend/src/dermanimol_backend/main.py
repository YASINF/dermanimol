from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .config import get_settings
from .routers import health


def create_app() -> FastAPI:
    settings = get_settings()
    app = FastAPI(
        title="Dermanım Ol API",
        version="0.1.0",
        # Canlı ortamda etkileşimli doküman sayfaları kapalı.
        docs_url=None if settings.env == "prod" else "/docs",
        redoc_url=None,
    )
    if settings.cors_origins:
        app.add_middleware(
            CORSMiddleware,
            allow_origins=settings.cors_origins,
            allow_methods=["GET", "POST", "PUT", "DELETE"],
            allow_headers=["Authorization", "Content-Type"],
        )
    app.include_router(health.router)
    return app


app = create_app()
