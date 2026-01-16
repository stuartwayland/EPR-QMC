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

bethe: $(BUILD_DIR)/bethe/bethe.pdf

bg: $(BUILD_DIR)/bg/bg.pdf

matchgates: $(BUILD_DIR)/matchgates/matchgates.pdf

lit-vbt: $(BUILD_DIR)/lit-vbt/lit-vbt.pdf

# Explicit rules (more portable on older make versions)
$(BUILD_DIR)/main/main.pdf: main.tex
	@mkdir -p $(BUILD_DIR)/main
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/main -auxdir=$(BUILD_DIR)/main $<

$(BUILD_DIR)/algorithms/algorithms.pdf: algorithms.tex
	@mkdir -p $(BUILD_DIR)/algorithms
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/algorithms -auxdir=$(BUILD_DIR)/algorithms $<

$(BUILD_DIR)/bethe/bethe.pdf: bethe.tex
	@mkdir -p $(BUILD_DIR)/bethe
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/bethe -auxdir=$(BUILD_DIR)/bethe $<

$(BUILD_DIR)/bg/bg.pdf: bg.tex
	@mkdir -p $(BUILD_DIR)/bg
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/bg -auxdir=$(BUILD_DIR)/bg $<

$(BUILD_DIR)/matchgates/matchgates.pdf: matchgates.tex
	@mkdir -p $(BUILD_DIR)/matchgates
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/matchgates -auxdir=$(BUILD_DIR)/matchgates $<

$(BUILD_DIR)/lit-vbt/lit-vbt.pdf: lit-vbt.tex
	@mkdir -p $(BUILD_DIR)/lit-vbt
	$(LATEXMK) $(LATEXMKFLAGS) -outdir=$(BUILD_DIR)/lit-vbt -auxdir=$(BUILD_DIR)/lit-vbt $<


# Convenience: open the main PDF
view: main
	open $(BUILD_DIR)/main/main.pdf

# Clean everything (aux and build dir)
clean:
	$(LATEXMK) -C -r latexmkrc || true
	rm -rf $(BUILD_DIR)
