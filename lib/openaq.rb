require "openaq/client"

module Openaq
  def self.client
    Openaq::Client.new
  end
end
