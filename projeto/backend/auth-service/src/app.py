from dataclasses import dataclass
from typing import Dict

@dataclass
class AuthService:
    """Serviço de autenticação básico para usuários e famílias."""

    def register(self, payload: Dict[str, str]) -> Dict[str, object]:
        email = payload.get("email")
        senha = payload.get("senha")
        nome = payload.get("nome")
        if not email or not senha or not nome:
            return {"statusCode": 400, "body": {"message": "Campos obrigatórios ausentes"}}
        return {
            "statusCode": 201,
            "body": {
                "message": "Usuário registrado com família criada",
                "user": {"email": email, "nome": nome},
            },
        }

    def login(self, payload: Dict[str, str]) -> Dict[str, object]:
        email = payload.get("email")
        senha = payload.get("senha")
        if not email or not senha:
            return {"statusCode": 400, "body": {"message": "Credenciais inválidas"}}
        return {
            "statusCode": 200,
            "body": {
                "message": "Login bem-sucedido",
                "token": "eyJhbGciOi...",
            },
        }

    def password_reset(self, payload: Dict[str, str]) -> Dict[str, object]:
        email = payload.get("email")
        if not email:
            return {"statusCode": 400, "body": {"message": "Email obrigatório"}}
        return {"statusCode": 202, "body": {"message": "Solicitação de redefinição enviada"}}

    def enable_2fa(self, payload: Dict[str, str]) -> Dict[str, object]:
        user_id = payload.get("user_id")
        if not user_id:
            return {"statusCode": 400, "body": {"message": "ID de usuário obrigatório"}}
        return {"statusCode": 200, "body": {"message": "2FA habilitado"}}
