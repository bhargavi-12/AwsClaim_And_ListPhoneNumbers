data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = [var.iam_service_name]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "iam_for_lambda" {
  name  = var.iam_role_lambda
  assume_role_policy = "${data.aws_iam_policy_document.policy.json}"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = var.policy_name
  role = "${aws_iam_role.iam_for_lambda.id}"
  policy = var.iam_policy
}
