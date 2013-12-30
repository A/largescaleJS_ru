build:
	stylus -o assets/css/ ./_stylus/main.styl

serve:
	jekyll serve --watch --config _config-local.yml

.PHONY: build