# OpenSearch + OpenSearch Dashboards (Docker Compose)

This project provides a simple Docker Compose setup for running [OpenSearch](https://opensearch.org/) and [OpenSearch Dashboards](https://opensearch.org/docs/latest/dashboards/) for personal use and team training.

## Features

- OpenSearch single-node cluster
- OpenSearch Dashboards (Kibana-like UI)
- Security disabled for easy access (no login required)
- Data persisted in a Docker volume

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Docker Compose](https://docs.docker.com/compose/)

## Usage

### Start the stack

```sh
docker compose up -d
```

### Access OpenSearch Dashboards

Open your browser and go to:  
[http://localhost:5601](http://localhost:5601)

### Stop the stack

```sh
docker compose down
```

To remove all data (reset everything):

```sh
docker compose down -v
```

## Configuration

- **OpenSearch** runs on port `9200`
- **Dashboards** runs on port `5601`
- Data is stored in a Docker volume (`opensearch-data`)
- Security is disabled for both OpenSearch and Dashboards

## Troubleshooting

- If you see `No custom admin password found`, make sure the `OPENSEARCH_INITIAL_ADMIN_PASSWORD` variable is set in `docker-compose.yml`.
- If you see `application not found` in Dashboards, wait a minute and refresh. Both services may need time to start.
- Check logs with:
  ```sh
  docker compose logs opensearch
  docker compose logs opensearch-dashboards
  ```

## License

This project is licensed under the [MIT License](LICENSE).

---