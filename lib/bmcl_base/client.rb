require 'graphlient'
require 'base64'

class BmclBase
  class Client

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def schema
      client.schema.to_json
    end

    def query(string)
      "QUERY UNDER CONSTRUCTION [#{string}]"
    end

    def mutation(string)
      "MUTATION UNDER CONSTRUCTION [#{string}]"
    end

    private

    def client
      user = "#{config["usermail"]}:#{config["password"]}"
      cyph = Base64.encode64(user).chomp
      url  = "#{config["scheme"]}://#{config["host"]}/graphql"
      opts = { headers: {"Authorization": "Basic #{cyph}"} }
      @cclient ||= Graphlient::Client.new(url, opts)
    end
  end
end
