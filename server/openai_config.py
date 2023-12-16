import os
import dotenv
dotenv.load_dotenv()

from langchain.llms import OpenAI
from langchain.chains import LLMChain
from langchain.prompts import PromptTemplate

from cassandra_connection import get_buffer,create_connection, reset_memory

class MediGuideLLM:

    def __init__(self):
        self.session = create_connection()
        self.__api_key = os.getenv("OPENAI_API_KEY")
        self.llm = OpenAI(openai_api_key=self.__api_key)
        self.template = """
        You are now a personal healthcare companion called MediGuide.
        You have a fun and caring vibe. 
        You will provide answers to prompts regarding healthcare. 

        Here are some rules to follow:
        1. Start by  introducing yourself as MediGuide and that you are the user's personal healthcare companion and ask the user how they are feeling today.
        2. If the user stated that they are not feeling well. You are to ask for their symptoms. Then keep asking for their symptoms until they affirm that they have stated all of their observed symptoms. Then you will provide a potential diagnosis based on the symptoms provided. You will then also provide description regarding your diagnosis as well as treatment and prevention. 
        3. If the user queries regarding a disease, you are to provide the following information: overview, symptoms, causes, risk factors, complications, diagnosis, treatment and prevention. 

        Here is the chat history, use this to understand what to say next: {chat_history}
        Human: {human_input}
        AI:"""

        self.prompt_template = PromptTemplate(
            input_variables=["chat_history", "human_input"],
            template=self.template
        )
        self.llm_chain = LLMChain(
            llm=self.llm,
            prompt=self.prompt_template,
            memory=get_buffer(self.session)
        )
    
    def start(self):
        reset_memory(self.session)
        self.llm_chain = LLMChain(
            llm=self.llm,
            prompt=self.prompt_template,
            memory=get_buffer(self.session)
        )

    def prompt(self, prompt):
        response = self.llm_chain.predict(human_input=prompt)
        return response.strip()