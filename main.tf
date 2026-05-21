provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "app_cluster" {
  name = "flask-api-cluster"
}

resource "aws_ecs_task_definition" "app_task" {
  family                   = "flask-api-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name  = "flask-api"
    image = "registry.gitlab.com/seu-usuario/seu-repo:main"
    portMappings = [{
      containerPort = 5000
      hostPort      = 5000
    }]
  }])
}