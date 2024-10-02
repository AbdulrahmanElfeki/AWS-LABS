#importing packages
import json
import urllib.parse
import boto3
#function definition
s3 = boto3.client('s3')

def lambda_handler(event,context):
    dynamodb = boto3.resource('dynamodb')
    #table name
    table = dynamodb.Table('s3-table')
    #inserting values into table
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    file = s3.get_object(Bucket=bucket, Key=key)
    response = table.put_item(
       Item={
            'id': key,
            
        }
    )
    return response