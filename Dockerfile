FROM python:3.8-slim-buster

WORKDIR /app

COPY . .

RUN python -m pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8501

CMD ["sh", "-c", "streamlit run --browser.serverAddress 0.0.0.0 \
    --server.enableWebsocketCompression False \
    --server.port 8501 \
    /app/app.py \
    --theme.base='dark'"]