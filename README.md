# Quantitare::Categories

Quantitare is a self-hosted personal dashboard application that gathers data from several external services. It is designed to be expandable, customizable, and hackable.

The basic unit of measurement for a point of data ingested by Quantitare is known as a "scrobble." Scrobbles are represented in the application as `ActiveRecord` objects, and they are all stored in the `scrobbles` table. Scrobbles are organized into categories, each of which determines the shape of their respective records in the database. Specifically, the `data` column in this table is a JSONB column that contains category-specific information to be used by the analytics engine or presentation engine in the app. In order for this data to be consistent from source to source, this gem provides validations for each of the categories in the core build of Quantitare.

The data column is validated using [JSON schema](http://json-schema.org).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quantitare-categories'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quantitare-categories

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/quantitare-categories. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Quantitare::Categories project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/quantitare/quantitare-categories/blob/master/CODE_OF_CONDUCT.md).
