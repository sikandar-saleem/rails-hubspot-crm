# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'openssl'

# Network Helper to send http requests
module NetworkHelper
  BASE_URL = ENV['BASE_URL']

  def http_request(request_type:, endpoint:, **body)
    request_payload, http = initialize_request(request_type, endpoint)
    request_payload.body = body.to_json if body.present?

    response = http.request(request_payload)
    [JSON.parse(response.body), response.code]
  rescue StandardError => e
    handle_error_response(e, response)
  end

  private

  def handle_error_response(exception, response)
    if response.present?
      error_text = response.message
      status = response.code
    else
      error_text = "#{exception.class}: #{exception.message}"
      status = 500
    end

    { error: error_text, status: }
  end

  def initialize_request(type, endpoint)
    uri = URI.parse((BASE_URL + endpoint).to_s)
    request = create_request_uri(type, uri)

    request['content-type'] = 'application/json' if %w[POST PATCH].include?(type)
    request['accept'] = 'application/json'
    # request['Authorization'] = API_KEY
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    [request, http]
  end

  def create_request_uri(type, uri)
    case type
    when 'POST'
      Net::HTTP::Post.new(uri)
    when 'PUT'
      Net::HTTP::Put.new(uri)
    when 'PATCH'
      Net::HTTP::Patch.new(uri)
    when 'DELETE'
      Net::HTTP::Delete.new(uri)
    else
      Net::HTTP::Get.new(uri)
    end
  end
end
