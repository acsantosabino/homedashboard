# Robot Framework E2E

Este diretório contém a configuração base para os testes E2E do MyHomeDash usando Robot Framework.

## Como rodar

```bash
python -m pip install --upgrade pip
pip install -r tests/e2e/robot/requirements.txt
robot -d tests/e2e/robot/reports tests/e2e/robot
```

## Estrutura

- `requirements.txt` — dependências do Robot Framework
- `resources/common.robot` — palavras-chave comuns e variáveis de ambiente
- `reports/` — saída de execução de testes
