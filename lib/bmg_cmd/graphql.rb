class Graphql < ThorBase
  desc "schema", "show schema"
  def schema
    puts graphql_client.schema.to_json
  end

  desc "query GRAPHQL_QUERY", "post a GraphQL query"
  def query(expression)
    puts graphql_client.query(expression).to_h
  end

  desc "mutation GRAPHQL_MUTATION", "post a GraphQL mutation"
  def mutation(expression)
    puts graphql_client.mutation(expression).to_h
  end
end
