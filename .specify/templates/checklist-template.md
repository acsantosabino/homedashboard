# [CHECKLIST TYPE] Checklist: [FEATURE NAME]

**Objetivo**: [Breve descrição de o que esta checklist cobre]
**Criado em**: [DATA]
**Funcionalidade**: [Link para spec.md ou documentação relevante]

**Observação**: Esta checklist é gerada pelo comando `/speckit.checklist` com base no contexto do recurso e nos requisitos obrigatórios.

## Regras de qualidade obrigatórias

- Todo conteúdo técnico e documentação DEVEM estar em **português**.
- Infraestrutura DEVEM ser provisionada via **Terraform**.
- CI/CD DEVEM usar **GitHub Actions**.
- A cobertura mínima de código DEVEM ser **90%** e o workflow deve falhar se esse limite não for atingido.
- Testes E2E principais DEVEM ser automatizados com **Robot Framework**.
- Branches de feature DEVEM seguir **GitFlow**: `feature/<nome-da-feature>`.

## [Category 1]

- [ ] CHK001 Verificar que toda a documentação está em português.
- [ ] CHK002 Confirmar que infraestrutura foi descrita em Terraform e está em `/infra` ou módulo equivalente.
- [ ] CHK003 Garantir que o pipeline de CI no GitHub Actions contém lint, testes unitários e cobertura.

## [Category 2]

- [ ] CHK004 Validar que existe suíte E2E com Robot Framework para as jornadas principais.
- [ ] CHK005 Confirmar que a branch ativa segue o padrão `feature/<nome-da-feature>`.
- [ ] CHK006 Verificar que o workflow falha quando a cobertura é menor que 90%.

## Observações

- Marque os itens como concluídos com `[x]`.
- Adicione comentários ou descobertas inline.
- Informe links para recursos ou documentação relevante.
- Os itens devem ser numerados sequencialmente para referência fácil.
