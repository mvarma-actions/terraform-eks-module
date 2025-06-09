# Terraform-eks-module

- Terraform module to create an Amazon EKS cluster.
- Deploy a sample app with a LoadBalancer service for easy external access

---

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- kubectl installed and configured
- Helm installed

---

## Usage

### Step 1: Create the EKS Cluster

```bash
cd create-cluster
terraform init
terraform apply
```

### Step 2: Configure kubectl

After creating the cluster, configure your local kubectl to connect to the new EKS cluster:
```bash
aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
```
> Replace <your-region> with your AWS region (e.g., us-west-2)
Replace <your-cluster-name> with your EKS cluster name

This updates your kubeconfig file (usually at ~/.kube/config) to allow kubectl to communicate with the cluster.

Verify access:
```bash
kubectl get nodes
```

### Step 3: Deploy the Sample Application

```bash
cd deploy-sample-app
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
### step 4: Verify deployment and service

Check pods status:
```bash
kubectl get pods -n sample-app
```
Check the service and its external IP or hostname:
```bash
kubectl get svc -n sample-app
```
> Look for the `EXTERNAL-IP` or `Hostname` of `sample-app` service — that’s your app URL!

### Step 5: Access Your Application

Open your browser and go to:
```cpp
http://<external-ip-or-hostname>
```
You should see the message:
```csharp
Hello from EKS!
```

### Step 5: Cleanup

To delete all created resources and avoid costs, run:

```bash
cd create-cluster
terraform destroy
```
