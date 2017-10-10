# ElasticActivities

This gem is used to store your application logs in ElasticSearch
Before using this gem please make sure ElasticSearch is installed in your matchine. You can download it from "https://www.elastic.co/products/elasticsearch"
Requred rails version is 5.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elastic_activities'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install elastic_activities

## Usage

Execute following command to generate the initializers

    $ rails g elastic_index

You will be prompted to enter 'Enter elastic index name' & 'Enter elastic url'
The details which you will enter will be the locations wher your application logs will be stored.

Add following inside your ApplicationController

    before_action :add_logs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/elastic_activities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ElasticActivities project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/elastic_activities/blob/master/CODE_OF_CONDUCT.md).
