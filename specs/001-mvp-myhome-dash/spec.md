# Especificação de Feature: MVP MyHomeDash - Plataforma de Gestão Familiar

**Ramo de Feature**: `feature/mvp-myhome-dash`

**Data de Criação**: 14 de maio de 2026

**Status**: Rascunho

**Entrada**: Descrição do usuário: Criar plataforma MVP de gestão familiar com calendário compartilhado, tarefas, finanças, listas de compras, documentos e comunicação interna, com conformidade LGPD, arquitetura cloud native em microserviços e cobertura mínima de 90% em testes.

## Cenários de Usuário e Testes *(obrigatório)*

### Cenário de Usuário 1 - Criar Família e Configurar Acesso (Prioridade: P1)

Um chefe de família cria a conta do MyHomeDash, adiciona membros da família e configura permissões básicas para cada membro. Este é o ponto de entrada crítico que deve funcionar impecavelmente, pois sem isso nenhuma outra funcionalidade tem valor.

**Por que esta prioridade**: Este é o primeiro passo obrigatório para qualquer usuário. O sistema não pode ser usado sem que a família e os acessos sejam configurados. É a funcionalidade de base que viabiliza todas as demais.

**Teste Independente**: Pode ser totalmente testado criando uma nova família, adicionando membros e verificando que cada membro consegue acessar com suas credenciais e permissões corretas. Entrega valor de segurança e governança.

**Cenários de Aceitação**:

1. **Dado** que um novo usuário acessa a aplicação, **Quando** clica em "Criar Nova Família", **Então** recebe um formulário para inserir dados básicos (nome da família, email, senha)
2. **Dado** que um usuário é responsável da família, **Quando** acessa "Gerenciar Membros", **Então** pode ver lista de membros com suas permissões
3. **Dado** que há membros adicionados, **Quando** o responsável define permissões para um membro, **Então** essas permissões são aplicadas imediatamente e o membro só vê funcionalidades permitidas
4. **Dado** que um membro recebe convite, **Quando** clica no link de convite, **Então** consegue aderir à família com uma senha criada por ele próprio
5. **Dado** que um responsável remove um membro, **Quando** o membro tenta acessar, **Então** recebe mensagem de acesso negado e seus dados históricos permanecem para auditoria

---

### Cenário de Usuário 2 - Calendário Compartilhado com Sincronização (Prioridade: P1)

Uma família usa o calendário compartilhado para coordenar atividades (compromissos, eventos, datas especiais). O calendário sincroniza com Google Calendar e Outlook, permitindo que mudanças em uma plataforma reflitam automaticamente na outra.

**Por que esta prioridade**: Calendários são centrais para coordenação familiar. A sincronização com plataformas externas é crítica porque muitos membros já usam essas ferramentas. A ausência disso força adoção de duas sistemas paralelos.

**Teste Independente**: Pode ser testado criando eventos, sincronizando com Google Calendar, modificando em Google Calendar e verificando que aparecem no MyHomeDash. Entrega valor de coordenação e reduz complexidade de gestão.

**Cenários de Aceitação**:

1. **Dado** que um usuário tem acesso ao calendário, **Quando** cria um novo evento, **Então** o evento aparece no calendário com título, data, hora, descrição e participantes
2. **Dado** que há integração com Google Calendar configurada, **Quando** um evento é criado no MyHomeDash, **Então** aparece no Google Calendar dentro de 5 minutos
3. **Dado** que há integração com Outlook configurada, **Quando** um evento é criado no Outlook, **Então** aparece no MyHomeDash dentro de 5 minutos
4. **Dado** que há conflito entre eventos nas sincronizações, **Quando** o sistema detecta, **Então** marca o evento com aviso de conflito e notifica o responsável
5. **Dado** que um membro sem permissão de edição visualiza o calendário, **Quando** tenta editar um evento, **Então** recebe mensagem que não tem permissão

---

