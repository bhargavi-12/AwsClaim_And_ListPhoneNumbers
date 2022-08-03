module "lambda"{
    source = "./Modules/lambda"
    for_each   = {
    for index, func in var.lambda_name:
    func.lambdaname => func
    }
    function_name_value=each.value.lambdaname
    policy_file = each.value.policy_var
    python_file= format("${path.root}/%s",each.value.file_path)
    python_file_zip= format("${path.root}/%s",each.value.zip_file_path)
    service_name=each.value.service_name_value
    policy_value=each.value.policy_P_name_value
    handler_value=each.value.handler_name
    runtime_value=each.value.runtime_name
    phone_number_description=var.phone_number_description
    instance_Arn=var.instance_Arn
    phone_number=var.phone_number

}