variable "iam_lambda"{
    default=""
}

variable "iam_role" {
  default=""
}
variable "service_name"{
    type=string
    default=" "
}
variable "policy_file"{
    default=""
}
variable "policy_value"{
    type=string
    default=""
}
variable "python_file"{
    default = ""
}

variable "python_file_zip"{
    default=""
}
variable "function_name_value"{
    default=""
    type=string
}
variable "handler_value"{
    default=""
}
variable "runtime_value"{
    default=""
}
variable "invoke_input"{
    default=""
}
variable "phone_number_description"{
    default=""
}
variable "instance_Arn"{
    default=""
}
variable "phone_number"{
    default=""
}