resource "aws_iam_role" "this" {
  count = var.create ? 1 : 0

  name               = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [var.assume_service]
        }
        Action = ["sts:AssumeRole"]
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "managed" {
  count      = var.create ? length(var.managed_policy_arns) : 0
  role       = aws_iam_role.this[0].name
  policy_arn = var.managed_policy_arns[count.index]
}
