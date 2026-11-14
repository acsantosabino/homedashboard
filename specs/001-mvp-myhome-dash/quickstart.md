# Quickstart: MVP MyHomeDash

## 1. Pré-requisitos

- Node.js 20+ e npm
- Python 3.14.5
- Terraform 1.15.3
- AWS CLI configurado com credenciais válidas
- Git

## 2. Instalar dependências Python

```bash
cd /home/arthur/Documentos/projetos/MyHomeDash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## 3. Instalar dependências dos microfrontends

```bash
cd projeto/frontend/familia-dashboard
npm install
cd ../agenda-tarefas
npm install
```

## 4. Executar testes unitários do backend

```bash
cd /home/arthur/Documentos/projetos/MyHomeDash
pytest --cov=projeto/backend/auth-service --cov=projeto/backend/app-service
```

## 5. Executar testes E2E com Robot Framework

```bash
cd /home/arthur/Documentos/projetos/MyHomeDash
robot tests/e2e/robot
```

## 6. Provisionar infraestrutura Terraform

```bash
cd /home/arthur/Documentos/projetos/MyHomeDash/infra
terraform init
terraform plan -var-file=environments/dev.tfvars
```

## 7. Implantar infraestrutura de desenvolvimento

```bash
terraform apply -var-file=environments/dev.tfvars
```

## 8. Repositórios específicos

- `projeto/frontend/familia-dashboard`: microfrontend Angular da dashboard familiar
- `projeto/frontend/agenda-tarefas`: microfrontend Angular de calendário e tarefas
- `projeto/api-gtw`: contrato e configuração do API Gateway
- `projeto/backend/auth-service`: backend Python responsável por autenticação e autorização
- `projeto/backend/app-service`: backend Python responsável pelas regras de negócio principais
- `infra/`: infraestrutura Terraform modular
- `tests/e2e/robot/`: testes de aceitação com Robot Framework

## 9. Observações

- Use `feature/<nome-da-feature>` para novas funcionalidades.
- A cobertura de testes unitários deve ser no mínimo 90%.
- Os arquivos de configuração por ambiente ficam em `infra/environments/`.
