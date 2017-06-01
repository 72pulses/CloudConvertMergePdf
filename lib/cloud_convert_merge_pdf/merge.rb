require 'tempfile'
require 'securerandom'

module CloudConvertMergePdf
  #
  # CloudConvertMergePdf::Merge
  #
  # @author sufinsha
  #
  class Merge
    attr_reader :download_url

    def initialize(files, download = true)
      @connection = Faraday.new(
        url: CloudConvertMergePdf::CLOUD_CONVERT_ENDPOINT
      )
      @files = files
      @can_download = download
    end

    def call
      api_key = CloudConvertMergePdf.configuration.api_key
      return CloudConvertMergePdf::API_KEY_ERROR if api_key.nil?

      fetch_process_url
      process

      download
    end

    def fetch_process_url
      response = @connection.post '/process', process_url_params

      parsed_response = parse_response(response.body)

      @process_url = parsed_response['url']
    end

    def process
      response = @connection.post @process_url, process_params
      parsed_response = parse_response(response.body)

      return nil if parsed_response['output'].nil?

      @download_url = parsed_response['output']['url']
    end

    def download
      response = @connection.get @download_url

      return parse_response(response.body) if response.status != 200

      return clean_url(@download_url) unless @can_download

      combined_pdf(response.body)
    end

    private

    def process_url_params
      {
        'apikey' => CloudConvertMergePdf.configuration.api_key,
        'mode' => 'combine',
        'inputformat' => 'pdf',
        'outputformat' => 'pdf'
      }
    end

    def process_params
      {
        'mode' => 'combine',
        'input' => 'download',
        'files' => @files,
        'outputformat' => 'pdf',
        'wait' => true
      }
    end

    def parse_response(response)
      JSON.parse(response)
    end

    def combined_pdf(file_body)
      file = Tempfile.new("#{SecureRandom.uuid}.pdf")
      file.puts file_body
      file.close

      file
    end

    def clean_url(url)
      return '' if url.nil? || url.empty?

      url.gsub(%r{^\/\/}, '')
    end
  end
end
