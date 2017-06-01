# CloudConvertMergePDF

CloudConvertMergePDF is a ruby wrapper for the [Cloud Convert](https://cloudconvert.com/) merge pdf api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloud_convert_merge_pdf'
```

And then execute:

    $ bundle

## Basic Usage

Add the following to an initializer file.

```ruby
CloudConvertMergePdf.configure do |config|
  config.api_key  = "YOUR CLOUD CONVERT API KEY"
end
```
If you need a file object for the combined pdf:
```ruby
CloudConvertMergePdf::Merge.new(files).call
```
If you need the url for the combined pdf:
```ruby
CloudConvertMergePdf::Merge.new(files, false).call
```

## Basic Example

```ruby
files = ['http://www.example.com/1.pdf', 'http://www.example.com/2.pdf']
@client = CloudConvertMergePdf::Merge.new(files)
out_file = @client.call # This will return a Tempfile object for the combined pdf
out_file.unlink # Its a good apporach to unlink the tempfile than leaving it for the garbage collector
```

## Contributing

Please feel free to contribute to the repository.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).