### Cenário de Usuário 3 - Gerenciar Tarefas e Afazeres (Prioridade: P1)

A família utiliza listas de tarefas para organizar responsabilidades do dia a dia. Tarefas podem ser atribuídas a membros específicos, ter prazos, descrições e progresso de conclusão. O sistema notifica membros sobre tarefas atribuídas e prazos próximos.

**Por que esta prioridade**: Tarefas são essenciais para distribuir responsabilidades. Sem elas, a gestão familiar continua caótica. Esta é tão importante quanto o calendário para o valor proposto.

**Teste Independente**: Pode ser testado criando tarefas, atribuindo a membros, marcando como concluída e verificando notificações. Entrega valor de organização e accountability.

**Cenários de Aceitação**:

1. **Dado** que um usuário acessa a seção "Tarefas", **Quando** clica em "Nova Tarefa", **Então** abre formulário com campos: título, descrição, atribuído a, data limite, prioridade
2. **Dado** que uma tarefa é criada com data limite, **Quando** faltam 24 horas para o prazo, **Então** o responsável recebe notificação
3. **Dado** que uma tarefa é atribuída a um membro, **Quando** ela é criada/modificada, **Então** o membro recebe notificação
4. **Dado** que um membro clica em "Concluir Tarefa", **Quando** confirma a ação, **Então** a tarefa é marcada como concluída com timestamp e responsável registrados
5. **Dado** que uma tarefa está marcada como concluída, **Quando** alguém a visualiza, **Então** aparece em seção diferente (Histórico) para não poluir a lista ativa

---

### Cenário de Usuário 4 - Rastrear Despesas e Orçamentos (Prioridade: P2)

A família registra despesas diárias (compras, contas, gastos), categoriza-as e visualiza gráficos de gastos. O sistema permite definir orçamentos por categoria e alertar quando se aproxima do limite.

**Por que esta prioridade**: Controle financeiro é crítico para famílias, mas pode ser implementado após as funcionalidades de coordenação (calendário e tarefas). É P2 porque há famílias que precisam principalmente de coordenação.

**Teste Independente**: Pode ser testado registrando despesas, categorizando, visualizando gráficos e verificando alertas de orçamento. Entrega valor de controle financeiro.

**Cenários de Aceitação**:

1. **Dado** que um usuário acessa "Finanças", **Quando** clica em "Registrar Despesa", **Então** abre formulário com: valor, categoria, descrição, data, quem pagou
2. **Dado** que despesas foram registradas, **Quando** navega para "Gráficos", **Então** vê gráficos de gastos por categoria no mês atual
3. **Dado** que há um orçamento definido para categoria, **Quando** gasto ultrapassa 80% do orçamento, **Então** sistema mostra alerta visual
4. **Dado** que um usuário sem permissão tenta criar despesa, **Quando** tenta registrar, **Então** recebe mensagem de permissão negada
5. **Dado** que uma despesa é registrada, **Quando** outro membro tenta editar, **Então** se tem permissão consegue, senão recebe aviso

---

### Cenário de Usuário 5 - Listas de Compras Compartilhadas (Prioridade: P2)

A família cria listas de compras compartilhadas (por loja ou categoria), adiciona itens, marca como comprado e visualiza histórico. Múltiplos membros podem colaborar na mesma lista simultaneamente.

**Por que esta prioridade**: Listas de compras agregam valor significativo, mas não são bloqueadoras se não existirem no MVP. Calendário e tarefas são mais urgentes.

**Teste Independente**: Pode ser testado criando lista, adicionando itens, marcando como comprado e verificando que múltiplos usuários veem atualizações em tempo real. Entrega valor de coordenação de compras.

**Cenários de Aceitação**:

