resource "aws_iam_instance_profile" "LT_Profile" {
    name = "LT_Profile"
    role = aws_iam_role.SSM.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.LT_Profile.name
}
