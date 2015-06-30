# Moxprox

A very simple Ruby client to [Proxmox](https://www.proxmox.com/en/)'s api.

This gem is under active development. Suggestions [are always welcome](https://github.com/eljojo/moxprox/issues/new).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moxprox'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'logger'
require 'moxprox'

cluster = Moxprox.new(
  host: 'my-proxmox-cluster.com',
  username: 'login@pve', # can also be 'root@pam'
  password: 'peanut_butter_and_j3lly',
  logger: Logger.new(STDOUT)
)
node = proxmox.node("homer")
machine = node.machine(101)
machine.status # :stopped
machine.start
machine.status # :running
sleep 10
machine.shutdown
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eljojo/moxprox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

