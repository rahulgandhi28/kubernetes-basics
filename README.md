# Kubernetes-Basics-Assignment  

Note:Set the Docker environment to use Minikube’s Docker daemon  
Command: ``` eval $(minikube docker-env) ```

1. **Build the Docker Image**

    ```
    docker build -t hello-world-html .
    ```

2. **Deploy to Kubernetes**

    ```bash
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    ```

3. **Expose the Application**

      ```bash
      kubectl port-forward service/hello-world-service 8081:8081
      ```
4. **Scale the Application**

    To scale the application, modify the `replicas` field in `deployment.yaml` and apply the changes:

    ```yaml
    spec:
      replicas: 
    ```
We have already used 2 replicas in our deployment.yml

***Now you can access the application on localhost:8081***

**Bonus Question**

In order to enhance the application deployment by adding a health check endpoint and configuring liveness and readiness probes in the Kubernetes deployment we can attach the following code in our deployment file and the redeploy the pods using this file.

```DockerFile

spec:
      containers:
      - name: hello-world-container
        image: your-dockerhub-username/hello-world-app:latest
        ports:
        - containerPort: 80
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 30
          periodSeconds: 10
          failureThreshold: 3
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 15
          periodSeconds: 5
          failureThreshold: 3
```


    
