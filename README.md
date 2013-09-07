# MindBody API

Provides a Ruby interface to the [MindBody API](http://www.mindbodyonline.com/api)

## Installation

Add this line to your application's Gemfile:

    gem 'mindbody-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mindbody-api

## Configuration

mindbody-api relies on Savon to communicate with MindBody's SOAP API. By default Savon logs your requests and responses. To control the logging level of Savon via mindbody-api set the log_level config value:

```
MindBody.configure do |config|
  config.log_level = :info # Default is :debug, options are [:debug, :info, :warn, :error, :fatal]
end
```

If you're using Rails you can put the above code in an initializer (Example: config/initializers/mindbody-api.rb)

See http://savonrb.com/version2/globals.html for more information.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/wingrunr21/mindbody-api/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

