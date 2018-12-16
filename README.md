# Songbook

Songbook is an application I use to generate chord tablatures i.e. tabs that include only chords and lyrics.

Unlike traditional tabs, the tabs that the app generates have their chords placed to the right of the lyrics. This makes it easy to see the chord progressions of a song.

For samples of the YAML song templates and the tabs that were generated from them, please see https://github.com/gsmendoza/songs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'songbook'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install songbook

## Usage

* `songbook bob-marley-three-little-birds.yml bob-marley-three-little-birds.txt`
* `songbook . /tmp/songbook` - Generate tabs for all of the YAML files in the present directory and save them in `/tmp/songbook`. Creates `/tmp/songbook` if it does not exist.
* `songbook /home/bob-marley-three-little-birds.yml` - Same as `/home/songbook bob-marley-three-little-birds.yml /home/bob-marley-three-little-birds.txt`
* `songbook` - Same as `songbook . .`

**WARNING:** I haven't made any attempt to make a proper implementation of the app's CLI. If for some reason, you decide to become the _second_ user of this app, and the CLI annoys you, let me know :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/songbook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Songbook project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/songbook/blob/master/CODE_OF_CONDUCT.md).
