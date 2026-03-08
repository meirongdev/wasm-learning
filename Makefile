.PHONY: all build test fmt lint clean help

# Default target
all: build

## build: Build the WebAssembly package using wasm-pack
build:
	@echo "Building WASM package..."
	wasm-pack build --target web

## test: Run Rust unit tests
test:
	@echo "Running tests..."
	cargo test

## fmt: Format the code using cargo fmt
fmt:
	@echo "Formatting code..."
	cargo fmt

## lint: Run clippy for linting
lint:
	@echo "Running clippy..."
	cargo clippy -- -D warnings

## clean: Remove build artifacts
clean:
	@echo "Cleaning up..."
	cargo clean
	rm -rf pkg/

## help: Show this help message
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
