//resource "aws_ecr_repository" "name" {
//  for_each             = toset(["next_test1", "next_test2", "nextjs_ghs"])
//  name                 = each.value
//  image_tag_mutability = var.image_tag_mutability
//
//  image_scanning_configuration {
//    scan_on_push = var.scan_images_on_push
//  }
//
//  tags = {
//    project = "nextjs-gha-ecs-01"
//    terraform = "true"
//    environment = "dev"
//  }
//}