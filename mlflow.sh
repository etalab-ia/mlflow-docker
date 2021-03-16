#!/bin/bash -x

if [[ -z "${ARTIFACT_URL}" ]]; then
    export ARTIFACT_URL="file:///mlruns"
fi

if [[ -z "${DATABASE_URL}" ]]; then
    export DATABASE_URL="sqlite:///mlflow.db"
fi


exec mlflow server --backend-store-uri=$DATABASE_URL --default-artifact-root=$ARTIFACT_URL --host 0.0.0.0 --static-prefix /mlflow

