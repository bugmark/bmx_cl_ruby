require_relative '../bmcl_base/client'

class Graphql < ThorBase
  desc "schema", "show schema"
  def schema

    puts client.schema
  end

  desc "query GRAPHQL_QUERY", "post a GraphQL query"
  def query(expression)
    puts client.query(expression)
  end

  desc "mutation GRAPHQL_MUTATION", "post a GraphQL mutation"
  def mutation(expression)
    puts client.mutation(expression)
  end

  private

  def client
    @client ||= BmclBase::Client.new(config)
  end
end
