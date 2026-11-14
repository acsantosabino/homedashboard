# Data Model: MVP MyHomeDash

## Visão Geral

Este modelo de dados é projetado para um banco de dados relacional PostgreSQL gerenciado, com integridade referencial, migrações controladas e suporte a transações ACID para dados transacionais e de estado.

## Entidades Principais

### Família
- `id`: UUID
- `nome`: string
- `plano`: string (gratuito, premium)
- `data_criacao`: timestamp
- `ultimo_acesso`: timestamp
- `configuracoes`: JSON
- `status`: string (`ativa`, `suspensa`, `arquivada`)

### Usuário
- `id`: UUID
- `familia_id`: UUID
- `nome`: string
- `email`: string
- `hash_senha`: string
- `2fa_habilitado`: boolean
- `ultimo_login`: timestamp
- `status`: string (`ativo`, `inativo`)
- `papel`: string (`responsavel`, `membro`)

### Permissão
- `id`: UUID
- `familia_id`: UUID
- `usuario_id`: UUID
- `modulo`: string (`calendario`, `tarefas`, `financas`, `listas`, `documentos`, `avisos`)
- `visualizar`: boolean
- `criar`: boolean
- `editar`: boolean
- `deletar`: boolean
- `gerenciar_permissoes`: boolean

### Evento de Calendário
- `id`: UUID
- `familia_id`: UUID
- `titulo`: string
- `descricao`: string
- `data_inicio`: timestamp
- `data_fim`: timestamp
- `local`: string
- `participantes`: lista de UUIDs de usuários
- `recorrencia`: objeto opcional
- `sincronizado_google`: boolean
- `sincronizado_outlook`: boolean
- `conflito`: boolean
- `status`: string (`ativo`, `cancelado`, `soft_deletado`)
- `data_criacao`: timestamp
- `data_atualizacao`: timestamp

### Tarefa
- `id`: UUID
- `familia_id`: UUID
- `titulo`: string
- `descricao`: string
- `responsavel_id`: UUID
- `prioridade`: string (`baixa`, `normal`, `alta`, `urgente`)
- `status`: string (`a_fazer`, `em_progresso`, `concluido`)
- `data_limite`: timestamp
- `data_conclusao`: timestamp
- `historico`: lista de alterações
- `status_exclusao`: string (`ativo`, `soft_deletado`)

### Despesa
- `id`: UUID
- `familia_id`: UUID
- `valor`: decimal
- `categoria`: string
- `descricao`: string
- `data`: timestamp
- `quem_pagou_id`: UUID
- `tags`: lista de strings
- `data_criacao`: timestamp

### Orçamento
- `id`: UUID
- `familia_id`: UUID
- `categoria`: string
- `limite`: decimal
- `periodo`: string (`mensal`, `anual`)
- `data_inicio`: timestamp
- `data_fim`: timestamp
- `status`: string (`ativo`, `inativo`)

### Lista de Compras
- `id`: UUID
- `familia_id`: UUID
- `nome`: string
- `loja`: string opcional
- `data_criacao`: timestamp
- `data_ultima_edicao`: timestamp
- `status`: string (`ativa`, `arquivada`)
- `itens`: lista de `Item de Lista de Compras`

### Item de Lista de Compras
- `id`: UUID
- `lista_id`: UUID
- `nome`: string
- `quantidade`: integer
- `categoria`: string opcional
- `status`: string (`a_comprar`, `comprado`)
- `data_adicao`: timestamp
- `data_compra`: timestamp

### Documento
- `id`: UUID
- `familia_id`: UUID
- `nome_arquivo`: string
- `tipo`: string
- `tamanho_bytes`: integer
- `categoria`: string
- `data_upload`: timestamp
- `usuario_upload_id`: UUID
- `data_revisao`: timestamp opcional
- `status`: string (`ativo`, `arquivado`, `soft_deletado`)
- `uri_segura`: string

### Aviso
- `id`: UUID
- `familia_id`: UUID
- `titulo`: string
- `conteudo`: string
- `fixado`: boolean
- `data_criacao`: timestamp
- `criador_id`: UUID
- `reacoes`: lista de objetos `{ usuario_id, emoji }`
- `status`: string (`ativo`, `arquivado`)

### Integração
- `id`: UUID
- `familia_id`: UUID
- `tipo`: string (`google`, `outlook`)
- `token_oauth`: string
- `refresh_token`: string
- `data_expiracao`: timestamp
- `status`: string (`ativo`, `expirado`)
- `ultima_sincronizacao`: timestamp

### Auditoria
- `id`: UUID
- `usuario_id`: UUID
- `familia_id`: UUID
- `acao`: string
- `alvo`: string
- `valores_anteriores`: JSON
- `valores_novos`: JSON
- `timestamp`: timestamp
- `ip_origem`: string
- `user_agent`: string

## Relacionamentos

- Uma `Família` possui muitos `Usuários`.
- Um `Usuário` pertence a uma `Família` e pode ter múltiplas `Permissões` por módulo.
- Uma `Família` possui muitos `Eventos`, `Tarefas`, `Despesas`, `Listas`, `Documentos`, `Avisos`, `Integrações` e registros de `Auditoria`.
- `Eventos`, `Tarefas`, `Despesas`, `Listas` e `Documentos` estão vinculados ao `familia_id` para segmentação de dados.
- `Responsável` e `quem_pagou` são referências de `Usuário` em `Tarefa` e `Despesa`, respectivamente.
- `Integração` vincula calendários externos ao mesmo `familia_id`.

## Regras de Validação

- Emails devem ser únicos por família.
- Datas devem ser validadas em UTC e gravadas como timestamps.
- Nomes de usuário e família devem ter tamanho mínimo e máximo definidos.
- Itens de lista de compras obrigam nome e quantidade mínima de 1.
- Documentos aceitam apenas tipos de arquivo permitidos e tamanhos até 100MB.
- Soft deletes mantêm registros por 30 dias (90 dias para documentos) antes de exclusão permanente.
