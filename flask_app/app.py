#!/usr/bin/python3
from langchain.document_loaders import UnstructuredPDFLoader, OnlinePDFLoader, WebBaseLoader, YoutubeLoader, DirectoryLoader, TextLoader, PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.docstore.document import Document
from sklearn.metrics.pairwise import cosine_similarity
from langchain_pinecone import PineconeVectorStore
from langchain.embeddings import OpenAIEmbeddings
from langchain_community.embeddings import HuggingFaceEmbeddings
from pinecone import Pinecone
from openai import OpenAI
import numpy as np
import tiktoken
import os
from flask import Flask, make_response, request, jsonify


def perform_rag(complaint_query):
    pinecone_api_key = "113c8d7f-2468-49c6-ac16-a2fe3e6868e1"
    openrouter_api_key = "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"

    openrouter_client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=openrouter_api_key
    )

    hf_embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-Mpnet-base-v2")
    query_embedding = hf_embeddings.embed_query(complaint_query)

    pc = Pinecone(api_key=pinecone_api_key)
    index_name = "ruby"
    namespace = "rubyhack2"
    pinecone_index = pc.Index(index_name)

    top_matches = pinecone_index.query(
        vector=query_embedding,
        top_k=5,  # Number of top matches to retrieve
        include_metadata=True,
        namespace="rubyhack2"
    )

    contexts = [item['metadata']['text'] for item in top_matches['matches']]
    augmented_query = (
        "<CONTEXT>\n" +
        "\n\n-------\n\n".join(contexts[:10]) +  # Include up to 10 retrieved contexts
        "\n-------\n</CONTEXT>\n\n\n\nMY COMPLAINT QUERY:\n"
    )
    return augmented_query

app = Flask(__name__)

@app.route('/')
def home():
    return ("Welcome to our rag API")

@app.route('/rag', methods=['POST'], strict_slashes=False)
def rag_endoint():
    data = request.get_json()
    print(data)
    rag_response = perform_rag(data['complaint'])
    return make_response(jsonify(rag_response), 200)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)