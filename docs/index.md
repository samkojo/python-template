# Template Python

Projeto para template python.

## Overview

A ideia é listarmos todas ferramentas que serão utilizadas, bem como os detalhes de instalação e uso.

## Iniciando projeto passo a passo

### EditorConfig
Para padronizarmos estilo de codificação de arquivos.

Como exemplo de configuracao do `.editorconfig`:
```
# EditorConfig is awesome: https://EditorConfig.org
# Wiki: https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties

# Referencias:
# https://github.com/python/cpython/blob/main/.editorconfig
# https://github.com/django/django/blob/main/.editorconfig
# https://github.com/NLeSC/python-template/blob/main/.editorconfig
# https://github.com/trailofbits/pip-audit/blob/main/.editorconfig
root = true

# Configuracao geral para todos arquivos com identacao menor de 2 espacos
# removento espacos em branco no final da linha
# sempre deixando um linha em branco no final do arquivo
[*]
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
indent_style = space
indent_size = 2

# Para arquivos Python deixei o padrao PEP8 de identacao com 4 espacos
[*.py]
indent_style = space
indent_size = 4

[Makefile]
indent_style = tab
```

### gitignore
Para definirmos arquivos que não devem ser comitados por padrao.

Como base podemos utilizar a geração do `.gitignore` desse [gerador](https://www.toptal.com/developers/gitignore/) adicionando como parametro `python` por exemplo.

### Pyenv
Para gerenciar versões de python.
*Necessário a [instalação](https://github.com/pyenv/pyenv#installation) para utilizacao*

Primeiro instalamos a versão que queremos utilizar, como exemplo Python 3.9.12
```
pyenv install 3.9.12
```

Na raiz do projeto podemos definir que iremos utilizar essa versão
```
pyenv local 3.9.12
```

### Poetry
Nosso gerenciador de pacotes e dependencias.
*Necessário a [instalação](https://python-poetry.org/docs/#installation) para utilizacao*

Iniciamos o poetry no nosso projeto
```
poetry init -n
```

Para respeitarmos a versão que definimos no pyenv conferir e corrigir se necessário a versão do python no arquivo `pyproject.toml` e trecho `[tool.poetry.dependencies]`.

Por exemplo:
```
[tool.poetry.dependencies]
python = "^3.9.12"
```

Instalamos para iniciar o ambiente virtual
```
poetry install
```

Acessamos o shell poetry, para podemos utilizar o projeto
```
poetry shell
```

### Lint
Como formatadores de codigo podemos utilizar o blue e isort.

Para instalar:
```
poetry add blue -D
poetry add isort -D
```

Como analise de codigo podemos utilizar o prospector com mypy.

Para instalar:
```
poetry add prospector -D
poetry add mypy -D
```

Verificar problema de seguranca comuns no codigo.
****
Para instação:
```
poetry add bandit -D
```

Podemos configurar o prospector com um arquivo `prospector.yaml` na raiz do projeto.
Como exemplo:
```
strictness: high
doc-warnings: false
test-warnings: false
autodetect: false
member-warnings: false
max-line-length: 79

mypy:
  run: true
  options:
    ignore-missing-imports: true
    follow-imports: skip

bandit:
  run: true
```

### Pytest
Ferramenta para teste.

Para instalação:
```
poetry add pytest -D
```

### Safety
Verificador de vunerabilidades de dependencias.

Para instalação:
```
poetry add safety -D
```

### Mkdocs
Ferramenta para documentação

Para instalação:
```
poetry add mkdocs -D
```

Para iniciar a documentação com mkdocs no projeto:
```
mkdocs new .
```

Para instalacao extensoes e temas utilizados nesse exemplo:
```
poetry add pymdown-extensions -D
poetry add mkdocs-material -D
```

Ativamos a extensao atraves do arquivo `mkdocs.yml` como exemplo:
```
site_name: Template Python
theme:
  name: material
  palette:
    - scheme: default
      primary: blue grey
      toggle:
        icon: material/weather-night
        name: Modo noturno
    - scheme: slate
      primary: indigo
      toggle:
        icon: material/weather-sunny
        name: Modo claro


markdown_extensions:
  - pymdownx.tasklist  # Lista de tarefas
  - pymdownx.emoji  # Emojis
  - pymdownx.mark
  - pymdownx.tilde
  - pymdownx.highlight
```

### Makefile
Para facilitarmos no desenvolvimento do projeto, criamos scripts para organizarmos algumas tarefas comuns.

Como exemplo temos o `Makefile` com base nas ferramentas apresentadas:
```
.PHONY: install
install:
	@poetry install

.PHONY: format
format:
	@blue .
	@isort .

.PHONY: lint
lint:
	@blue --check .
	@isort --check .
	@prospector

.PHONY: test
test:
	@pytest . -v

.PHONY: check
check:
	@safety check
```
