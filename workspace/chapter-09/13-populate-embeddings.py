import mariadb
from sentence_transformers import SentenceTransformer

embedder = SentenceTransformer("BAAI/bge-small-en-v1.5")

conn = mariadb.connect(
    host="mariadb-server",
    database="todo",
    user="dev",
    password="DevPassword123!"
)

cur = conn.cursor()
rows = cur.execute("SELECT id, description FROM items")
rows = cur.fetchall()

for id, description in rows:
    vec = embedder.encode(description).tolist()
    cur.execute("""
        UPDATE items
        SET embedding = VEC_FromText(%s)
        WHERE id = %s
    """, (str(vec), id))

conn.commit()
