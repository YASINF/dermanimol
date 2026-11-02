from fastapi import APIRouter

from ..config import get_settings

router = APIRouter(tags=["sistem"])


@router.get("/health")
def health() -> dict[str, str]:
    """Ters vekil sunucu ve izleme için canlılık kontrolü."""
    return {"status": "ok", "env": get_settings().env}
