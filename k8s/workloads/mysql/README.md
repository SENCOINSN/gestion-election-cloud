# MySQL StatefulSet Project

This project sets up a MySQL database in a Kubernetes environment using a StatefulSet. It includes all necessary configurations for deployment, service exposure, persistent storage, and initialization.

## Project Structure

```
mysql-statefulset
├── k8s
│   ├── statefulset-mysql.yaml       # Defines the StatefulSet for MySQL
│   ├── service-mysql.yaml            # Exposes the MySQL StatefulSet
│   ├── pvc-mysql.yaml                # PersistentVolumeClaims for MySQL
│   ├── configmap-mysql.yaml          # Configuration settings for MySQL
│   └── secret-mysql.yaml             # Sensitive information for MySQL
├── sql
│   └── init.sql                      # SQL commands to initialize the database
├── .gitignore                        # Files and directories to ignore by Git
└── README.md                         # Documentation for the project
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd mysql-statefulset
   ```

2. **Deploy the MySQL StatefulSet**
   Apply the Kubernetes configurations in the `k8s` directory:
   ```bash
   kubectl apply -f k8s/pvc-mysql.yaml
   kubectl apply -f k8s/configmap-mysql.yaml
   kubectl apply -f k8s/secret-mysql.yaml
   kubectl apply -f k8s/statefulset-mysql.yaml
   kubectl apply -f k8s/service-mysql.yaml
   ```

3. **Initialize the Database**
   After the StatefulSet is running, you can initialize the database using the `init.sql` script:
   ```bash
   kubectl exec -i <mysql-pod-name> -- mysql -u root -p < /sql/init.sql
   ```

## Usage

- Access the MySQL database using the service created in `service-mysql.yaml`.
- Ensure to manage your database credentials securely using the `secret-mysql.yaml` file.

## Notes

- Make sure you have a Kubernetes cluster running and `kubectl` configured to interact with it.
- Adjust the configurations in the YAML files as necessary to fit your environment and requirements.