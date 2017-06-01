require 'cloud_convert_merge_pdf/version'
require 'cloud_convert_merge_pdf/configuration'
require 'cloud_convert_merge_pdf/merge'

require 'faraday'
require 'json'

#
# CloudConvertMergePdf
#
# @author sufinsha
#
module CloudConvertMergePdf
  CLOUD_CONVERT_ENDPOINT = 'https://api.cloudconvert.org/'.freeze

  API_KEY_ERROR = 'API Key cant be blank!'.freeze

  CloudConvertMergePdf.configure
end
