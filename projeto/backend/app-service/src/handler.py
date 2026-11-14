import json
from .app import AppService

service = AppService()


def handler(event, context):
    path = event.get("path", "")
    method = event.get("httpMethod", "GET")
    try:
        body = json.loads(event.get("body", "{}")) if event.get("body") else {}
    except json.JSONDecodeError:
        return {"statusCode": 400, "body": json.dumps({"message": "JSON inválido"})}

    result = service.execute(path, method, body)
    return {
        "statusCode": result.get("statusCode", 500),
        "body": json.dumps(result.get("body", {}), ensure_ascii=False),
        "headers": {"Content-Type": "application/json; charset=utf-8"},
    }
