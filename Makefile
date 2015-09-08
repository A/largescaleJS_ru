build:
	stylus -o assets/css/ ./_stylus/main.styl

serve:
	jekyll serve --watch --config _config-local.yml

books:
	cat ./_includes/translation/rus/[0-9]*.md | sed 's/<!-- //g' | sed 's/-->//g' > ./epub/_source.md
	pandoc ./epub/_source.md -o ./epub/largescale-js.epub --toc-depth=2 --epub-cover-image=./epub/cover.jpg --epub-chapter-level=2
	pandoc ./epub/_source.md -o ./epub/largescale-js.fb2 --toc-depth=2 --epub-cover-image=./epub/cover.jpg --epub-chapter-level=2
	kindleGen -c1 -locale ru  ./epub/largescale-js.epub -o largescale-js.mobi
	rm ./epub/_source.md

.PHONY: build
