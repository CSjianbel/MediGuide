import os
import dotenv

from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider

dotenv.load_dotenv()

cloud_config= {
  'secure_connect_bundle': 'secure-connect-mediguide.zip'
}

CLIENT_ID = os.getenv("CLIENT_ID")
CLIENT_SECRET = os.getenv("SECRET")

auth_provider = PlainTextAuthProvider(CLIENT_ID, CLIENT_SECRET)
cluster = Cluster(cloud=cloud_config, auth_provider=auth_provider)
session = cluster.connect()

row = session.execute("select release_version from system.local").one()
if row:
  print(row[0])
else:
  print("An error occurred.")