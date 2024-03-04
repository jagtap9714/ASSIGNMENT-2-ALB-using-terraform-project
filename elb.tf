# create a new load balancer
resource "aws_elb" "demo" {
  name               = "demo-elb"
  availability_zones = ["ap-south-1a" , "ap-south-1b"]

  listener {
  instance_port = 80
  instance_protocol = "http"
  lb_port = 80
  lb_protocol = "http"
  }
  health_check {

    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  //ELB attachments

  instances                 = ["${aws_instance.first.id}", "${aws_instance.second.id}" ]
  cross_zone_load_balancing = true
  idle_timeout              = 40
  tags = {
    name = "daemo-elb"
  }
}
