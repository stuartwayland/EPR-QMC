## Makefile for compiling LaTeX documents with latexmk

LATEXMK := latexmk
LATEXMKFLAGS := -r latexmkrc -pdf -bibtex
BUILD_DIR := build

.PHONY: all main view clean

# Default: build the main document
all: main

# Per-document targets
main: $(BUILD_DIR)/main/main.pdf

algorithms: $(BUILD_DIR)/algorithms/algorithms.pdf

# Explicit rules (more portable on older make versions)
$(BUILD_DIR)/main/main.pdf: main.tex
	@mkdir -p $(BUILD_DIR)/main
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/main -auxdir=$(BUILD_DIR)/main $<

$(BUILD_DIR)/algorithms/algorithms.pdf: algorithms.tex
	@mkdir -p $(BUILD_DIR)/algorithms
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/algorithms -auxdir=$(BUILD_DIR)/algorithms $<

# Convenience: open the main PDF
view: main
	open $(BUILD_DIR)/main/main.pdf

# Clean everything (aux and build dir)
clean:
	$(LATEXMK) -C -r latexmkrc || true
	rm -rf $(BUILD_DIR)
