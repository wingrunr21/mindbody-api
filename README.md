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

You must set your MindBody source name, key, and site ids. These values are accessible via the [MindBody Partner Page](https://api.mindbodyonline.com/Home/LogIn)

The easiest way to set these is via three environment variables: `MINDBODY_SOURCE_NAME`, `MINDBODY_SOURCE_KEY`, and `MINDBODY_SITE_IDS`. `MINDBODY_SITE_IDS` can have any delimiter.

Alternatively, you may set them in an initializer:

    MindBody.configure do |config|
      config.site_ids    = -99
      config.source_key  = 'abcd1234'
      config.source_name = 'SuperFoo'
      config.log_level = :info # Savon logging level. Default is :debug, options are [:debug, :info, :warn, :error, :fatal]
      config.filters = ['Password'] 
      # Enable as you see fit
      # See http://savonrb.com/version2/globals.html for more information settings.
      #config.read_timeout = 0
      #config.open_timeout] = 0
      #config.pretty_print_xml = true
      #config.log = true
    end


## Usage

`mindbody-api` is laid out into two distinct parts: [services](https://github.com/wingrunr21/mindbody-api/tree/master/lib/mindbody-api/services) and [models](https://github.com/wingrunr21/mindbody-api/tree/master/lib/mindbody-api/models)

### Services

The services are direct mirrors of those documented by MindBody in their [API
documentation](https://api.mindbodyonline.com/Doc). Required data arguments for
each service call are defined as arguments for the Ruby methods. Optional
arguments should be passed as a string based hash. For example:

    client_id = 1234
    response = MindBody::Services::ClientService.get_client_visits(client_id, 'StartDate' => Date.today, 'EndDate' => Date.today)
    result = response.result
    visits = result[:visits]

If any of the service calls need to be passed in a list of something (eg `Int32`
or `Int64`) then the option needs to be specified like this:

    MindBody::Services::StaffService.get_staff('StaffIDs' => {'long' => [123415123, 123123213]})

### Models

When a request comes back from MindBody, the various data types are hydrated
into models that are defined in the `MindBody::Models` namespace.

## Versioning

In theory the gem would track the version of the MindBody API. In practice their
version number does not increment in a way that would make sense for a rubygem.
So, the gem itself uses [semver](http://semver.org/) and makes available a
constant `API_VERSION` that stores the version of the MindBody API.

## Roadmap

See the various [issues](https://github.com/wingrunr21/mindbody-api/issues?state=open)

## Credits

This gem is written by [Stafford Brunk](https://github.com/wingrunr21)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/wingrunr21/mindbody-api/trend.png)](https://bitdeli.com/free "Bitdeli Badge") [![Build Status](https://travis-ci.org/wingrunr21/mindbody-api.png)](https://travis-ci.org/wingrunr21/mindbody-api)

