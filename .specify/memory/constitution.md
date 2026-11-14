# Constituição do MyHomeDash

<!--
Sync Impact Report

Version change: 1.2.2 -> 1.2.3
Modified sections: VI. Banco de dados relacional PostgreSQL
Added sections: VI. Banco de dados relacional PostgreSQL
Templates requiring updates: none
Follow-up TODOs:
- Validar alinhamento de arquitetura e documentação com PostgreSQL como banco relacional obrigatório
- Verificar infra Terraform e pipeline CI/CD para suporte a RDS PostgreSQL ou equivalente gerenciado
- Atualizar especificações de ambiente e dados quando o design do schema relacional for detalhado
-->

## Princípios Centrais

### I. Português como Idioma Oficial
Todo código, documentação, comentários, commit messages, issues e pull requests DEVEM ser escritos integralmente em português (brasileiro ou europeu). Isso inclui:
- Nomes de variáveis, funções e classes
- Comentários de código
- Docstrings e comentários de bloco
- Documentação do projeto
- Mensagens de commit e PRs
- Issues, discussões e comentários em reviews

RATIONALE: O projeto é desenvolvido por e para usuários brasileiros/portugueses. Manter consistência linguística facilita colaboração, documentação e compreensão do código.

### II. Clareza e Legibilidade
Todo código e documentação deve priorizar clareza e legibilidade acima de concisão. Nomes em português descritivo são preferidos a abreviações crípticas em inglês.

RATIONALE: Português claro torna o código mais acessível e reduz barreiras cognitivas para desenvolvedores da comunidade.

### III. Documentação Estruturada
Cada feature, módulo e componente DEVE incluir documentação em português explicando:
- Propósito e responsabilidade
- Como usar/integrar
- Exemplos práticos
- Dependências e efeitos colaterais

RATIONALE: Documentação de qualidade reduz curva de aprendizado e facilita manutenção futura.

### IV. Cobertura de Testes Mínima de 90%
A cobertura de código dos testes unitários DEVE estar no mínimo em 90%. Esta métrica é obrigatória e será verificada em toda pull request antes do merge.

RATIONALE: Alta cobertura de testes garante qualidade do código, reduz bugs em produção e facilita refatorações com confiança.

### V. Arquitetura Cloud Native e Microserviços
A arquitetura do MyHomeDash DEVE ser fundamentada em princípios Cloud Native e estruturada em microserviços. Cada serviço deve:
- Ser independente, escalável e descentralizado
- Ter uma responsabilidade bem definida e específica
- Ser containerizado (Docker/OCI) e orquestrável quando aplicável
- Comunicar-se via APIs RESTful ou event-driven
- Ser facilmente deployável em ambientes cloud (Kubernetes, orquestradores gerenciados ou runtimes serverless conforme adequado)

RATIONALE: Arquitetura cloud native e microserviços permite escalabilidade, resiliência, manutenção independente de componentes e flexibilidade para evoluir o projeto.

#### Arquitetura Técnica (decisões normativas)
- **Frontend**: A camada de interface DO SITE deverá ser construída com **Angular** e **Angular Material**. A aplicação frontend deverá ser organizada como **microfrontends**, permitindo deploy independente de domínios/funcionalidades.
	- Implantação: aplicações estáticas de microfrontends serão hospedadas em **AWS S3** com distribuição via **CloudFront** (CDN). Cada microfrontend pode ter seu bucket e pipeline CI/CD próprio.
- **Backend**: A lógica de negócio do MVP será implementada em **Python**, empacotada como funções **AWS Lambda** (serverless). Cada domínio (Calendário, Tarefas, Finanças, Documentos, Avisos) pode mapear-se a uma ou mais Lambdas conforme granularidade necessária.
- **API Gateway**: Todas as chamadas do frontend deverão passar por um **API Gateway** (AWS API Gateway) que mantém o contrato público, orquestra chamadas às Lambdas, aplica autenticação/autorização, rate limiting e caching quando aplicável.
- **Integrações Externas**: Conexões com Google Calendar e Outlook usarão OAuth2, tokens serão armazenados em cofre de segredos (AWS Secrets Manager) e refresh tokens gerenciados com rotação segura.
- **Testes End-to-End**: Os testes E2E obrigatórios para as principais funcionalidades serão automatizados usando **Robot Framework**, executados por pipelines CI (ex.: GitHub Actions, AWS CodeBuild) contra ambientes de staging.
- **Observabilidade e Operações**: Logs estruturados, métricas e traces deverão ser enviados a serviços gerenciados (CloudWatch, X-Ray ou equivalente). Alertas e dashboards devem ser definidos para erros críticos e latência.
- **Infraestrutura como Código**: A infraestrutura DO PROJETO DEVERÁ ser definida e provisionada via **Terraform** (módulos e estados versionados). Não utilizar CDK ou abordagens alternativas sem aprovação explícita da governança.
- **CI/CD**: O pipeline de integração contínua e entrega contínua DEVERÁ ser implementado com **GitHub Actions**. Os workflows obrigatórios incluem: lint, testes unitários com verificação de cobertura (falha se <90%), testes E2E com Robot Framework, e deploy automatizado para staging/production conforme regras de aprovação.
- **Segurança operacional**: Princípio de menor privilégio para IAM, uso de TLS em todas comunicações, armazenamento de segredos em cofre, e revisão de permissões periódica.

### VI. Banco de dados relacional PostgreSQL
O armazenamento de dados transacionais e de estado do MyHomeDash DEVE ser implementado com **PostgreSQL**. A solução deve:
- garantir integridade referencial, ACID e transações consistentes
- ser provisionada como serviço gerenciado ou equivalente que suporte backup, failover e criptografia em repouso
- incluir esquema versionado, migrações controladas e políticas de retenção de dados compatíveis com LGPD
- ser a única opção de armazenamento relacional para dados estruturados do sistema

RATIONALE: PostgreSQL oferece robustez, consistência e suporte a consultas relacionais complexas, reduzindo custo de manutenção e evitando decisões divergentes sobre persistência de dados.

## Padrões de Projeto

### Estrutura de Código
- Organizar código em módulos bem-definidos
- Usar princípios SOLID e padrões de design reconhecidos
- Manter consistência de estilo em todo o projeto

### Qualidade de Código
- Testes unitários DEVEM acompanhar novas funcionalidades
- **Cobertura de código OBRIGATÓRIA: mínimo 90%** — verificada em cada pull request
- Code reviews obrigatórios antes de merge
- Verificação de linting e formatação

## Governança

A Constituição do MyHomeDash é o documento soberano que define os valores e práticas do projeto. Todas as decisões técnicas, de processos e de linguagem devem estar em conformidade com estes princípios.

**Alterações à Constituição:**
- Propostas de emenda devem ser documentadas em issues com rótulo `constituição`
- Comunidade pode comentar e votar em propostas
- Aprovação requer consenso dos mantenedores principais

### Fluxo de Branches — GitFlow
O modelo obrigatório de branching do repositório é **GitFlow**. Convenções obrigatórias:
- Branch principal de produção: `main`
- Branch de desenvolvimento: `develop`
- Branches de funcionalidade: `feature/<nome>`
- Branches de release: `release/<versao>`
- Branches de correção rápida: `hotfix/<nome>`

PRs de funcionalidade devem ser direcionadas a `develop`; releases e hotfixes seguem o processo de merge para `main` com revisão de PR e aprovação. Mesclagens para `main` exigem pipelines de CI/CD verdes (GitHub Actions) e revisão de mantenedores.

**Versão**: 1.2.3 | **Ratificação**: 2026-05-14 | **Última Emenda**: 2026-05-17