1. **Dado** que um usuário acessa "Listas de Compras", **Quando** clica em "Nova Lista", **Então** pode nomear a lista e opcionalmente associar a uma loja
2. **Dado** que está criando uma lista, **Quando** adiciona um item, **Então** item aparece na lista com checkbox
3. **Dado** que um membro marca um item como comprado, **Quando** marca o checkbox, **Então** outro membro visualizando a lista vê a mudança em tempo real
4. **Dado** que há uma lista com itens, **Quando** a lista é excluída, **Então** é movida para arquivo (soft delete) e pode ser restaurada por 30 dias

---

### Cenário de Usuário 6 - Armazenamento Seguro de Documentos (Prioridade: P3)

A família armazena documentos importantes (certidões, recibos, seguros, testamentos) em espaço seguro com categorização, busca e controle de acesso. Documentos são criptografados em repouso.

**Por que esta prioridade**: Armazenamento de documentos é importante para valor de longo prazo, mas não é crítico para MVP. Pode ser agregado após as funcionalidades de coordenação básica.

**Teste Independente**: Pode ser testado fazendo upload de documento, categorizando, buscando e verificando acesso restrito. Entrega valor de segurança e organização.

**Cenários de Aceitação**:

1. **Dado** que um usuário acessa "Documentos", **Quando** clica em "Upload", **Então** pode selecionar um arquivo até 100MB
2. **Dado** que um documento foi feito upload, **Quando** vai para a lista de documentos, **Então** aparece com nome, categoria, data de upload e responsável
3. **Dado** que há documentos, **Quando** usa busca por nome ou categoria, **Então** sistema filtra resultados relevantes
4. **Dado** que um documento expirou (data de revisão passou), **Quando** alguém visualiza o documento, **Então** há notificação visual de expiração
5. **Dado** que um membro sem permissão tenta acessar documento, **Quando** tenta, **Então** recebe erro "Acesso Negado"

---

### Cenários de Usuário 7 - Comunicação Interna com Mural de Avisos (Prioridade: P3)

A família usa mural compartilhado para avisos importantes (reunião de planejamento, avisos de segurança, lembretes). Avisos podem ser fixados, recebem notificações push.

**Por que esta prioridade**: Comunicação interna é importante para engajamento, mas não é bloqueadora. Tarefas e calendário já cobrem muita dessa funcionalidade.

**Teste Independente**: Pode ser testado criando aviso, fixando, enviando notificações e verificando que todos membros recebem. Entrega valor de comunicação centralizada.

**Cenários de Aceitação**:

1. **Dado** que um usuário acessa "Avisos", **Quando** clica em "Novo Aviso", **Então** abre editor para escrever mensagem
2. **Dado** que um aviso é criado, **Quando** quer fixar como importante, **Então** pode marcar como fixado e aparece no topo
3. **Dado** que um aviso é criado, **Quando** é enviado, **Então** todos membros recebem notificação push
4. **Dado** que há avisos antigos, **Quando** tem mais de 30 dias, **Então** podem ser arquivados automaticamente
5. **Dado** que um membro visualiza um aviso, **Quando** clica em "Reagir", **Então** pode adicionar emoji de reação

---

### Casos Extremos

- O que acontece quando dois membros editam a mesma tarefa simultaneamente?
- Como o sistema trata sincronização com Google Calendar quando há conflito de horários?
- Como funciona acesso quando um membro é removido da família (dados históricos)?
- Como o sistema lida com upload de arquivo muito grande ou arquivo malicioso?
- O que acontece se integração com Google Calendar/Outlook falha?
- Como o sistema gerencia quando permissões são alteradas em tempo real?
- Como funciona notificação para membros offline (sem conexão internet)?

## Requisitos *(obrigatório)*

### Requisitos Funcionais

**Núcleo de Autenticação e Autorização**

