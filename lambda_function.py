import sys
from pip._internal import main

main(['install', '-I', '-q', 'boto3', '--target', '/tmp/', '--no-cache-dir', '--disable-pip-version-check'])
sys.path.insert(0,'/tmp/')

import json
import boto3
connect_client=boto3.client("connect")

def claim_phone_number(phone_number,Arn,phone_number_description):
    response = connect_client.claim_phone_number(
        TargetArn=Arn,
        PhoneNumber=phone_number,
        PhoneNumberDescription=phone_number_description,
    )
    return response['PhoneNumberId']

def lambda_handler(event,context):
    phone_number_Id=claim_phone_number(event['phone_number'],event['instance_Arn'],event['phone_number_description'])
    return phone_number_Id