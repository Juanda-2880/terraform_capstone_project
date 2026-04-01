resource "aws_iam_role" "SSM" {
    name = "SSM"
    assume_role_policy = data.aws_iam_policy_document.SSM_Assume_Role_Policy.json
}

data "aws_iam_policy_document" "SSM_Assume_Role_Policy" {
    statement {
        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
        actions = ["sts:AssumeRole"]
    }
}

