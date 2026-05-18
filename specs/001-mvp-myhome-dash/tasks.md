# Tasks: MVP MyHomeDash - Plataforma de Gestão Familiar

**Input**: Design documents from `/specs/001-mvp-myhome-dash/`

## Phase 1: Setup (Shared Infrastructure)

- [ ] T001 Configure GitHub Actions workflows in `.github/workflows/` for lint, unit tests, coverage gating, Robot Framework E2E, and deploy
- [ ] T002 Create Terraform module structure in `infra/` with separate directories for `backend/`, `frontend/`, `api-gtw/`, and shared `modules/`
- [ ] T003 Create environment TFVARS files in `infra/environments/` for `dev` and `prod`
- [ ] T004 Scaffold Angular workspaces in `projeto/frontend/familia-dashboard/` and `projeto/frontend/agenda-tarefas/`
- [ ] T005 Scaffold Python AWS Lambda services in `projeto/backend/auth-service/` and `projeto/backend/app-service/`
- [ ] T006 Add PostgreSQL migration tooling and initial schema framework in `projeto/backend/app-service/db/`
- [ ] T007 Add base Robot Framework configuration in `tests/e2e/robot/` with common variables and environment setup
- [ ] T008 Add API Gateway OpenAPI contract starter file in `projeto/api-gtw/openapi.yaml`

## Phase 2: Foundational (Blocking Prerequisites)

- [ ] T009 [P] Implement PostgreSQL connection and migrations support in `projeto/backend/app-service/db/`
- [ ] T010 [P] Implement core authentication API in `projeto/backend/auth-service/src/` with register, login, password reset, and 2FA support
- [ ] T011 [P] Implement family, user, permission and audit models in `projeto/backend/app-service/src/models/`
- [ ] T012 [P] Implement common backend error handling, logging and environment configuration in `projeto/backend/app-service/src/config/`
- [ ] T013 [P] Implement base frontend auth flow in `projeto/frontend/familia-dashboard/src/app/auth/`
- [ ] T014 [P] Implement base frontend navigation and shared UI components in `projeto/frontend/familia-dashboard/src/app/` and `projeto/frontend/agenda-tarefas/src/app/`
- [ ] T015 [P] Add initial Terraform resources for PostgreSQL managed database, S3 buckets, Lambda roles, and API Gateway in `infra/`
 - [ ] T070 [P] Add infrastructure support for real-time messaging (WebSocket API / PubSub) in `infra/` and document usage for shopping lists and notifications
- [ ] T016 [P] Add base contract tests in `tests/e2e/robot/` for authentication and authorization flows
- [ ] T063 [P] Implement LGPD data portabilidade e exclusão no backend como requisito fundacional, incluindo validação de APIs antes da fase de polimento
- [ ] T065 [P] Implement secure secrets management for OAuth tokens and backend credentials using AWS Secrets Manager or equivalent, and validate secret access controls in `infra/` and `projeto/backend/**`
- [ ] T066 [P] Configure data residency and infrastructure in Brazil to ensure LGPD compliance and enforce terms of use that prohibit data sharing without express consent.
- [ ] T067 [P] Validate the implementation contract against `specs/001-mvp-myhome-dash/contracts/api-gateway-contract.md` and ensure OpenAPI defines all expected endpoint responses, including error cases.

## Phase 3: User Story 1 - Criar Família e Configurar Acesso (Prioridade: P1)

**Goal**: Build family creation, member invitations and permission management as the core onboarding flow.

**Independent Test**: Verify a new family is created, members are invited, permissions are assigned, and access enforcement works.

- [ ] T017 [US1] Create PostgreSQL schema migrations for `familias`, `usuarios`, `permissoes` and `auditoria` in `projeto/backend/app-service/db/migrations/`
- [ ] T018 [US1] Implement family creation and membership APIs in `projeto/backend/auth-service/src/family_service.py`
- [ ] T019 [US1] Implement member invitation, join and permission assignment APIs in `projeto/backend/auth-service/src/permission_service.py`
- [ ] T020 [US1] Implement family management UI in `projeto/frontend/familia-dashboard/src/app/familia/`
- [ ] T021 [US1] Implement permission enforcement in backend middleware or auth guard in `projeto/backend/auth-service/src/`
- [ ] T022 [US1] Add unit tests for family creation, invitations and permission enforcement in `projeto/backend/auth-service/tests/`
- [ ] T023 [US1] Add Robot Framework E2E test for family creation and member invitation in `tests/e2e/robot/family_management.robot`

