###################################################
# Author: bfayty Date: 04/05/2022
# Version : 1.0
#
# Description:
# 1 Network Load Balancer, 1 NLB Listener, 1 NLB Target Group, 1 AutoScalling Group,
# 1 AutoScalling Attachement, 1 Target Group Attachement and 1 Launch Template
###################################################
###Load Balancer###
resource "aws_lb" "load-balancer" {
  name                             = var.lb-name
  internal                         = true 
  load_balancer_type               = var.load-balancer-type
  subnets                          = [var.subnets[0], var.subnets[1]]
  enable_cross_zone_load_balancing = true

  tags = {
      project = var.project
      author  = var.author
  }
}

###Load Balancer Listener###
resource "aws_lb_listener" "lb_listener" {  
  load_balancer_arn = aws_lb.load-balancer.arn  
  port              = var.lb-port-listener
  protocol          = var.lb-protocol-listener
  
  default_action {    
    target_group_arn = aws_lb_target_group.target-group.arn
    type             = var.lb-listener-action-type
  }
}

###Load Balancer Target Group###
resource "aws_lb_target_group" "target-group" {
  name     = var.lb-tg-group
  port     = var.lb-port-target
  protocol = var.lb-protocol-target
  vpc_id   = var.vpc-id
}

###Attach the NLB to the ASG###
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.target-group.arn
}

###Attach the target group to the NLB###
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_lb.load-balancer.arn
  port             = var.port-tg
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
    //key_name               = var.key-name
    image_id               = var.image-id
    instance_type          = var.instance-type
    vpc_security_group_ids = [var.security-group]

    tags = {
        project = var.project
        author  = var.author
    }
}