- **RF-001**: Sistema DEVE permitir criação de conta com email, senha e informações básicas do responsável da família
- **RF-002**: Sistema DEVE permitir login com email e senha, com validação de credenciais
- **RF-003**: Sistema DEVE implementar autenticação de dois fatores (2FA) via email ou aplicativo autenticador
- **RF-004**: Sistema DEVE permitir que responsável crie família e adicione membros via convite por email
- **RF-005**: Sistema DEVE permitir configuração granular de permissões por membro (visualizar, criar, editar, deletar) para cada módulo (Calendário, Tarefas, Finanças, Listas, Documentos, Avisos)
- **RF-006**: Sistema DEVE respeitar permissões em todas operações (visualização, criação, edição, exclusão)
- **RF-007**: Sistema DEVE registrar auditoria de quem fez o quê e quando para ações críticas (login, alteração de permissões, exclusão de dados)
- **RF-008**: Sistema DEVE permitir que usuário redefina senha via link enviado por email
- **RF-009**: Sistema DEVE criptografar dados sensíveis em repouso (senhas com hash bcrypt, dados em campos sensíveis)
- **RF-010**: Sistema DEVE implementar logout com invalidação de sessão

**Módulo de Calendário Compartilhado**

- **RF-011**: Sistema DEVE permitir criação de evento com título, data início, data fim, descrição, participantes, local
- **RF-012**: Sistema DEVE permitir edição e exclusão de eventos (soft delete com retenção de 30 dias para auditoria)
- **RF-013**: Sistema DEVE visualizar calendário por mês, semana e dia com todos eventos dos membros da família
- **RF-014**: Sistema DEVE notificar membros quando evento é criado/editado/excluído (se permissão permite)
- **RF-015**: Sistema DEVE integrar com Google Calendar via OAuth2 (autorização segura)
- **RF-016**: Sistema DEVE sincronizar eventos criados no MyHomeDash com Google Calendar em até 5 minutos
- **RF-017**: Sistema DEVE sincronizar eventos criados no Google Calendar para MyHomeDash em até 5 minutos
- **RF-018**: Sistema DEVE integrar com Outlook/Microsoft Calendar via OAuth2
- **RF-019**: Sistema DEVE sincronizar eventos com Outlook em ambas direções em até 5 minutos
- **RF-020**: Sistema DEVE detectar conflitos de sincronização (mesmo evento editado em múltiplas plataformas) e notificar usuário
- **RF-021**: Sistema DEVE permitir desativar sincronização com um calendário sem perder dados

**Módulo de Tarefas e Afazeres**

- **RF-022**: Sistema DEVE permitir criação de tarefa com título, descrição, responsável, data limite, prioridade (Baixa, Normal, Alta, Urgente)
- **RF-023**: Sistema DEVE permitir edição e exclusão de tarefas (soft delete com retenção de 30 dias)
- **RF-024**: Sistema DEVE visualizar tarefas em listas por status (A Fazer, Em Progresso, Concluído)
- **RF-025**: Sistema DEVE permitir atribuir tarefa a um membro específico
- **RF-026**: Sistema DEVE notificar membro quando tarefa é atribuída a ele
- **RF-027**: Sistema DEVE notificar membros relevantes 24 horas antes do prazo da tarefa
- **RF-028**: Sistema DEVE permitir marcar tarefa como concluída, com timestamp e registro de quem completou
- **RF-029**: Sistema DEVE permitir visualizar histórico de tarefas concluídas

**Módulo de Finanças e Orçamentos**

- **RF-030**: Sistema DEVE permitir registrar despesa com valor, categoria, descrição, data, quem pagou
- **RF-031**: Sistema DEVE permitir categorizar despesa (Alimentação, Transporte, Saúde, Educação, Moradia, Diversão, Outros)
- **RF-032**: Sistema DEVE visualizar lista de despesas com filtros por data, categoria, responsável
- **RF-033**: Sistema DEVE gerar gráficos de gastos por categoria (mês atual, últimos 3 meses, últimos 12 meses)
- **RF-034**: Sistema DEVE permitir definir orçamento por categoria com limite por período configurável (mensal ou anual)
- **RF-035**: Sistema DEVE alertar visualmente quando gastos em categoria atingem 80% do orçamento
- **RF-036**: Sistema DEVE alertar visualmente quando gastos em categoria excedem o orçamento
- **RF-037**: Sistema DEVE mostrar resumo de gastos familiares vs orçamentos no dashboard

