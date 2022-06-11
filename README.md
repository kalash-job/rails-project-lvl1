### Hexlet tests and linter status:

[![Actions Status](https://github.com/kalash-job/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/kalash-job/rails-project-lvl1/actions)

[![Actions Status](https://github.com/kalash-job/rails-project-lvl1/workflows/Ruby/badge.svg)](https://github.com/kalash-job/rails-project-lvl1/actions)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

How to create form with input type: text and with textarea. Default size is cols="20" and rows="40", default tag's id is its name. 
But you can override these attributes values, as in the example below:

    <%= HexletCode.form_for @user do |f| %>
      <%= f.input :name %>
      <%= f.input :job, as: :text, class: "form-control", id: "exampleFormControlTextarea1", rows: 80 %>
      <%= f.submit %>
    <%= end %>

As a result we have such html code:

    <form action="#" method="post">
      <label for="name">Name</label>
      <input name="name" id="name" type="text" value="rob">
      <label for="exampleFormControlTextarea1">Job</label>
      <textarea cols="20" rows="40" name="job" id="exampleFormControlTextarea1" class="form-control">hexlet</textarea>
      <input name="commit" type="submit" value="Save">
    </form>

How to create form with input type: text and two selects (the first one is with multiple select).
You can use array of arrays or array of strings for option's values and for option's bodies. 
But if you use array of strings, you will get options where every value is equal to every body as in the second select:

    <%= HexletCode.form_for @user, url: "/users" do |f| %>
      <%= f.input :name %>
      <%= f.input :hobby, as: :select, options: [["1", "First select"], ["2", "Second select"], ["3", "Third select"]], multiple: true %>
      <%= f.input :gender, as: :select, class: "form-control", options: %w[m f] %>
      <%= f.submit name: "sending", value: "Send" %>
    <%= end %>

As a result we have such html code with one input and two selects:

    <form action="/users" method="post">
      <label for="name">Name</label>
      <input name="name" id="name" type="text" value="rob">
      <label for="hobby">Hobby</label>
      <select name="hobby" id="hobby" multiple>
        <option value="1">First select</option>
        <option selected value="2">Second select</option>
        <option selected value="3">Third select</option>
      </select>
      <label for="gender">Gender</label>
      <select name="gender" id="gender" class="form-control">
        <option selected value="m">m</option>
        <option value="f">f</option>
      </select>
      <input name="sending" type="submit" value="Send">
    </form>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
