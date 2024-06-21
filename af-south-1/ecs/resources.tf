# resource "aws_ecs_cluster" "awseb-UGDAS-Prod-env-nupqmgez3v" {
#   name = "awseb-UGDAS-Prod-env-nupqmgez3v"
#
#   setting {
#     name  = "containerInsights"
#     value = "disabled"
#   }
# }

# resource "aws_ecs_task_definition" "task-definition-002F-awseb-UGDAS-Prod-env-nupqmgez3v" {
#   container_definitions = "[{\"command\":[\"/start\"],\"cpu\":0,\"environment\":[{\"name\":\"AWS_S3_ACCESS_KEY_ID\",\"value\":\"AKIATCKAQ2JZK5SXICS6\"},{\"name\":\"AWS_S3_SECRET_ACCESS_KEY\",\"value\":\"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\"},{\"name\":\"AWS_USE_S3\",\"value\":\"True\"},{\"name\":\"CELERY_BROKER_URL\",\"value\":\"redis://redis:6379/0\"},{\"name\":\"CELERY_FLOWER_PASSWORD\",\"value\":\"Te33984FDgjejnc49044jhvjhvfdgerwwe\"},{\"name\":\"CELERY_FLOWER_USER\",\"value\":\"YZTtFbQZOaYoXcsdfsd4598sa9dfsdfREGFjnfew4534\"},{\"name\":\"DJANGO_ACCOUNT_ALLOW_REGISTRATION\",\"value\":\"True\"},{\"name\":\"DJANGO_ADMIN_URL\",\"value\":\"admin/\"},{\"name\":\"DJANGO_ALLOWED_HOSTS\",\"value\":\"*\"},{\"name\":\"DJANGO_CORS_ALLOWED_ORIGINS\",\"value\":\"https://dev.zaidi.ug,https://www.dev.zaidi.ug,https://dev-eposta-api.zaidi.ug,https://www.dev-eposta-api.zaidi.ug,\"},{\"name\":\"DJANGO_DEBUG\",\"value\":\"False\"},{\"name\":\"DJANGO_EMAIL_SUBJECT_PREFIX\",\"value\":\"[DAS UG]\"},{\"name\":\"DJANGO_SECRET_KEY\",\"value\":\"ESDRFwuer3454356SDFjrdfkjqwdasjdihjw34543598sdfjweRFSDJfh34523jkhsdf\"},{\"name\":\"DJANGO_SECURE_SSL_REDIRECT\",\"value\":\"False\"},{\"name\":\"DJANGO_SETTINGS_MODULE\",\"value\":\"config.settings.production\"},{\"name\":\"EMAIL_HOST_PASSWORD\",\"value\":\"soegumleqgdiulhd\"},{\"name\":\"EMAIL_HOST_USER\",\"value\":\"theadasapp@gmail.com\"},{\"name\":\"INFOBIP_API_BASE_URL\",\"value\":\"qy9yww.api.infobip.com\"},{\"name\":\"INFOBIP_API_KEY\",\"value\":\"9181acf2b077ecb94bb209b7f3570444-37c7737f-6fb7-44f7-80ba-0204aabd5dc8\"},{\"name\":\"POSTGRES_DB\",\"value\":\"ugdasdb\"},{\"name\":\"POSTGRES_HOST\",\"value\":\"ugdas-postgres-prod.c3km2yc8uf3h.af-south-1.rds.amazonaws.com\"},{\"name\":\"POSTGRES_PASSWORD\",\"value\":\"fmmj22PjbrZUx3zULqLqYyUqmxvZ432okeKqeS\"},{\"name\":\"POSTGRES_PORT\",\"value\":\"5432\"},{\"name\":\"POSTGRES_USER\",\"value\":\"ugdasdbuser\"},{\"name\":\"REDIS_URL\",\"value\":\"redis://redis:6379/0\"},{\"name\":\"REDIS_URL_PRIMARY\",\"value\":\"ugdas-backend-redis-cluster.6gtfpj.clustercfg.afs1.cache.amazonaws.com:6379/1\"},{\"name\":\"SENTRY_DSN\",\"value\":\"https://ca1ab0f9d18540f2baf56fbd472e576b@o4504847705178112.ingest.us.sentry.io/4504847709044736\"},{\"name\":\"SENTRY_TRACES_SAMPLE_RATE\",\"value\":\"5.0\"},{\"name\":\"WEB_CONCURRENCY\",\"value\":\"4\"}],\"essential\":true,\"image\":\"211125588594.dkr.ecr.af-south-1.amazonaws.com/ugdas_backend:0.0.25\",\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"ugdas_backend\",\"portMappings\":[{\"containerPort\":5000,\"hostPort\":80,\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"
#   family                = "awseb-UGDAS-Prod-env-nupqmgez3v"
# #   track_latest          = "false"
#
#   volume {
# #     configure_at_launch = "false"
#     host_path           = "/var/log/containers/ugdas_backend"
#     name                = "awseb-logs-ugdas_backend"
#   }
# }
