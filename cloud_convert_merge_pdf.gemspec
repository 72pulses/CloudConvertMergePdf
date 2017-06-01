# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_convert_merge_pdf/version'

Gem::Specification.new do |s|
  s.name          = 'cloud_convert_merge_pdf'
  s.version       = CloudConvertMergePdf::VERSION
  s.date          = '2017-06-01'
  s.summary       = 'Ruby Wrapper for CloudConvert Merge PDF API'
  s.description   = 'Ruby Wrapper for CloudConvert Merge PDF API'
  s.authors       = ['Sufinsha']
  s.email         = 'sufinsha@gmail.com'
  s.files         = ['lib/cloud_convert_merge_pdf.rb']
  s.homepage      = 'http://rubygems.org/gems/cloud_convert_merge_pdf'
  s.license       = 'MIT'

  s.files         = Dir['{lib}/**/*', 'README.md']
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.3'

  s.add_dependency 'faraday'
  s.add_dependency 'json'
end
