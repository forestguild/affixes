build:
	rm -f ./*.gem
	gem build jekyll-wowaffixes.gemspec

push:
	gem push ./*.gem
