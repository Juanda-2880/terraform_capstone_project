resource "aws_launch_template" "WebLT" {
    name = "WebLT"

    block_device_mappings {
      device_name = "/dev/sdf"

      ebs {
        volume_size = 8
      }
    }

    iam_instance_profile {
        name = var.instance_profile_name
    }
    image_id = data.aws_ami.my_ami.id
    instance_type = var.instance_type
    
    monitoring {
      enabled = true
    }

    vpc_security_group_ids = [var.web_sg_id]

    tag_specifications {
      resource_type = "instance"
      tags = {
        Name = "Web_App_Tier"
      }
    }

    user_data = filebase64("${path.module}/userdata.sh")
}

