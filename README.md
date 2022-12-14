# Valimeter
A Ruby-on-Rails plugin for validating ActionController parameter values. (WIP)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'valimeter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install valimeter

## Usage

Create a folder called `app/valimeters` inside your project root directory.

```ruby
# app/valimeters/product_valimator.rb
class ProductValimator < Valimeter::Base
  valimates :sku, presence: true
  valimates :name, datatype: String
  valimates :status, value_in: ['active', 'inactive']
end
```

and you can use it in your controller:

```ruby
# app/controllers/api/v1/products_controller.rb
class Api::V1::ProductsController < ApiController
  before_action :validate_params

  def create
    ...
  end

  private

  def product_params
    params.require(:product).permit(:sku, :status, :name)
  end

  def validate_params
    validator = ProductValimator.new(product_params)

    return if validator.call

    render json: {
      errors: validator.errors
    }, status: :unprocessable_entity
  end
end
```

## TODOs
- [ ] Add controller helper/s
- [ ] Add new validators
- [ ] ...and more

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/valimeter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/valimeter/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Valimeter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/valimeter/blob/master/CODE_OF_CONDUCT.md).
