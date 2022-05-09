install:
	bundle install

test:
	rake test

.PHONY: test

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A
