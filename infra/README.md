# Infraestrutura Terraform do MyHomeDash

Este diretório contém a infraestrutura do projeto em módulos Terraform. A infraestrutura é organizada em:

- `backend/`: implantação de funções AWS Lambda e permissões de execução
- `frontend/`: buckets S3 e distribuição CloudFront para microfrontends
- `api-gtw/`: API Gateway HTTP para orquestrar chamadas ao backend
- `modules/`: módulos reutilizáveis para roles, Lambdas, buckets S3, CloudFront e API Gateway
- `environments/`: configurações de variáveis separadas por ambiente

Use `terraform init` no diretório raiz de `infra` e carregue os arquivos TFVARS do ambiente desejado.
