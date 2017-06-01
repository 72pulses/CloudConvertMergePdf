require 'minitest/autorun'
require_relative '../lib/cloud_convert_merge_pdf'

class TestMerge < Minitest::Test
  FILES = [
    'https://cloudconvert.com/assets/11e13801/testfiles/pdfexample1.pdf',
    'https://cloudconvert.com/assets/11e13801/testfiles/pdfexample2.pdf'
  ].freeze

  def test_nil_api_key
    assert_equal(
      CloudConvertMergePdf::Merge.new([]).call,
      'API Key cant be blank!'
    )
  end
end
