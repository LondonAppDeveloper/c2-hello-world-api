
resource "aws_ecs_task_definition" "hello_world_api" {
  family                = "${var.prefix}-hello-world-api"
  container_definitions = "${file("tasks/hello_world.json")}"
}

resource "aws_ecs_service" "hello_world" {
  name            = "${var.prefix}-hello-world-api"
  cluster         = "${aws_ecs_cluster.main.name}"
  task_definition = "${aws_ecs_task_definition.hello_world_api.arn}"
  desired_count   = 1
}
