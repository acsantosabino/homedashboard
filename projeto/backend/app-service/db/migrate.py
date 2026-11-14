#!/usr/bin/env python3
import glob
import os
import sys

import psycopg

SQL_DIR = os.path.join(os.path.dirname(__file__), "migrations")


def get_connection():
    params = {
        "host": os.environ.get("PGHOST", "localhost"),
        "port": os.environ.get("PGPORT", "5432"),
        "user": os.environ.get("PGUSER", "postgres"),
        "password": os.environ.get("PGPASSWORD", "postgres"),
        "dbname": os.environ.get("PGDATABASE", "myhomedash"),
    }
    print(f"Conectando ao PostgreSQL em {params['host']}:{params['port']} com db {params['dbname']}")
    return psycopg.connect(**params)


def collect_migrations():
    migrations = sorted(glob.glob(os.path.join(SQL_DIR, "*.sql")))
    if not migrations:
        raise SystemExit("Nenhuma migração SQL encontrada em migrations/")
    return migrations


def apply_migrations():
    migrations = collect_migrations()
    with get_connection() as conn:
        with conn.cursor() as cur:
            for migration in migrations:
                print(f"Aplicando migração: {os.path.basename(migration)}")
                with open(migration, "r", encoding="utf-8") as f:
                    cur.execute(f.read())
        conn.commit()
    print("Migrações aplicadas com sucesso.")


if __name__ == "__main__":
    apply_migrations()
