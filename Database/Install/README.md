# Install database of project

## Step 1 - Add bitnami repository to helm project:
$ helm repo add my-repo https://charts.bitnami.com/bitnami

## Step 2 - Create namespace project:
$ kubectl create namespace database-dev
$ kubectl create namespace database-sit
$ kubectl create namespace database-uat
$ kubectl create namespace database-prd

## Step 3 - Install postgrasql to kubernetes:
$ helm install database-dev my-repo/postgresql -n database-dev
$ helm install database-sit my-repo/postgresql -n database-sit
$ helm install database-uat my-repo/postgresql -n database-uat
$ helm install database-prd my-repo/postgresql -n database-prd

## NOTE - How to check password:
$ kubectl get secret --namespace database-dev database-dev-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d
$ kubectl get secret --namespace database-sit database-sit-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d
$ kubectl get secret --namespace database-uat database-uat-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d
$ kubectl get secret --namespace database-prd database-prd-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d

## NOTE - To connect to your database run the following command:
$ kubectl run database-dev-postgresql-client --rm --tty -i --restart='Never' --namespace database-dev --image docker.io/bitnami/postgresql:15.1.0-debian-11-r12      --env="PGPASSWORD=$POSTGRES_PASSWORD_DEV" --command -- psql --host database-dev-postgresql -U postgres -d postgres -p 5432

$ kubectl run database-sit-postgresql-client --rm --tty -i --restart='Never' --namespace database-sit --image docker.io/bitnami/postgresql:15.1.0-debian-11-r12 --env="PGPASSWORD=$POSTGRES_PASSWORD_SIT" --command -- psql --host database-sit-postgresql -U postgres -d postgres -p 5432

$ kubectl run database-uat-postgresql-client --rm --tty -i --restart='Never' --namespace database-uat --image docker.io/bitnami/postgresql:15.1.0-debian-11-r12 --env="PGPASSWORD=$POSTGRES_PASSWORD_UAT" --command -- psql --host database-uat-postgresql -U postgres -d postgres -p 5432

$ kubectl run database-prd-postgresql-client --rm --tty -i --restart='Never' --namespace database-prd --image docker.io/bitnami/postgresql:15.1.0-debian-11-r12 --env="PGPASSWORD=$POSTGRES_PASSWORD_PRD" --command -- psql --host database-prd-postgresql -U postgres -d postgres -p 5432

## NOTE - To connect to your database from outside the cluster execute the following commands:
$ kubectl port-forward --namespace database-dev svc/database-dev-postgresql 5432:5432 & PGPASSWORD="$POSTGRES_PASSWORD_DEV" psql --host 127.0.0.1 -U postgres -d postgres -p 5432
$ kubectl port-forward --namespace database-sit svc/database-sit-postgresql 5432:5432 & PGPASSWORD="$POSTGRES_PASSWORD_SIT" psql --host 127.0.0.1 -U postgres -d postgres -p 5432
$ kubectl port-forward --namespace database-uat svc/database-uat-postgresql 5432:5432 & PGPASSWORD="$POSTGRES_PASSWORD_UAT" psql --host 127.0.0.1 -U postgres -d postgres -p 5432
$ kubectl port-forward --namespace database-prd svc/database-prd-postgresql 5432:5432 & PGPASSWORD="$POSTGRES_PASSWORD_PRD" psql --host 127.0.0.1 -U postgres -d postgres -p 5432