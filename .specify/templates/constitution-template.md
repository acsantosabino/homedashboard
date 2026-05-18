# [PROJECT_NAME] Constitution

## Princípios Centrais

### I. Português como língua de engenharia
Todos os artefatos técnicos DEVEM ser escritos em **português**. Essa regra vale para documentação, especificações, comentários de código e mensagens de commit quando não há exigência de idioma externo.

### II. Infraestrutura como código
A infraestrutura DEVEM ser provisionada via **Terraform**. Todo recurso reutilizável deve ser modelado em módulos versionados e mantido no repositório, preferencialmente em `/infra`.

### III. CI/CD baseado em GitHub Actions
Os pipelines de integração e entrega contínua DEVEM ser implementados com **GitHub Actions**. Os workflows obrigatórios incluem:
- lint
- testes unitários
- verificação de cobertura mínima de **90%**
- testes E2E com **Robot Framework**
- deploy controlado

### IV. GitFlow obrigatório
A estratégia de branches deve seguir **GitFlow**. Novas features DEVEM ser desenvolvidas em branches `feature/<nome-da-feature>` e releases em `release/<versão>`.

### V. Testes de aceitação automatizados
Os testes de aceitação e jornadas principais DEVEM ser automatizados com **Robot Framework** e executados no CI.

## Restrições adicionais

- Qualquer mudança que reduza a cobertura total abaixo de **90%** DEVEM ser recusada até que a cobertura seja restaurada.
- Documentação técnica e entregáveis de projeto DEVEM referenciar os padrões de Terraform e GitHub Actions quando aplicáveis.
- As decisões de arquitetura DEVEM ser registradas e justificadas por escrito.

## Fluxo de trabalho e governança

- Todo PR DEVEM incluir verificação de conformidade com esta constituição.
- O uso de branches de feature fora de `feature/<nome-da-feature>` DEVEM ser evitado.
- Mudanças nos módulos de infraestrutura DEVEM ser revisadas com cuidado por revisão de código e testes de infraestrutura.
- Alterações nesta constituição DEVEM ser documentadas com versão e data de ratificação.

**Versão**: [CONSTITUTION_VERSION] | **Ratificado**: [RATIFICATION_DATE] | **Última alteração**: [LAST_AMENDED_DATE]
