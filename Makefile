CSS_STYLE=contrib/index.css

files=$(shell find . -name '*.md' |grep -v index.md)

all: recipe.html recipe.pdf

recipe.html: $(files) index.md
	pandoc --toc -H contrib/index.css -S -f markdown -t html --standalone -o recipe.html index.md $(files)

recipe.pdf: $(files) index.md
	pandoc --toc --chapters -s -t context -o recipe.tex index.md $(files)
	context recipe.tex

all: recipe.html recipe.pdf
