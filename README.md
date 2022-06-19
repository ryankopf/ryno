# Antispam
The antispam gem helps create pages on your Rails site.

## Usage

The gem is used by adding this to your ApplicationController.rb

You need to add this to your routes.rb
```
  mount Ryno::Engine => "/ryno"
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ryno'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ryno
$ rails ryno:install:migrations
$ rails db:migrate SCOPE=ryno
```
The gem depends on image_processing, which depends on vips. We are using vips to
help upload images in the CMS.
```
sudo apt install libvips-tools
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ryankopf/ryno. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ryankopf/ryno/blob/master/CODE_OF_CONDUCT.md).

## License
The gem is available as you need it.

## Code of Conduct

Everyone interacting in the Antispam project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ryankopf/antispam/blob/master/CODE_OF_CONDUCT.md).

## NO WARRANTY

THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY KIND,
EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT LIMITED TO,
ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO SPECIFICATIONS,
ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL BE
ERROR FREE, OR ANY WARRANTY THAT DOCUMENTATION, IF PROVIDED, WILL CONFORM TO
THE SUBJECT SOFTWARE. THIS SOFTWARE IS PROVIDED "AS IS." IF YOUR JURISDICTION
DOES NOT ALLOW THESE LIMITATIONS THEN YOU MAY NOT USE THE SOFTWARE.
