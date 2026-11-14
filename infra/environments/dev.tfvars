aws_region = "us-east-1"
environment = "dev"
project_name = "myhomedash"

frontend_bucket_name = "myhomedash-frontend-dev"
create_frontend_distribution = false

lambda_function_name = "myhomedash-backend-dev"
lambda_handler = "app.handler"
lambda_runtime = "python3.11"
lambda_package_path = "../projeto/backend/package/backend.zip"
create_lambda = false

api_name = "myhomedash-api-dev"
create_api = false
