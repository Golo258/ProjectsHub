import datetime

try:
    import boto3
    import sys
    import os
    import pandas as pd
    import matplotlib.pyplot as plt
    import datetime
except Exception as importEx:
    print(f"Import Exception occures {importEx}")

'''
    Buckets in Amazon is 
    Amazon Simple Storage Service - S3 as shortcuit 

    Naming Bucket
    FirstName LastName Date
    Only Lower Case
    grzegorzgolonka12042024
'''

files_to_upload = os.listdir('Resources')
today = datetime.datetime.now()
current_date = f"{today.day}.{today.month}.{today.year}"
bucket_name = f"grzegorzgolonka{current_date}"

client = boto3.client("s3")


def create_bucket(bucket_name):
    response = client.create_bucket(
        ACL='private',
        Bucket=bucket_name,
        CreateBucketConfiguration={
            'LocationConstraint': 'eu-north-1'
        }
    )


def upload_data_to_bucket(bucket_name, files):
    file_bytes_datas = list()
    for file in files:
        with open(f"Resources/{file}", "rb") as file_to_upload:
            data = file_to_upload.read()
            file_bytes_datas.append(data)

    for item in range(len(files)):
        response = client.put_object(
            ACL='private',
            Body=file_bytes_datas[item],
            Bucket=bucket_name,
            Key=files[item],
        )
        print(response)


def delete_object_from_bucket(bucket_name, object_name):
    response = client.delete_object(
        Bucket=bucket_name,
        Key=object_name,
    )
    print(response)

def get_all_bucket_objects():
    response = client.list_objects(
        Bucket=bucket_name,
    )
    return  response['Contents']

if __name__ == '__main__':
    # create_bucket(bucket_name)
    # upload_data_to_bucket(bucket_name, files=files_to_upload)
    # delete_object_from_bucket(bucket_name, files_to_upload[0])
    objects_contents = get_all_bucket_objects()
    for content in objects_contents:
        for key, value in content.items():
            print(key, value, sep="|")



