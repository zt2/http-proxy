# HTTP::Proxy
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fzt2%2Fhttp-proxy.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fzt2%2Fhttp-proxy?ref=badge_shield)


HTTP::Proxy allows you sending HTTP request via proxy automatically. This library extends gem HTTP by patching HTTP::Chainable to make proxy http request possible.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http-proxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http-proxy

## Usage

First require library

```ruby
require 'http-proxy'
```

Then you can use `proxy` method in HTTP object, your request will be proxy automatically

```ruby
HTTP.proxy.get 'https://httpbin.org/ip'
# => {"origin"=>"36.83.40.184, 36.83.40.184"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zt2/http-proxy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
