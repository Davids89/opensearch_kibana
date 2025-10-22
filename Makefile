OPENSEARCH_URL ?= http://localhost:9200
INDEX_NAME ?= movies
DATA_FILE ?= movies.json

up:
	docker compose up

upd:
	docker compose up -d

down:
	docker compose down

down-v:
	docker compose down -v

build:
	docker compose --profile opensearch build

logs:
	docker compose logs -f

opensearch-dashboard:
	@open http://localhost:5601

index:
	@echo "📥 Indexando datos desde $(DATA_FILE) en $(INDEX_NAME)..."
	curl -s -X POST "$(OPENSEARCH_URL)/_bulk" \
		-H "Content-Type: application/json" \
		--data-binary "@$(DATA_FILE)" | jq .

delete-index:
	@echo "🗑️  Borrando índice $(INDEX_NAME)..."
	curl -s -X DELETE "$(OPENSEARCH_URL)/$(INDEX_NAME)" | jq .

reindex: delete-index index
	@echo "✅ Índice recreado correctamente."