import json
from .app import AuthService

service = AuthService()


def handler(event, context):
    path = event.get("path", "")
    method = event.get("httpMethod", "GET")
    try:
        body = json.loads(event.get("body", "{}")) if event.get("body") else {}
    except json.JSONDecodeError:
        return {"statusCode": 400, "body": json.dumps({"message": "JSON inválido"})}

    if path.endswith("/auth/register") and method == "POST":
        result = service.register(body)
    elif path.endswith("/auth/login") and method == "POST":
        result = service.login(body)
    elif path.endswith("/auth/password-reset") and method == "POST":
        result = service.password_reset(body)
    elif path.endswith("/auth/2fa") and method == "POST":
        result = service.enable_2fa(body)
    else:
        return {"statusCode": 404, "body": json.dumps({"message": "Rota não encontrada"})}

    response_body = result.get("body", {})
    return {
        "statusCode": result.get("statusCode", 500),
        "body": json.dumps(response_body, ensure_ascii=False),
        "headers": {"Content-Type": "application/json; charset=utf-8"},
    }