**Módulo de Listas de Compras**

- **RF-038**: Sistema DEVE permitir criar lista de compras com nome e opcionalmente associar a uma loja
- **RF-039**: Sistema DEVE permitir adicionar itens à lista com nome, quantidade, categoria opcionais
- **RF-040**: Sistema DEVE permitir marcar item como comprado (checkbox), removendo da lista ativa
- **RF-041**: Sistema DEVE permitir editar ou remover itens da lista
- **RF-042**: Sistema DEVE sincronizar listas em tempo real entre múltiplos membros (WebSocket ou polling)
- **RF-043**: Sistema DEVE arquivar listas antigas (após 30 dias de última edição)
- **RF-044**: Sistema DEVE permitir visualizar histórico de listas e restaurar listas arquivadas

**Módulo de Armazenamento de Documentos**

- **RF-045**: Sistema DEVE permitir upload de arquivo com limite de 100MB por arquivo
- **RF-046**: Sistema DEVE categorizar documentos (Certidões, Seguros, Recibos, Testamentos, Outros)
- **RF-047**: Sistema DEVE criptografar documentos em repouso
- **RF-048**: Sistema DEVE permitir buscar documentos por nome ou categoria
- **RF-049**: Sistema DEVE permitir definir data de revisão para documentos (lembrete de atualização)
- **RF-050**: Sistema DEVE notificar quando data de revisão de documento passa
- **RF-051**: Sistema DEVE fazer soft delete de documentos (arquivar por 90 dias antes de deletar permanentemente)
- **RF-052**: Sistema DEVE respeitar permissões de acesso para download de documentos

**Módulo de Avisos e Comunicação Interna**

- **RF-053**: Sistema DEVE permitir criar aviso com texto e formatação básica (negrito, itálico, lista)
- **RF-054**: Sistema DEVE permitir fixar aviso como importante
- **RF-055**: Sistema DEVE notificar todos membros quando novo aviso é criado
- **RF-056**: Sistema DEVE permitir membros reagirem com emoji em avisos
- **RF-057**: Sistema DEVE arquivar automaticamente avisos com mais de 30 dias
- **RF-058**: Sistema DEVE permitir buscar avisos por palavras-chave

**Conformidade e Segurança**

- **RF-059**: Sistema DEVE ser conforme com LGPD (Lei Geral de Proteção de Dados)
- **RF-060**: Sistema DEVE ter política de privacidade clara e acessível
- **RF-061**: Sistema DEVE permitir usuário solicitar cópia de seus dados (direito de portabilidade LGPD)
- **RF-075**: Sistema DEVE hospedar todos os dados pessoais do MyHomeDash em infraestrutura localizada no Brasil para atender à LGPD.
- **RF-076**: Sistema DEVE incluir termos de uso acessíveis que declararem explicitamente não haver compartilhamento de dados pessoais com terceiros sem consentimento expresso.
- **RF-062**: Sistema DEVE permitir usuário solicitar exclusão de seus dados (direito ao esquecimento LGPD)
 
- **RF-063**: Sistema DEVE manter logs de acesso e atividades por mínimo 1 ano para conformidade
- **RF-064**: Sistema DEVE ter certificado SSL/TLS para todas comunicações
- **RF-065**: Sistema DEVE proteger contra CSRF (Cross-Site Request Forgery) com tokens
- **RF-066**: Sistema DEVE proteger contra SQL Injection com parametrização
- **RF-067**: Sistema DEVE validar todos inputs do usuário
- **RF-068**: Sistema DEVE implementar rate limiting para prevenir abuso
- **RF-069**: Sistema DEVE ter mecanismo de detecção de fraude para acessos suspeitos

