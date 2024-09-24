try:
    import boto3
    import sys
    import os
    import pandas as pd
    import matplotlib.pyplot as plt
    import datetime
    import asyncio
    import aiofiles
except Exception as importEx:
    print(f"Import Exception occures {importEx}")
today = datetime.datetime.now()


class BucketManagerWithClient(object):
    RESOURCE_DIR = "Resources/"
    DEF_BUCKET_NAME = f"grzegorzgolonka{today.day}.{today.month}.{today.year}"
    DEF_LOCATION = 'eu-north-1'

    def __init__(self, bucket_name=DEF_BUCKET_NAME):
        self._bucket_name = bucket_name
        self.client = boto3.client("s3")
        self.files = os.listdir(BucketManagerWithClient.RESOURCE_DIR)

    def get_all_buckets(self):
        buckets_list = self.client.list_buckets()
        for bucket in buckets_list['Buckets']:
            for key, value in bucket.items():
                print(key, value, sep=" | ")

        return buckets_list['Buckets']

    def get_all_bucket_items(self, bucket_name):
        all_items = self.client.list_objects(
            Bucket=bucket_name
        )
        return all_items

    def bucket_exists(self, bucket_name) -> bool:
        buckets = self.get_all_buckets()
        for bucket in buckets:
            if bucket['Name'] == bucket_name:
                return True
        return False

    @property
    def get_bucket_name(self):
        return self._bucket_name

    @get_bucket_name.setter
    def get_bucket_name(self, value):
        current_date = f"{today.day}.{today.month}.{today.year}"
        self._bucket_name = f"{value}{current_date}"

    def create_bucket(self, bucket_name):
        bucket_creation_response = self.client.create_bucket(
            ACL='private',
            Bucket=bucket_name,
            CreateBucketConfiguration={
                'LocationConstraint': BucketManagerWithClient.DEF_LOCATION
            }
        )
        return bucket_creation_response

    async def read_file(self, file_name):
        async with aiofiles.open(f"Resources/{file_name}", "rb") as file_to_upload:
            async for chunk in file_to_upload:
                yield chunk

    async def upload_data_to_bucket(self, bucket_name=None):
        bucket_name_dif = self.get_bucket_name if bucket_name is None else bucket_name
        for file in self.files:
            buffor = b''
            async for chunk in self.read_file(file):
                print(chunk)
                buffor += chunk

            response = await self.client.put_object(
                ACL='private',
                Body=buffor,
                Bucket=bucket_name_dif,
                Key=file,
            )
            print(response)

async def upload_async_data(manager):
    print("Uploading data")
    await manager.upload_data_to_bucket(manager.get_bucket_name)
    print("End of uploading data")

if __name__ == '__main__':
    manager = BucketManagerWithClient()
    all_buckets = manager.get_all_buckets()
    isExistingBucket = manager.bucket_exists(manager.get_bucket_name)
    print(isExistingBucket)
    # response = manager.create_bucket(f"testbucket{today.day}.{today.month}.{today.year}")
    asyncio.run(upload_async_data(manager))
