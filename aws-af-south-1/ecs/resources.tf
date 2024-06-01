resource "aws_ecs_cluster" "tfer--awseb-UGDAS-Prod-env-nupqmgez3v" {
  name = "awseb-UGDAS-Prod-env-nupqmgez3v"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_task_definition" "tfer--task-definition-002F-awseb-UGDAS-Prod-env-nupqmgez3v" {
  container_definitions = "[{\"command\":[\"/start\"],\"cpu\":0,\"environment\":[{\"name\":\"CELERY_BROKER_URL\",\"value\":\"redis://redis:6379/0\"},{\"name\":\"CELERY_FLOWER_PASSWORD\",\"value\":\"Te33984FDgjejnc49044jhvjhvfdgerwwe\"},{\"name\":\"CELERY_FLOWER_USER\",\"value\":\"YZTtFbQZOaYoXcsdfsd4598sa9dfsdfREGFjnfew4534\"},{\"name\":\"DJANGO_ACCOUNT_ALLOW_REGISTRATION\",\"value\":\"True\"},{\"name\":\"DJANGO_ADMIN_URL\",\"value\":\"admin/\"},{\"name\":\"DJANGO_ALLOWED_HOSTS\",\"value\":\"*\"},{\"name\":\"DJANGO_CORS_ALLOWED_ORIGINS\",\"value\":\"https://dev.zaidi.ug,https://www.dev.zaidi.ug,https://dev-eposta-api.zaidi.ug,https://www.dev-eposta-api.zaidi.ug,\"},{\"name\":\"DJANGO_DEBUG\",\"value\":\"True\"},{\"name\":\"DJANGO_EMAIL_SUBJECT_PREFIX\",\"value\":\"[DAS UG]\"},{\"name\":\"DJANGO_SECRET_KEY\",\"value\":\"ESDRFwuer3454356SDFjrdfkjqwdasjdihjw34543598sdfjweRFSDJfh34523jkhsdf\"},{\"name\":\"DJANGO_SECURE_SSL_REDIRECT\",\"value\":\"False\"},{\"name\":\"DJANGO_SETTINGS_MODULE\",\"value\":\"config.settings.production\"},{\"name\":\"EMAIL_HOST_PASSWORD\",\"value\":\"soegumleqgdiulhd\"},{\"name\":\"EMAIL_HOST_USER\",\"value\":\"theadasapp@gmail.com\"},{\"name\":\"INFOBIP_API_BASE_URL\",\"value\":\"9181acf2b077ecb94bb209b7f3570444-37c7737f-6fb7-44f7-80ba-0204aabd5dc8\"},{\"name\":\"INFOBIP_API_KEY\",\"value\":\"9181acf2b077ecb94bb209b7f3570444-37c7737f-6fb7-44f7-80ba-0204aabd5dc8\"},{\"name\":\"POSTGRES_DB\",\"value\":\"ugdasdb\"},{\"name\":\"POSTGRES_HOST\",\"value\":\"ugdas-postgres-prod.c3km2yc8uf3h.af-south-1.rds.amazonaws.com\"},{\"name\":\"POSTGRES_PASSWORD\",\"value\":\"fmmj22PjbrZUx3zULqLqYyUqmxvZ432okeKqeS\"},{\"name\":\"POSTGRES_PORT\",\"value\":\"5432\"},{\"name\":\"POSTGRES_USER\",\"value\":\"ugdasdbuser\"},{\"name\":\"REDIS_URL\",\"value\":\"redis://redis:6379/0\"},{\"name\":\"SENTRY_DSN\",\"value\":\"https://d81cdeefbde94a169bc80facbfaa52a3@o4505091106996224.ingest.us.sentry.io/4505091108175872\"},{\"name\":\"SENTRY_TRACES_SAMPLE_RATE\",\"value\":\"5.0\"},{\"name\":\"WEB_CONCURRENCY\",\"value\":\"4\"}],\"essential\":true,\"image\":\"211125588594.dkr.ecr.af-south-1.amazonaws.com/ugdas_backend:1.0.0\",\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"ugdas_backend\",\"portMappings\":[{\"containerPort\":5000,\"hostPort\":80,\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"
  family                = "awseb-UGDAS-Prod-env-nupqmgez3v"

  volume {
    host_path = "/var/log/containers/ugdas_backend"
    name      = "awseb-logs-ugdas_backend"
  }
}
