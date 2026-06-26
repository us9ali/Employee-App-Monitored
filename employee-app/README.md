# Employee Directory App

A web application to manage employees — stores data in RDS PostgreSQL and profile photos in S3. Runs in Kubernetes (EKS).

## Architecture

```
Browser → LoadBalancer → Frontend (Nginx) → Backend (Flask) → RDS PostgreSQL
                                                            → S3 (photos)
```

## Structure

```
employee-app/
├── backend/
│   ├── app.py              # Flask API (CRUD + S3 upload)
│   ├── requirements.txt    # Python dependencies
│   └── Dockerfile          # Backend container image
├── frontend/
│   ├── index.html          # Web UI
│   ├── nginx.conf          # Nginx config (serves UI + proxies API)
│   └── Dockerfile          # Frontend container image
└── helm/
    └── employee-app/
        ├── Chart.yaml      # Helm chart metadata
        ├── values.yaml     # Default values (uses account 075120018043)
        └── templates/
            ├── namespace.yaml
            ├── serviceaccount.yaml
            ├── secret.yaml
            ├── backend-deployment.yaml
            ├── backend-service.yaml
            ├── frontend-deployment.yaml
            └── frontend-service.yaml
```

## Deployment Steps

### 1. Deploy Infrastructure (from `../terraform/` folder)
```bash
cd ../terraform
terraform init
terraform apply -var-file=env/dev/terraform.tfvars
```

### 2. Build & Push Docker Images
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 075120018043.dkr.ecr.us-east-1.amazonaws.com

# Backend
cd backend/
docker build -t employee-backend .
docker tag employee-backend:latest 075120018043.dkr.ecr.us-east-1.amazonaws.com/employee-backend:latest
docker push 075120018043.dkr.ecr.us-east-1.amazonaws.com/employee-backend:latest

# Frontend
cd ../frontend/
docker build -t employee-frontend .
docker tag employee-frontend:latest 075120018043.dkr.ecr.us-east-1.amazonaws.com/employee-frontend:latest
docker push 075120018043.dkr.ecr.us-east-1.amazonaws.com/employee-frontend:latest
```

### 3. Deploy to Kubernetes with Helm
```bash
helm install employee-app helm/employee-app \
  --namespace employee-app \
  --create-namespace \
  --set database.host=<RDS_ENDPOINT> \
  --set database.password=<DB_PASSWORD> \
  --set serviceAccount.roleArn=<S3_ACCESS_ROLE_ARN>
```

### 4. Access the App
```bash
kubectl get svc -n employee-app  # Get LoadBalancer URL
```
Open the LoadBalancer URL in your browser.

## Upgrade
```bash
helm upgrade employee-app helm/employee-app \
  --namespace employee-app \
  --set database.host=<RDS_ENDPOINT> \
  --set database.password=<DB_PASSWORD> \
  --set serviceAccount.roleArn=<S3_ACCESS_ROLE_ARN>
```

## Uninstall
```bash
helm uninstall employee-app -n employee-app
```
