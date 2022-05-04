###################################################
# Author: bfayty Date: 04/05/2022
# Version : 1.0
#
# Description:
# 1 Application Load Balancer, 1 ALB Listener, 1 ALB Target Group, 1 AutoScalling Group,
# 1 AutoScalling Attachment, 1 Target Group Attachment and 1 Launch Template
###################################################
###Load Balancer###
resource "aws_lb" "LoadBalancer" {
  name                             = var.alb-name
  internal                         = true 
  load_balancer_type               = var.load-balancer-type
  security_groups                  = [var.security-group]
  subnets                          = [var.subnets[0], var.subnets[1]]
  enable_cross_zone_load_balancing = true

  tags = {
      project = var.project
      author  = var.author
  }
}

###Load Balancer Listener###
resource "aws_lb_listener" "lb_listener" {  
  load_balancer_arn = aws_lb.LoadBalancer.arn  
  port              = var.lb-port-listener
  protocol          = var.lb-protocol-listener
  
  default_action {    
    target_group_arn = aws_lb_target_group.target-group.arn
    type             = var.lb-listener-action-type
  }
}

###Load Balancer Listener Rule###
resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = aws_lb_listener.lb_listener.arn
  action {
    type             = var.lb-listener-action-type
    target_group_arn = aws_lb_target_group.target-group.arn
  }
  condition {
      host_header {
        values = [var.condition-value]
      }
  }
}

###Load Balancer Target Group###
resource "aws_lb_target_group" "target-group" {
  name     = var.lb-tg-group
  port     = var.lb-port-target
  protocol = var.lb-protocol-target
  vpc_id   = var.vpc-id
}

###Attach the ALB to the ASG###
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.target-group.arn
}

###Autoscalling Group###
resource "aws_autoscaling_group" "asg" {
  name                = var.asg-name  
  vpc_zone_identifier = [var.subnets[0], var.subnets[1]]
  desired_capacity    = var.desired
  max_size            = var.max
  min_size            = var.min

  launch_template {
    id      = aws_launch_template.asg-lt.id
    version = "$Latest"
  }
}

###Define a template to launch in the ASG###
resource "aws_launch_template" "asg-lt" {
    name                   = var.instance-name
    key_name               = var.key-name
    image_id               = var.image-id
    instance_type          = var.instance-type
    vpc_security_group_ids = [var.security-group]

    tags = {
        project = var.project
        author  = var.author
    }
}