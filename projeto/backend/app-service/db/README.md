# Migração PostgreSQL

Este diretório contém o mecanismo de migrações base e a primeira versão do esquema de banco de dados.

Para aplicar as migrações em um ambiente com PostgreSQL disponível:

```bash
python projeto/backend/app-service/db/migrate.py
```

O script busca variáveis de ambiente padrão para conexão com PostgreSQL:

- `PGHOST`
- `PGPORT`
- `PGUSER`
- `PGPASSWORD`
- `PGDATABASE`
