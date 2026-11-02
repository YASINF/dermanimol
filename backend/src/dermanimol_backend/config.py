from enum import StrEnum
from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Environment(StrEnum):
    dev = "dev"
    staging = "staging"
    prod = "prod"


class Settings(BaseSettings):
    """Ortam değişkenlerinden okunan ayarlar. Örnek değerler: .env.example"""

    model_config = SettingsConfigDict(env_file=".env", env_prefix="DERMANIMOL_", extra="ignore")

    env: Environment = Environment.dev
    supabase_url: str = ""
    # Service role anahtarı sadece backend'de bulunur, istemcilere asla gönderilmez.
    supabase_service_role_key: str = ""
    cors_origins: list[str] = []


@lru_cache
def get_settings() -> Settings:
    return Settings()
