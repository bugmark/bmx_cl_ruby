require 'graphlient'
require 'base64'

module Gq
  module Base
    def self.gclient(client)
      pair = "#{client.config.username}:#{client.config.password}"
      hdr  = {"Authorization" => "Basic #{Base64.encode64(pair)}"}
      url  = "http://#{client.config.host}/graphql"
      Graphlient::Client.new(url, headers: hdr)
    end
  end
end

