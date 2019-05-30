OUT_DIR := output
SRC_DIR := markdown
SRC_FILES := $(shell find ./markdown -type f | xargs -I '{}' basename {} .md)
OUTPUT_FILES := $(foreach file,$(SRC_FILES),$(OUT_DIR)/$(file).html)
THEME = beige 

all: $(OUTPUT_FILES)

$(OUT_DIR):
	@[ -d $(OUT_DIR) ] || mkdir $(OUT_DIR)

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md $(OUT_DIR)
	@echo "Generating output/$(*).html"
	pandoc \
		-t revealjs \
		-s \
		-o $(OUT_DIR)/$(*).html \
		$< \
		-V theme=$(THEME) \
		-V revealjs-url=https://revealjs.com

