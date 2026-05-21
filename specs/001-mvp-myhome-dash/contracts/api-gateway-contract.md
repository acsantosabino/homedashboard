# Contrato de API Gateway: MVP MyHomeDash

## Visão Geral

O API Gateway do MyHomeDash expõe a API pública do backend e orquestra chamadas para funções AWS Lambda. O contrato de API deve ser documentado em OpenAPI e mantido em `projeto/api-gtw/openapi.yaml`.

Para atender à LGPD, os dados pessoais devem permanecer em infraestrutura localizada no Brasil e os termos de uso devem declarar explicitamente que não haverá compartilhamento de dados pessoais com terceiros sem consentimento expresso.

## Principais Endpoints

- `POST /auth/login` - autenticação de usuário
- `POST /auth/register` - criação de conta e família
- `POST /auth/forgot-password` - requisição de redefinição de senha
- `GET /familias/{familia_id}` - consulta dados da família
- `GET /familias/{familia_id}/usuarios` - lista membros da família
- `POST /familias/{familia_id}/usuarios` - adicionar membro via convite
- `GET /calendario` - consulta eventos do calendário compartilhado
- `POST /calendario` - criação de evento
- `PUT /calendario/{evento_id}` - atualização de evento
- `DELETE /calendario/{evento_id}` - exclusão de evento
- `GET /tarefas` - lista tarefas
- `POST /tarefas` - criação de tarefa
- `PUT /tarefas/{tarefa_id}` - atualização de tarefa
- `DELETE /tarefas/{tarefa_id}` - exclusão de tarefa
- `GET /financas/despesas` - lista despesas
- `POST /financas/despesas` - registrar despesa
- `GET /listas` - lista de compras compartilhadas
- `POST /listas` - criar lista de compras
- `PUT /listas/{lista_id}` - atualizar lista de compras
- `POST /documentos` - upload de documento
- `GET /avisos` - lista avisos
- `POST /avisos` - criar aviso

## Contrato de Integração

- Autenticação: JWT ou token de sessão via cabeçalho `Authorization`
- Erros: padrão JSON com campos `code`, `message` e `details`
- Versionamento: rotas devem ser versionadas a partir de `/v1/` quando aplicável
- Segurança: TLS obrigatório em todas as comunicações
- O contrato deve ser validado em relação ao documento `specs/001-mvp-myhome-dash/contracts/api-gateway-contract.md` e o OpenAPI deve descrever todas as respostas possíveis de cada endpoint, incluindo erros de autorização, validação e disponibilidade.

## Observações de Implementação

- O API Gateway deve suportar orquestração de múltiplas funções Lambda e aplicar autorização por rota.
- Dados sensíveis não devem ser expostos em respostas de API.
- O contrato deve permanecer alinhado com o OpenAPI em `projeto/api-gtw/openapi.yaml`.
- O contrato de implementação deve respeitar este documento e ser validado contra ele, prevendo todas as respostas possíveis de cada endpoint, inclusive estados de erro e respostas de não autorização.

## Referências

- `projeto/api-gtw/openapi.yaml`
- `specs/001-mvp-myhome-dash/spec.md`
