# Research: MVP MyHomeDash

## Decisões principais

- **Infraestrutura Terraform modular**: A constituição exige que a infraestrutura seja totalmente modular e separada. O projeto será organizado em `/infra/backend`, `/infra/frontend`, `/infra/api-gtw`, `/infra/modules`, e `/infra/environments` para facilitar reutilização e ambientes independentes.

- **Backend serverless em Python**: Conforme especificado na constituição, o backend do MVP será implementado em Python 3.14.5 usando AWS Lambda. Cada domínio pode ser mapeado para funções Lambda separadas para manter microserviços e independência.

- **Front-end em Angular microfrontends**: O frontend será composto por microfrontends Angular 21 com Angular Material, hospedados como sites estáticos em AWS S3 e distribuídos via AWS CloudFront. Isso atende à exigência de deploy independente e escala do frontend.

- **API Gateway como contrato**: O AWS API Gateway será usado como a borda pública para o backend serverless. Ele mantém o contrato de API, aplica autorização/autenticação e orquestra chamadas para as Lambdas.

- **Configuração de ambiente separada**: As variáveis e parâmetros por ambiente serão mantidas em `/infra/environments/*.tfvars`, permitindo deploy de `dev`, `prod` e futuros ambientes sem misturar configurações.

- **GitHub Actions para CI/CD**: O pipeline deve incluir lint, testes unitários com cobertura mínima de 90%, testes E2E Robot Framework e deploy controlado. Esta escolha atende à constituição e permite automação nativa GitHub.

- **Testes E2E com Robot Framework**: Os requisitos da constituição pedem Robot Framework para as principais jornadas. O projeto terá testes E2E para fluxo de criação de família, calendário compartilhado e tarefas.

- **LGPD e segurança**: A arquitetura assume que dados sensíveis são criptografados em repouso e em trânsito, logs são auditáveis, e consentimento/portabilidade/exclusão são suportados desde o início.

## Alternativas consideradas

- **Backend contêinerizado vs serverless**: Serverless foi escolhido por atender diretamente à constituição e reduzir overhead operacional do MVP. Contêineres CLI/Docker poderiam ser adotados mais tarde se necessário.

- **Banco de dados relacional PostgreSQL**: O projeto definirá **PostgreSQL** como banco de dados relacional gerenciado. O design de dados será orientado para esquema relacional, integridade de transações e migrações controladas.

- **Notificações push como priorização**: Para MVP, notificações por email e in-app são prioritárias; push via navegador fica como recurso secundário para reduzir complexidade inicial.

## Conclusão

A estratégia definida atende à constituição do MyHomeDash e resolve as principais exigências da especificação:
- arquitetura cloud native em microserviços
- infraestrutura modular em Terraform
- frontend microfrontend Angular em S3/CloudFront
- backend Python Lambda + API Gateway
- CI/CD GitHub Actions com cobertura mínima de 90%
- testes E2E Robot Framework
- conformidade LGPD e documentação em português
