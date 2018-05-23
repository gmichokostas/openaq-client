require "openaq/version"
require "openaq/client"

module Openaq
  class << self
    def client
      Openaq::Client.new
    end
  end
end
