# Openaq Ruby Client

This project contains the Ruby wrapper for the [Open AQ API](https://docs.openaq.org).

[![Build Status](https://travis-ci.org/gmichokostas/openaq-client.svg?branch=master)](https://travis-ci.org/gmichokostas/openaq-client)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openaq-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openaq-client

## Usage

```ruby
require 'openaq'

client = Openaq.client
begin
  client.cities # default params
rescue Openaq::Error => e
  puts e.message
end

cities = client.cities(page: 1, limit: 5)

all_cities = client.all_cities # returns an Enumerator
all_cities.detect{|item| item['city'] == 'Berlin'}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gmichokostas/openaq-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Openaq::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/openaq-client/blob/master/CODE_OF_CONDUCT.md).