**Dashboard e Interface**

- **RF-070**: Sistema DEVE exibir dashboard home com resumo: próximos eventos, tarefas atrasadas, gastos do mês, avisos recentes
- **RF-071**: Sistema DEVE responsivo em mobile (web mobile e futuramente app nativo)
- **RF-072**: Sistema DEVE ter tema claro e escuro com persistência de preferência
- **RF-073**: Sistema DEVE exibir notificações em tempo real (push, email, in-app)
- **RF-074**: Sistema DEVE usar email e in-app como canais principais de notificação; notificações push via navegador são opcionais para o MVP

## Requisitos Não Funcionais

- **RNF-001**: Infraestrutura deve ser definida e provisionada com Terraform em `/infra`, com módulos totalmente modulares e reutilizáveis.
- **RNF-002**: A infraestrutura Terraform deve ser organizada em diretórios separados para `backend`, `frontend` e `api-gtw`, e deve incluir configurações de roles, variáveis e ambientes separados.
- **RNF-003**: A infraestrutura deve usar módulos versionados em `/infra/modules`, incluindo roles, AWS Lambda, buckets S3, CloudFront e API Gateway.
- **RNF-004**: Configurações de ambiente devem ser separadas em `/infra/environments/` com arquivos TFVARS por ambiente (`dev`, `prod`, etc.).
- **RNF-005**: CI/CD deve ser implementado com GitHub Actions, incluindo lint, testes unitários, cobertura mínima de 90%, testes E2E automatizados e deploy controlado.
- **RNF-006**: Backend deve ser construído como funções serverless AWS Lambda e exposto por AWS API Gateway, mantendo contrato claro entre frontend e backend.
- **RNF-007**: Frontend deve ser organizado como microfrontends Angular hospedados em AWS S3 e distribuídos por CloudFront.
- **RNF-008**: As principais jornadas de usuário devem ser cobertas por testes end-to-end automatizados com Robot Framework.
- **RNF-009**: Toda documentação e código do projeto devem ser redigidos em português.
- **RNF-010**: A observabilidade deve incluir logs estruturados, métricas e alertas para erros críticos.
- **RNF-011**: O armazenamento relacional de dados transacionais deve ser implementado com AWS RDS PostgreSQL gerenciado, incluindo suporte a migrações de schema, integridade referencial e backups automáticos.
- **RNF-012**: A infraestrutura de AWS RDS PostgreSQL deve ser declarada em Terraform no diretório `/infra`, com configurações de ambiente separadas e estado versionado.

## Critérios de Sucesso *(obrigatório)*

### Resultados Mensuráveis

- **CS-001**: A cobertura de testes unitários deve ser de pelo menos 90% antes de qualquer merge para `develop`.
- **CS-002**: Pelo menos 3 jornadas principais de usuário P1 devem ser cobertas por testes E2E automatizados.
- **CS-003**: Eventos criados ou atualizados no MyHomeDash devem sincronizar com Google Calendar e Outlook em até 5 minutos.
- **CS-004**: 95% dos responsáveis que criarem uma nova família e adicionarem membros devem concluir o fluxo sem erro na primeira tentativa.
- **CS-005**: O dashboard inicial deve ser exibido em até 2 segundos para uma família com até 50 eventos e tarefas.
- **CS-006**: Logs de auditoria para ações críticas devem estar disponíveis por pelo menos 12 meses.
- **CS-007**: O banco de dados PostgreSQL gerenciado deve estar provisionado com esquema aplicado via migrações controladas e backups automáticos, garantindo failover ou recovery em menos de 30 minutos.
- **CS-008**: Solicitações de acesso, portabilidade ou exclusão de dados relacionadas à LGPD devem ser processadas em até 7 dias úteis.

## Assunções

