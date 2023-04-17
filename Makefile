install:
	bundle install

test:
	bundle exec rake test
	bundle exec rake spec

rspec:
	rspec spec --format documentation

.PHONY: test

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A
