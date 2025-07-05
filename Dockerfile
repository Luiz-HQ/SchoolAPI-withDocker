FROM python:3.13.5-alpine3.22

#Define o diretório de trabalho dentro do contêiner como /app. Isso organiza melhor os arquivos.
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

#Instala as dependências do projeto. A opção --no-cache-dir evita o armazenamento de cache para manter a imagem menor e garantir uma instalação consistente.
RUN pip install --no-cache-dir -r requirements.txt

#Copia todo o código da aplicação para o diretório de trabalho.
COPY . .

#Indica que a aplicação dentro do contêiner escutará na porta 8000
EXPOSE 8000

#Define o comando padrão para iniciar a aplicação usando o Uvicorn, que é compatível com o FastAPI. Ele escuta em todas as interfaces (0.0.0.0) na porta 8000.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

#Aula 1: Marvel