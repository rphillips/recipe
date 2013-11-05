OUTPUT_FILE=recipe.html

files=$(shell find . -name '*.md' |grep -v index.md)

options=-S
options=--toc
options+=-c contrib/index.css
options+=index.md
options+=-o ${OUTPUT_FILE}

all:
	pandoc ${options} ${files}
