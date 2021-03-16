docker rm -f mlflow
docker run -d -it -p 8110:5000 --env-file=settings.env -v /data/mlflow/mlflow.db:/mlflow.db -v /data/mlflow/artifacts/:/mlruns  --name mlflow mlflow-docker:latest

