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
terraform plan
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

### Step 6: Cleanup — Delete Application and Cluster

To avoid unexpected charges, first delete the deployed app from your EKS cluster, then destroy the cluster and related AWS resources using Terraform.

1. Delete the Application from the EKS Cluster
Since your app is deployed in the sample-app namespace, the easiest way is to delete the whole namespace, which removes all resources inside it (deployments, services, pods, etc.):

delete namepsace or delete individual resources (deployments, services)
```bash
cd deploy-sample-app
kubectl delete namespace sample-app 
```
Alternatively, if you want to delete resources individually, run:
```bash
kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
kubectl delete -f namespace.yaml
```
Verify the app is deleted:
```bash
kubectl get all -n sample-app
# This should return no resources if namespace deleted
```

2. Destroy the EKS Cluster and AWS Resources with Terraform
Once your app is removed, destroy the entire EKS cluster and associated AWS infrastructure created by Terraform:
```bash
cd create-cluster
terraform destroy
```
This command will remove the cluster, VPC, subnets, IAM roles, and all other resources defined in your Terraform configurations.
