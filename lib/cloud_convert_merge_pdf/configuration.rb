#
# CloudConvertMergePdf
#
# @author sufinsha
#
module CloudConvertMergePdf
  # Configuration
  class Configuration
    attr_accessor :api_key
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end
end
