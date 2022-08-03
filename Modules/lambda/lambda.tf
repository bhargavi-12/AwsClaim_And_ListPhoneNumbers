
data "archive_file" "zip" {
  type        = "zip"
  source_file = var.python_file
  output_path = var.python_file_zip
}
module "iam"{
    source = "../iam"
    iam_role_lambda=format("%s-role",var.function_name_value)

    iam_service_name=var.service_name
    iam_policy=var.policy_file
    policy_name=var.policy_value
}

resource "aws_lambda_function" "lambda" {
  role   = module.iam.iam_for_lambda
  function_name = var.function_name_value
  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"
  handler=var.handler_value
  runtime = var.runtime_value


  depends_on=[module.iam.iam_for_lambda]
}
resource "time_sleep" "wait_60_seconds" {
  depends_on = [aws_lambda_function.lambda]
  create_duration = "60s"
}

resource "aws_lambda_invocation" "example" {
  depends_on = [time_sleep.wait_60_seconds]
  function_name = var.function_name_value
  input = jsonencode({"phone_number_description":var.phone_number_description,
    "instance_Arn":var.instance_Arn,
    "phone_number":var.phone_number})

}

