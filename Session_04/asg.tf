resource "aws_autoscaling_group" "webserver_asg" {
  name                 = "${var.env}-webserve-asg"
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids
  target_group_arns = [aws_lb_target_group.webserver_tg.arn]
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  force_delete         = true
  launch_configuration = aws_launch_configuration.webserver_lc.name
  health_check_type    = "EC2"
  tag {
    key                 = "Name"
    value               = "${var.env}-webserver"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_autoscaling_attachment" "webserver_tg_asg" {
  autoscaling_group_name = aws_autoscaling_group.webserver_asg.id
  alb_target_group_arn   = aws_lb_target_group.webserver_tg.arn
}