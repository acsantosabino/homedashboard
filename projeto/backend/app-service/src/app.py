from typing import Dict

class AppService:
    """Serviço base do app para lidar com rotas de domínio e integrações."""

    def health(self) -> Dict[str, object]:
        return {"statusCode": 200, "body": {"message": "App service pronto"}}

    def ping(self) -> Dict[str, object]:
        return {"statusCode": 200, "body": {"message": "pong"}}

    def execute(self, path: str, method: str, payload: Dict[str, object]) -> Dict[str, object]:
        if path.endswith("/health") and method == "GET":
            return self.health()
        if path.endswith("/ping") and method == "GET":
            return self.ping()
        return {"statusCode": 404, "body": {"message": "Rota não encontrada"}}
