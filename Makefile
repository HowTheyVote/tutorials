.PHONY: dev build data

DATA_URL := http://github.com/HowTheyVote/data/releases/latest/download/export.zip
DATA_DIR := ./content/data/
DATA_ARCHIVE := /tmp/howtheyvote-export.zip

dev:
	uv run jupyter lite serve \
	    --contents content \
		--output-dir dist \
		--port 9000

build: data
	uv run jupyter lite build \
	    --contents content \
		--output-dir dist

data:
	mkdir -p $(DATA_DIR)
	curl -L -o $(DATA_ARCHIVE) $(DATA_URL)
	unzip -o $(DATA_ARCHIVE) '*.csv' -d $(DATA_DIR)
	rm -f $(DATA_ARCHIVE)
