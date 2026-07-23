from sentence_transformers import SentenceTransformer

embedder = SentenceTransformer("BAAI/bge-small-en-v1.5")

search_text = "network is down"
vec = embedder.encode(search_text)
print(str(vec))
