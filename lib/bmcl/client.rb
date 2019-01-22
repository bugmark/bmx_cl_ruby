require 'graphql/client'
require 'graphql/client/http'

class Bmcl::Client

  def initialize(config)
    @config = config
  end

  def http
    #Configure GraphQL endpoint using the basic HTTP network adapter.
    @http_val ||= GraphQL::Client::HTTP.new("https://example.com/graphql") do
      def headers(context)
        # Optionally set any HTTP headers
        { "User-Agent": "My Client" }
      end
    end
  end

  def schema
    # Fetch latest schema on init, this will make a network request
    @schema_val ||= GraphQL::Client.load_schema(HTTP)

    # However, it's smart to dump this to a JSON file and load from disk
    #
    # Run it from a script or rake task
    #   GraphQL::Client.dump_schema(SWAPI::HTTP, "path/to/schema.json")
    #
    # Schema = GraphQL::Client.load_schema("path/to/schema.json")
  end

  def client
    @client_val = GraphQL::Client.new(schema: Schema, execute: HTTP)
  end
end
