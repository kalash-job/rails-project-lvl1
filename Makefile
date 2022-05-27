install:
	bundle install

test:
	bundle exec rake test

.PHONY: test

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A