- Assume-se que o MVP será implementado com Angular e Angular Material no frontend.
- Assume-se que o backend será implementado em Python como AWS Lambda, exposto por API Gateway.
- Assume-se que a infraestrutura será provisionada com Terraform e que o pipeline usará GitHub Actions para build, testes e deploy.
- Assume-se que a infraestrutura Terraform será modular, com diretórios separados em `/infra/backend`, `/infra/frontend`, `/infra/api-gtw`, e módulos reutilizáveis em `/infra/modules`.
- Assume-se que as configurações de ambiente serão separadas em `/infra/environments/`, usando arquivos TFVARS para `dev`, `prod` e outros ambientes.
- Assume-se que a sincronização com Google Calendar e Outlook usará OAuth2, com tokens armazenados em cofre seguro.
- Assume-se que o primeiro lançamento será uma aplicação web responsiva e não incluirá versão nativa mobile.
- Assume-se que dados sensíveis e credenciais serão protegidos conforme LGPD e melhores práticas de segurança.

### Entidades Chave

- **Família**: Representa grupo de usuários relacionados, com ID único, nome, data de criação, configurações compartilhadas
  
- **Usuário**: Membro da família com email, nome, foto, hash de senha, autenticação 2FA habilitada, data de criação, último login, status ativo/inativo

- **Permissões**: Define o que cada usuário pode fazer em cada módulo (visualizar, criar, editar, deletar, gerenciar permissões), armazenadas por usuário-família-módulo

- **Evento de Calendário**: Título, descrição, data/hora início, data/hora fim, local, participantes, recorrência (opcional), sincronização com Google/Outlook, criador, data criação, data última edição

- **Tarefa**: Título, descrição, responsável, prioridade, status (A Fazer, Em Progresso, Concluído), data limite, criador, data criação, data conclusão, histórico de alterações

- **Despesa**: Valor, categoria, descrição, data, quem pagou, criador, data criação, tags opcionais para agrupamento

- **Orçamento**: Categoria, limite mensal, família, período (mensal/anual), data criação, ativo/inativo

- **Item de Lista de Compras**: Nome, quantidade, categoria, status (A Comprar, Comprado), data adição, data marcado como comprado, lista associada

- **Lista de Compras**: Nome, descrição, loja associada (opcional), data criação, data última edição, criador, itens, membro que completou

- **Documento**: Nome original arquivo, extensão, tamanho, categoria, data upload, responsável upload, data revisão esperada, criptografado, membro acesso, data exclusão soft

- **Aviso**: Título, conteúdo, fixado (sim/não), data criação, criador, reações (membro + emoji), data arquivamento

- **Integração**: Tipo (Google, Outlook), token OAuth, refresh token, data ativação, data expiração token, status sincronização, última sincronização

- **Auditoria**: Usuário, ação, tabela alterada, valores antigos, valores novos, timestamp, IP origem, user agent

## Clarificações

### Sessão 2026-05-17

- Definir sincronização do calendário como bidirecional e eventual: o sistema aceita alterações externas e locais, mostra estado de sincronização e registra conflitos para resolução manual.
- Para o MVP, o canal de notificações prioritário é email e in-app; notificações push via navegador são consideradas recurso secundário.
- A autenticação de dois fatores (2FA) será obrigatória para responsáveis da família e recomendada para demais membros, suportando aplicativo autenticador e email.
- A criptografia aplica-se a dados sensíveis em repouso e todas as comunicações usam TLS/SSL.
- Retenção de soft delete: eventos, tarefas e listas são retidos por 30 dias para recuperação; documentos são retidos por 90 dias antes de exclusão permanente.
- A arquitetura cloud native em microserviços pode agrupar módulos funcionais próximos no MVP (por exemplo, Listas de Compras + Avisos em um único serviço) para reduzir complexidade inicial.
- O modelo Freemium do MVP terá plano gratuito com limite de até 5 membros e 5GB de armazenamento; planos pagos removem esses limites e adicionam recursos extras.
- O suporte a orçamentos deve permitir períodos flexíveis, inicialmente mensal e anual, com alerta acionado em 80% e excesso do limite.
- A detecção de fraude para o MVP será focada em anomalias de autenticação e tentativas de login suspeitas, não em análise financeira avançada.
- Uploads de documentos de até 100MB devem validar tipo de arquivo e escanear metadados básicos para evitar arquivos maliciosos.

