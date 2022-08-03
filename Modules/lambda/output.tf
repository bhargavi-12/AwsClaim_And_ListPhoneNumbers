output "result_entry" {
  value = jsondecode(aws_lambda_invocation.example.result)
}
