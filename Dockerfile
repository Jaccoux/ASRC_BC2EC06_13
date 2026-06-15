FROM python:3.10-slim

WORKDIR /app

# Sécurité : Éviter de tourner en root pour l'application
RUN useradd -m appuser && chown -R appuser /app
USER appuser

COPY --chown=appuser:appuser . .

CMD ["python", "main.py"]