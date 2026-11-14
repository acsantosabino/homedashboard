import os
from pathlib import Path


def test_initial_migration_file_exists():
    migration_path = Path(__file__).resolve().parents[1] / "db" / "migrations" / "0001_initial_schema.sql"
    assert migration_path.exists()


def test_migration_contains_familias_table():
    migration_path = Path(__file__).resolve().parents[1] / "db" / "migrations" / "0001_initial_schema.sql"
    content = migration_path.read_text(encoding="utf-8")
    assert "CREATE TABLE IF NOT EXISTS familias" in content
    assert "CREATE TABLE IF NOT EXISTS usuarios" in content
    assert "CREATE TABLE IF NOT EXISTS permissoes" in content
    assert "CREATE TABLE IF NOT EXISTS auditoria" in content