## Phase 4: User Story 2 - Calendário Compartilhado com Sincronização (Prioridade: P1)

**Goal**: Deliver shared calendar event CRUD with Google and Outlook sync and conflict detection.

**Independent Test**: Verify event creation, editing, deletion, and external sync behavior independently of other modules.

- [ ] T024 [US2] Create PostgreSQL schema migrations for `eventos`, `participantes` e `sincronizacoes` in `projeto/backend/app-service/db/migrations/`
- [ ] T025 [US2] Implement calendar CRUD APIs in `projeto/backend/app-service/src/calendar_service.py`
- [ ] T026 [US2] Implement Google Calendar and Outlook OAuth2 sync scaffolding in `projeto/backend/app-service/src/integrations/`
- [ ] T027 [US2] Implement conflict detection and resolution metadata in `projeto/backend/app-service/src/calendar_service.py`
- [ ] T028 [US2] Implement shared calendar UI in `projeto/frontend/agenda-tarefas/src/app/calendar/`
 - [ ] T068 [US2] Implement API/UI toggle to enable/disable external calendar synchronization and add unit + E2E tests
- [ ] T029 [US2] Add unit tests for calendar CRUD and sync conflict logic in `projeto/backend/app-service/tests/`
- [ ] T030 [US2] Add Robot Framework E2E test for calendar creation and sync in `tests/e2e/robot/calendar_sync.robot`

## Phase 5: User Story 3 - Gerenciar Tarefas e Afazeres (Prioridade: P1)

**Goal**: Deliver task creation, assignment, progress tracking and notifications.

**Independent Test**: Verify independent task workflows with assignment and completion notifications.

- [ ] T031 [US3] Create PostgreSQL schema migrations for `tarefas`, `historico_tarefas` e `notificacoes` in `projeto/backend/app-service/db/migrations/`
- [ ] T032 [US3] Implement task CRUD and assignment APIs in `projeto/backend/app-service/src/task_service.py`
- [ ] T033 [US3] Implement notification and deadline reminder logic in `projeto/backend/app-service/src/notification_service.py`
- [ ] T034 [US3] Implement task management UI in `projeto/frontend/agenda-tarefas/src/app/tasks/`
- [ ] T035 [US3] Add unit tests for task assignment, completion and reminders in `projeto/backend/app-service/tests/`
- [ ] T036 [US3] Add Robot Framework E2E test for task creation and completion in `tests/e2e/robot/tasks.robot`

## Phase 6: User Story 4 - Rastrear Despesas e Orçamentos (Prioridade: P2)

**Goal**: Deliver expense recording, categorization, budget tracking and alerts.

**Independent Test**: Verify expense registration and budget alerts independently of calendar and tasks.

- [ ] T037 [US4] Create PostgreSQL schema migrations for `despesas`, `orcamentos` e `categorias` in `projeto/backend/app-service/db/migrations/`
- [ ] T038 [US4] Implement expense registration and budget analytics APIs in `projeto/backend/app-service/src/finance_service.py`
- [ ] T039 [US4] Implement finance dashboard UI in `projeto/frontend/familia-dashboard/src/app/finance/`
- [ ] T040 [US4] Add unit tests for expense recording and budget alert logic in `projeto/backend/app-service/tests/`
- [ ] T041 [US4] Add Robot Framework E2E test for expense registration and budget alert in `tests/e2e/robot/finance.robot`

## Phase 7: User Story 5 - Listas de Compras Compartilhadas (Prioridade: P2)

**Goal**: Deliver shared shopping lists with item collaboration and status tracking.

**Independent Test**: Verify lists and item completion independent of other modules.

- [ ] T042 [US5] Create PostgreSQL schema migrations for `listas_compras` e `itens_lista` in `projeto/backend/app-service/db/migrations/`
- [ ] T043 [US5] Implement shopping list CRUD and item status APIs in `projeto/backend/app-service/src/shopping_list_service.py`
- [ ] T044 [US5] Implement shopping list UI in `projeto/frontend/familia-dashboard/src/app/shopping-lists/`
- [ ] T045 [US5] Add unit tests for shopping list collaboration and item completion in `projeto/backend/app-service/tests/`
 - [ ] T069 [US5] Implement real-time synchronization backend and handlers for shopping lists (WebSocket / PubSub) and add integration tests
- [ ] T046 [US5] Add Robot Framework E2E test for shared shopping lists in `tests/e2e/robot/shopping_list.robot`

## Phase 8: User Story 6 - Armazenamento Seguro de Documentos (Prioridade: P3)

