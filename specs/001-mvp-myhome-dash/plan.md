# Implementation Plan: MVP MyHomeDash - Plataforma de Gestão Familiar

**Branch**: `feature/mvp-myhome-dash` | **Date**: 17 de maio de 2026 | **Spec**: `specs/001-mvp-myhome-dash/spec.md`

**Input**: Feature specification from `/specs/001-mvp-myhome-dash/spec.md`

## Summary

Construir o MVP do MyHomeDash como uma plataforma cloud native e baseada em microserviços, com frontend em Angular 21 microfrontends (`familia-dashboard` e `agenda-tarefas`) e backend em Python 3.14.5 rodando em AWS Lambda (`auth-service` e `app-service`).

A infraestrutura será completamente modular em Terraform 1.15.3, com diretórios separados para `backend`, `frontend` e `api-gtw`, além de módulos reutilizáveis e configurações de ambiente independentes. O pipeline de CI/CD será implementado com GitHub Actions e falhará builds que não alcancem 90% de cobertura de testes unitários. O armazenamento relacional obrigatório será PostgreSQL gerenciado, com migrações de esquema e integridade referencial definida por design.

## Technical Context

**Language/Version**: Python 3.14.5; TypeScript/Angular 21; Terraform 1.15.3; Robot Framework 6.x

**Primary Dependencies**:
- Frontend: Angular 21, Angular Material, RxJS
- Backend: AWS Lambda, boto3 (ou SDK equivalente para AWS), pytest
- Infra: Terraform, AWS Provider
- Testes: pytest, Robot Framework, Karma/Jasmine para Angular

**Storage**: Dados transacionais e estado de aplicação em **PostgreSQL gerenciado** (por exemplo AWS RDS for PostgreSQL ou equivalente); arquivos estáticos em AWS S3; segredos em AWS Secrets Manager.

**Testing**: Testes unitários com `pytest` e cobertura mínima de 90%; testes de frontend Angular com Karma/Jasmine; testes E2E críticos com Robot Framework.

**Target Platform**: AWS Cloud serverless para backend e CDN + S3 para frontend. Navegadores modernos como Chrome, Firefox, Edge e Safari.

**Project Type**: Web application com arquitetura híbrida de microfrontends estáticos e backend serverless.

**Performance Goals**:
- 500ms p95 para APIs críticas
- 99.5% de disponibilidade mensal
- Dashboard inicial carregando em menos de 2 segundos para famílias com até 50 eventos/tarefas

**Constraints**:
- Infraestrutura deve ser provisionada via Terraform e versionada em `/infra`
- CI/CD deve usar GitHub Actions
- Cobertura mínima de 90% em testes unitários
- Testes E2E obrigatórios com Robot Framework
- Conformidade com LGPD e documentação/código em português
- Infra em módulos separados: `backend`, `frontend`, `api-gtw`
- Configuração de ambientes separada em `/infra/environments`
- Banco de dados relacional deve ser PostgreSQL gerenciado com esquema versionado e migrações controladas
- Dados pessoais devem ser hospedados em infraestrutura localizada no Brasil e os termos de uso devem declarar explicitamente que não há compartilhamento de dados com terceiros sem consentimento.

**Scale/Scope**:
- MVP para 10k famílias simultâneas com até 100 membros cada
- 50 eventos/tarefas por família como carga de referência para UI e backend

## Constitution Check

*GATE: Deve passar antes da Fase 0 de pesquisa. Revalidar após a Fase 1 de design.*

Requisitos obrigatórios (GATES do projeto MyHomeDash):
- Todo conteúdo técnico e documentação DEVEM estar em **português**. ✔
- Infraestrutura deve ser provisionada via **Terraform** (módulos versionados e preferencialmente em `/infra`). ✔
- CI/CD DEVE usar **GitHub Actions** com workflows que incluam: lint, testes unitários, verificação de cobertura (falha se <90%), testes E2E (Robot Framework) e deploy controlado. ✔
- A estratégia de branches segue **GitFlow**: novas features em `feature/<nome-da-feature>` e releases em `release/<versão>`. ✔
- Testes E2E automatizados (Robot Framework) são obrigatórios para as principais jornadas de usuário. ✔
- As pipelines DEVEM falhar quando a cobertura de código ficar abaixo de **90%**. ✔

## Project Structure

### Documentation (this feature)

```text
specs/001-mvp-myhome-dash/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
│   └── api-gateway-contract.md
├── spec.md
└── checklists/
```

### Source Code (repository root)

```text
projeto/
├── frontend/
│   ├── familia-dashboard/
│   └── agenda-tarefas/
├── api-gtw/
└── backend/
    ├── auth-service/
    └── app-service/
infra/
├── backend/
├── frontend/
├── api-gtw/
├── modules/
└── environments/
tests/
└── e2e/robot/
```

**Structure Decision**: O projeto usa um repositório multinível com código de aplicação em `projeto/`, Infraestrutura em `infra/`, e especificação/documentação em `specs/001-mvp-myhome-dash/`. Esta organização respeita a constituição de modularidade e separação de responsabilidades.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| Infra modular | Necessário para o requisito explícito de infraestrutura totalmente separada por backend/frontend/api-gtw e ambientes. | Um único módulo Terraform centralizado violaria a exigência de diretórios separados e reduz a clareza de deploy. |

## Notes

- O plano assume que a camada de dados será definida em detalhe na fase de design, mas já prevê armazenamento em PostgreSQL gerenciado, AWS S3 para ativos estáticos e segredos em AWS Secrets Manager.
- A arquitetura técnica respeita a constituição e será refinada no próximo ciclo com base nos artefatos de `data-model.md` e `contracts/api-gateway-contract.md`.
- A implementação deve validar o contrato de API contra `specs/001-mvp-myhome-dash/contracts/api-gateway-contract.md` e garantir que o OpenAPI documente todas as respostas possíveis de cada endpoint.
 - A implementação deve validar o contrato de API contra `specs/001-mvp-myhome-dash/contracts/api-gateway-contract.md` e garantir que o OpenAPI documente todas as respostas possíveis de cada endpoint.
 - Incluir um plano explícito de testes de performance e carga (SLIs/SLOs, scripts de carga) e incorporá-lo ao pipeline de CI para validar os objetivos de desempenho (CS-004, CS-005).
 - Planejar e provisionar infraestrutura de mensagens em tempo real (WebSocket API / PubSub) dentro de `/infra` para suportar sincronização em tempo real de listas de compras e notificações; validar via testes de integração.
