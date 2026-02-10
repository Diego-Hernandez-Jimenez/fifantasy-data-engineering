import requests
from zipfile import ZipFile
from io import BytesIO


SOURCE_URL = "https://www.kaggle.com/api/v1/datasets/download/rovnez/fc-26-fifa-26-player-data"
DEST_PATH = "data/fc_players_source.csv"

response = requests.get(SOURCE_URL)
assert response.status_code == 200

file_bytes = BytesIO(response.content)
with ZipFile(file_bytes) as zip_file:
    csv_name = zip_file.namelist()[0]
    update_date = csv_name.removesuffix(".csv").split("_")[1]
    csv_bytes = zip_file.read(csv_name)
    with open(DEST_PATH, "wb") as f:
        f.write(csv_bytes)