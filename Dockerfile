FROM python:3.6

# Copiando os arquivos do projeto para o diretório /usr/src/app
COPY . /usr/src/app

# Definindo o diretório onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
COPY requirements.txt ./

# Instalando os requerimentos com o PIP
# Instalando os requerimentos com o PIP e o driver MySQL
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install mysqlclient

# Expondo a porta da APP
EXPOSE 8000

# Executando o comando para subir a aplicação
CMD ["gunicorn", "to_do.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]