## Critérios de Sucesso *(obrigatório)*

### Resultados Mensuráveis

- **CS-001**: Usuários conseguem completar criação de conta e configuração inicial da família em menos de 5 minutos
- **CS-002**: Calendário sincroniza com Google Calendar/Outlook em menos de 5 minutos após criação do evento
- **CS-003**: Sistema suporta mínimo 10 mil famílias simultâneas com 100+ membros por família sem degradação de performance
- **CS-004**: Tempo de resposta para todas requisições API é menor que 500ms no p95 (percentil 95)
- **CS-005**: Interface carrega em menos de 2 segundos em conexão 4G (LTE)
- **CS-006**: 95% dos membros conseguem completar tarefas principais (criar tarefa, visualizar calendário) na primeira tentativa sem suporte
- **CS-007**: Taxa de disponibilidade do serviço é mínimo 99.5% mensalmente
- **CS-008**: Criptografia implementada para todos dados sensíveis em repouso
- **CS-009**: Auditoria de segurança bem-sucedida por terceira parte independente
- **CS-010**: 90% cobertura de testes unitários em todas linhas de código (conforme Constituição)
- **CS-011**: 100% conformidade com requisitos LGPD validados por especialista
- **CS-012**: Usuários satisfeitos avaliam aplicação com mínimo 4.0/5.0 em reviews (após primeiro mês de uso)

## Suposições

- **Usuários têm conectividade à internet estável**: MVP não considera modo offline, mas interface pode indicar status de conexão
- **Usuários usam navegadores modernos**: Suporte para Chrome, Firefox, Safari, Edge das últimas 2 versões
- **Integração com Google Calendar/Outlook é prioritária**: As APIs de sincronização devem ser bem documentadas para futura manutenção
- **Segurança de dados é crítica desde o início**: Todas operações com dados sensíveis implementam criptografia e auditoria
- **Escalabilidade é considerada na arquitetura**: Microserviços permitirão escalar serviços independentemente conforme crescimento
- **Retenção de dados soft deleted por 30-90 dias**: Permite recuperação acidental de dados deletados antes de purga permanente
- **Notificações por email como principal canal**: Aplicação envia notificações por email; push notifications via browser é secundário para MVP
- **Orçamentos podem ser mensais ou anuais**: Usuário pode definir orçamento por período mensal ou anual
- **Permissões granulares permitem gestão de crianças**: Responsáveis podem restringir acesso de crianças a módulos e operações específicas
- **Conformidade LGPD é obrigatória desde dia 1**: Não será "adicionada depois"; todo código já respeita direitos de dados dos usuários
- **Arquitetura cloud native com microserviços**: Cada módulo (Calendário, Tarefas, Finanças, etc.) pode ser um serviço independente
- **CI/CD pipeline com verificação de cobertura de testes**: Builds não passam se cobertura cai abaixo de 90%
- **Documentação em português obrigatória**: Conforme Constituição do projeto
- **Modelo Freemium/SaaS**: MVP terá plano gratuito com limitações (ex: até 5 membros, 5GB storage) e planos pagos com recursos adicionais
- **Dados são persistidos em PostgreSQL gerenciado**: Com replicação para alta disponibilidade e integridade relacional obrigatória para dados estruturados do sistema- **Dados pessoais armazenados no Brasil**: A infraestrutura deve garantir residência de dados no Brasil e os termos de uso devem declarar não compartilhamento de dados pessoais com terceiros sem consentimento.
