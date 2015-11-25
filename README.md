# Fog::Gridfs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-gridfs', github: 'dimianstudio/fog-gridfs'
```

And then execute:

    $ bundle

## Usage

Initialise a `Fog::Storage` object using local provider

```ruby
storage = Fog::Storage.new(urls: ['localhost:27017'], database: 'db', provider: 'Gridfs')
```

This can then be used like any other [Fog storage](http://fog.io/storage/).

```ruby
directory = storage.directories.create(key: '/')
directory.files.create(body: File.open('~/image.png'), key: 'image.png')
```

## Contributing

1. Fork it ( https://github.com/dimianstudio/fog-gridfs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request