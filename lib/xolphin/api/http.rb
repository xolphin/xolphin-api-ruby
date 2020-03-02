require 'cgi'
require 'json'
require 'net/http'
require 'uri'

module Xolphin
  module Api
    class Http
      LIVE_URL = "https://api.xolphin.com/v1/".freeze
      TEST_URL = "https://test-api.xolphin.com/v1/".freeze

      def initialize(username, password, options = {})
        @username = username
        @password = password
        @test = options[:test]
      end

      def get(path, params = {})
        uri = URI.parse(File.join(api_url, path))
        uri.query = URI.encode_www_form(params) unless params.empty?

        request = Net::HTTP::Get.new(uri)
        request.basic_auth(@username, @password)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(request)
        end

        JSON.parse(response.body).merge("status_code" => response.code)
      end

      def post(path, params = {})
        uri = URI.parse(File.join(api_url, path))

        request = Net::HTTP::Post.new(uri)
        request.basic_auth(@username, @password)
        request.set_form_data(params)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(request)
        end

        JSON.parse(response.body).merge("status_code" => response.code)
      end

      def download(path, params = {})
        uri = URI.parse(File.join(api_url, path))
        uri.query = URI.encode_www_form(params) unless params.empty?

        request = Net::HTTP::Get.new(uri)
        request.basic_auth(@username, @password)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(request)
        end

        response.body
      end

      private

      def api_url
        @test ? TEST_URL : LIVE_URL
      end
    end
  end
end
