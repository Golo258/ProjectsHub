try:
    import os
    import sys
    import datetime
    import boto3
    import json
    import asyncio
    import aiofiles
    import itertools
except Exception as importEx:
    print(f"Error: {importEx} occurs while importing")


class DynamoDatabaseManager(object):

    def __init__(self, table_name="Sensor", db_type="dynamodb"):
        self.table_name = table_name
        self.database = boto3.resource(db_type)
        self.table = self.database.Table(table_name)
        self.client = boto3.client(db_type)

    def get(self, item_key, item_value):
        response = self.table.get_item(
            Key={
                item_key: item_value
            }
        )
        return response['Item'].items()

    def put(self, item_body: dict):
        self.table.put_item(
            Item=item_body
        )

    def delete(self, item_key, item_value):
        self.table.delete_item(
            Key={
                item_key: item_value
            }
        )

    @property
    def describe_table(self):
        response = self.client.describe_table(
            TableName=self.table_name
        )
        return response


async def get_json_data(file_name):
    async with aiofiles.open(file_name, "r") as json_file:
        json_content = await json_file.read()
        return json.loads(json_content)


async def main():
    database = DynamoDatabaseManager()

    files = ['sensor_items', 'sensor_items2', 'sensor_items3']
    tasks = [
        get_json_data(f"Resources/{file}.json") for file in files
    ]
    json_contents = await asyncio.gather(*tasks)
    sensor_bodies = list()
    for content in json_contents:
        sensor_bodies.extend(content)

    for body in sensor_bodies:
        database.put(body)

    possible_ids = [body['sensor_id'] for body in sensor_bodies]
    first_item_items = list(sensor_bodies[possible_ids[0]].items())

    first_item = database.get(*first_item_items[0])
    print(first_item)
    print(
        database.describe_table
    )


if __name__ == '__main__':
    asyncio.run(main())