**Goal**: Deliver secure document upload, encryption, search and access control.

**Independent Test**: Verify document upload and access controls independent of other modules.

- [ ] T047 [US6] Create PostgreSQL schema migrations for `documentos` e `documento_acessos` in `projeto/backend/app-service/db/migrations/`
- [ ] T048 [US6] Implement document upload, metadata storage and encryption APIs in `projeto/backend/app-service/src/document_service.py`
- [ ] T049 [US6] Implement document management UI in `projeto/frontend/familia-dashboard/src/app/documents/`
- [ ] T050 [US6] Add unit tests for secure document upload and access control in `projeto/backend/app-service/tests/`
- [ ] T051 [US6] Add Robot Framework E2E test for secure document upload and search in `tests/e2e/robot/documents.robot`

## Phase 9: User Story 7 - Comunicação Interna com Mural de Avisos (Prioridade: P3)

**Goal**: Deliver notice board creation, pinning, reaction and notification.

**Independent Test**: Verify notice board functionality independent of finance, tasks, and calendar.

- [ ] T052 [US7] Create PostgreSQL schema migrations for `avisos` e `reacoes_avisos` in `projeto/backend/app-service/db/migrations/`
- [ ] T053 [US7] Implement notice CRUD, pinning and notification APIs in `projeto/backend/app-service/src/notice_service.py`
- [ ] T054 [US7] Implement notice board UI in `projeto/frontend/familia-dashboard/src/app/notices/`
- [ ] T055 [US7] Add unit tests for notice creation and reactions in `projeto/backend/app-service/tests/`
- [ ] T056 [US7] Add Robot Framework E2E test for notice creation and pinning in `tests/e2e/robot/notices.robot`

## Final Phase: Polish & Cross-Cutting Concerns

- [ ] T057 [P] Implement application-wide error handling, logging, metrics and security hardening in `projeto/backend/**`, incluindo TLS/SSL, proteção CSRF, proteção contra SQL Injection, rate limiting e detecção de fraude.
- [ ] T058 [P] Implement UI polish, accessibility, responsiveness and theme support in `projeto/frontend/**`, incluindo dashboard inicial com resumo de próximos eventos, tarefas atrasadas e gastos do mês.
- [ ] T059 [P] Implement LGPD consent flows, audit logging, data deletion and consent management in `projeto/backend/**`
- [ ] T064 [P] Implement privacy policy page and LGPD compliance documentation in `projeto/frontend/**`, incluindo acesso claro a direitos de portabilidade e exclusão de dados.
 - [ ] T071 [P] Add load and performance testing (load scripts, benchmarks) targeting CS performance goals and include in CI pipelines
 - [ ] T072 [P] Implement monitoring, SLI/SLO definitions and dashboards (CloudWatch/Grafana) and add alerting rules for critical SLOs
- [ ] T060 [P] Validate Terraform format, init and plan in `infra/`
- [ ] T061 [P] Review and update documentation in `specs/001-mvp-myhome-dash/quickstart.md`, `research.md`, `data-model.md`, and `contracts/api-gateway-contract.md`
- [ ] T062 [P] Review GitHub Actions workflows and ensure coverage gating and Robot Framework E2E steps in `.github/workflows/`

## Dependencies

- Foundation tasks `T009`–`T016` must be complete before user story implementation begins.
- User stories `US1`, `US2`, and `US3` are the first MVP increments and can be developed in parallel once the foundation is ready.
- `US4` and `US5` may proceed after the core family, calendar, and task workflows are stable.
- `US6` and `US7` are lower-priority polish stories and can follow after the main coordination and collaboration flows.

## Parallel Execution Examples

- `T009`, `T010`, `T011`, `T012`, `T013`, `T014`, `T015`, `T016` can run in parallel across backend, frontend, infra, and test setup.
- `T018`/`T019` (auth backend) can run in parallel with `T020`/`T021` (family UI) once foundational auth is ready.
- `T025`/`T027` (calendar backend and sync) can run in parallel with `T028` (calendar UI).
- `T032`/`T033` (task backend) can run in parallel with `T034` (task UI).
- `T057`–`T062` can be executed in parallel as cross-cutting polish after story implementations.

## Implementation Strategy

- MVP first: complete `US1`, `US2`, and `US3` as the first deliverable slice.
- Incrementally add `US4` and `US5` once the core coordination and collaboration flows are stable.
- Reserve `US6` and `US7` for polishing and maturity after the main value paths are working.
- Ensure each story phase includes at least one backend implementation task, one frontend task, and corresponding tests.
