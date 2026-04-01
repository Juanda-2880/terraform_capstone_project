resource "aws_iam_instance_profile" "LT_Profile" {
    name = "LT_Profile"
    role = aws_iam_role.SSM.name
}
