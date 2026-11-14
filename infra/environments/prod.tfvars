aws_region = "us-east-1"
environment = "prod"
project_name = "myhomedash"

frontend_bucket_name = "myhomedash-frontend-prod"
create_frontend_distribution = true

lambda_function_name = "myhomedash-backend-prod"
lambda_handler = "app.handler"
lambda_runtime = "python3.11"
lambda_package_path = "../projeto/backend/package/backend.zip"
create_lambda = false

api_name = "myhomedash-api-prod"
create_api = false
