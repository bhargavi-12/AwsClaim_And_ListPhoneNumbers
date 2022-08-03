lambda_name=[
  {"lambdaname":"Connect_claim_number",
  "file_path":"lambda_function.py",
  "zip_file_path":"lambda_function.zip",
  "service_name_value":"lambda.amazonaws.com",
  "policy_P_name_value":"lambda_policy",
  "handler_name":"lambda_function.lambda_handler",
  "runtime_name":"python3.9",
  policy_var=<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:*",
        "cloudwatch:*",
        "ec2:Describe*",
        "connect:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
]
