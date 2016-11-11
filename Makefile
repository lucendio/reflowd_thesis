CWD = $(CURDIR)
PANDOC_DATA_DIR = $(CWD)/.pandoc
ASSETS_DIR = $(CWD)/assets
TEMPLATES_DIR = $(ASSETS_DIR)/templates
STYLES_DIR = $(ASSETS_DIR)/styles
CONTENTS_DIR = $(CWD)/chapters
OUTPUT_DIR=$(CWD)/dist

ifeq ($(OS),Windows_NT)
	env=win
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		env=linux
	endif
	ifeq ($(UNAME_S),Darwin)
		env=macos
	endif

	# TODO add detection for BSD
endif
ifdef os
	env=$(os)
endif

define EXTENSIONS
+escaped_line_breaks\
-blank_before_header\
+header_attributes\
+auto_identifiers\
+ascii_identifiers\
-implicit_header_references\
+blank_before_blockquote\
-fenced_code_blocks\
+backtick_code_blocks\
+fenced_code_attributes\
+inline_code_attributes\
+link_attributes\
+fancy_lists\
+startnum\
+definition_lists\
-compact_definition_lists\
+example_lists\
+table_captions\
+simple_tables\
+multiline_tables\
+grid_tables\
+pipe_tables\
+all_symbols_escapable\
+intraword_underscores\
+strikeout\
+tex_math_dollars\
+raw_html\
+markdown_in_html_blocks\
+raw_tex\
-shortcut_reference_links\
+implicit_figures\
+footnotes\
+inline_notes\
+citations\
+yaml_metadata_block\
\
+lists_without_preceding_blankline\
-hard_line_breaks\
-ignore_line_breaks\
-emoji\
-tex_math_single_backslash\
+tex_math_double_backslash\
-markdown_attribute\
-mmd_title_block\
-abbreviations\
-autolink_bare_uris\
-mmd_header_identifiers\
-compact_definition_lists
endef

# removing whitespaces,because of POSIX standard
# src: https://stackoverflow.com/questions/21246165/how-to-break-a-string-across-lines-in-a-makefile-without-spaces
empty :=
space := $(empty) $(empty)
MARKDOWN_EXTENSIONS=$(subst $(space),$(empty),$(EXTENSIONS))



help:
	@echo ''
	@echo 'Makefile for generating with pandoc'
	@echo ''
	@echo 'Usage:'
	@echo '   make install					install dependencies'
	@echo '   make html					generate a web version'
	@echo '   make pdf					generate a PDF file'


install:
ifeq ($(env),none)
	@echo 'operating system not supported'
else ifeq ($(env),macos)

	# src http://pandoc.org/installing.html
	brew install pandoc
	brew install pandoc-crossref pandoc-citeproc
	brew cask install basictex

	tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
	tlmgr update --self
	tlmgr update --all
	# required fonts
	tlmgr install collection-fontsrecommended csquotes biblatex biber
	# additional packages
	tlmgr install truncate tocloft morefloats sectsty siunitx threeparttable

else ifeq ($(env),win)
	@echo 'operating system not supported'
else ifeq ($(env),linux)
	@echo 'operating system not supported'
else ifeq ($(env),bsd)
	@echo 'operating system not supported'
else
	@echo 'unknown operating system'
endif


pdf:
	@pandoc \
	--standalone \
	--smart \
	\
	--from=markdown$(MARKDOWN_EXTENSIONS) \
	--default-image-extension=png \
	\
	--filter=pandoc-citeproc \
	\
	--template="$(TEMPLATES_DIR)/tompollard.latex" \
	\
	--output="$(OUTPUT_DIR)/index.pdf" \
	--dpi=96 \
	--top-level-division=chapter \
	--toc \
	--number-sections \
	--number-offset=1,1,1 \
	\
	--highlight-style=pygments \
	\
	--latex-engine=xelatex \
	--latex-engine-opt= \
	\
	--data-dir="$(PANDOC_DATA_DIR)" \
	\
	--include-in-header=$(STYLES_DIR)/tompollard.latex-header.tex \
	\
	"$(CWD)/metadata.yml" \
	"$(STYLES_DIR)/tompollard.variables.yml" \
	"$(CONTENTS_DIR)/"*.md



html:
	@pandoc \
	--standalone \
	--smart \
	\
	--from=markdown$(MARKDOWN_EXTENSIONS) \
	--default-image-extension=png \
	\
	--filter=pandoc-citeproc \
	\
	--template="$(TEMPLATES_DIR)/tompollard.html5" \
	\
	--css="./assets/styles/tompollard.css" \
	--section-divs \
	--jsmath \
	\
	--to=html5 \
	--output="$(OUTPUT_DIR)/index.html" \
	--top-level-division=chapter \
	--toc \
	--number-sections \
	--number-offset=1,1,1 \
	\
	--highlight-style=pygments \
	\
	--data-dir="$(PANDOC_DATA_DIR)" \
	\
	\
	"$(CWD)/metadata.yml" \
	"$(STYLES_DIR)/tompollard.variables.yml" \
	"$(CONTENTS_DIR)/"*.md

	@rm -rf $(OUTPUT_DIR)/assets/*
	@mkdir -p $(OUTPUT_DIR)/assets/styles
	@cp $(STYLES_DIR)/*.css $(OUTPUT_DIR)/assets/styles/
	@cp -r $(ASSETS_DIR)/figures $(OUTPUT_DIR)/assets/figures



.PHONY: install help pdf html



# --------------------------------------------------------------------------------------------------
# Additional pandoc options:

#   --verbose   # for now pdf only

#   --data-dir=./.pandoc
# http://pandoc.org/MANUAL.html#templates
#   --template=FILE
#   --variables
#   --metadata

#   --normalize (remove repeated spaces, merge adjacent `Str` or `Emph`)
#   --preserve-tabs
#   --tab-stop=4

#   --table-of-contents
#   --toc-depth=3

#   --highlight-style=pygments

#   --include-in-header=FILE
#   --include-before-body=FILE
#   --include-after-body=FILE
#   --css=URL

#   --html-q-tags

#   --number-sections

#   --listings ???

#   --email-obfuscation=none|javascript|references

# http://pandoc.org/MANUAL.html#variables-for-latex
# http://pandoc.org/MANUAL.html#citations
