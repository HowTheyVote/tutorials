.PHONY: dev build

dev:
	uv run jupyter lite serve \
	    --contents content \
		--output-dir dist \
		--port 9000

build:
	./download_data.sh
	uv run jupyter lite build \
	    --contents content \
		--output-dir dist
