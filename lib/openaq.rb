# frozen_string_literal: true

require "openaq/client"
require "openaq/version"

module Openaq
  class Error < StandardError; end

  class << self
    def client
      @client ||= Client.new
    end

    def url
      'https://api.openaq.org/v1'
    end
  end
end
