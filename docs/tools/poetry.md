# Poetry

Gerenciador de dependencia moderno que facilita o desenvolvimento.

## Instação
[Como instalar](https://python-poetry.org/docs/#installation)

## Configurações
Para utilizar o ambiente virtual na pasta `.venv` na raiz do projeto:
```bash
poetry config virtualenvs.in-project true --local
```

## Inicialização
- Para inicializar num projeto ja existente
```bash
# Inicializa e faz as perguntas iniciais de configuração
poetry init

## ou

# Inicializa com as configurações default
poetry init -n
```

- Para inicializar novo projeto com poetry
```bash
poetry new [nome_do_projeto]
```

Com o poetry ja iniciado no projeto.

1. Ativar o ambiente virtual no shell
```bash
poetry shell
```

2. Instalar as dependencias no ambiente virtual do projeto
```bash
poetry install
```

## Utilização
Adicionar uma dependencia
```bash
poetry add [dependencia] # -D [dependencia de desenvolvimento]
```

Adicionar uma dependencia de desenvolvimento (linters, tests, ...)
```bash
poetry add [dependencia] -D
```

Remover um dependencia
```bash
poetry remove [dependencia] -D
```