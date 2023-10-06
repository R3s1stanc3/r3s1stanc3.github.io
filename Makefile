.PHONY: default
default: node_modules
	zola build
	./node_modules/purgecss/bin/purgecss.js --css public/style.css --content public/*.html public/**/*.html --output public/style.css

node_modules: package-lock.json
	npm install

.PHONY: default
clean:
	rm -rf node_modules public
