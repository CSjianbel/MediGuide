import os
import dotenv

from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
from langchain.memory import CassandraChatMessageHistory, ConversationBufferMemory

dotenv.load_dotenv()

def create_connection():
    cloud_config= {
    'secure_connect_bundle': 'secure-connect-mediguide.zip'
    }

    CLIENT_ID = os.getenv("CLIENT_ID")
    CLIENT_SECRET = os.getenv("CLIENT_SECRET")
    auth_provider = PlainTextAuthProvider(CLIENT_ID, CLIENT_SECRET)
    cluster = Cluster(cloud=cloud_config, auth_provider=auth_provider)
    session = cluster.connect()
    return session

def get_buffer(session):
    message_history = CassandraChatMessageHistory(
        session_id="anything",
        session=session,
        keyspace=os.getenv("ASTRA_DB_KEYSPACE"),
    )

    cass_buff_memory = ConversationBufferMemory(
        memory_key="chat_history",
        chat_memory=message_history
    )
    return cass_buff_memory

def reset_memory(session):
    message_history = CassandraChatMessageHistory(
        session_id="anything",
        session=session,
        keyspace=os.getenv("ASTRA_DB_KEYSPACE"),
    )

    message_history.clear()