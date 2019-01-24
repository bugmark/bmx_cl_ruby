class Escrow < ThorBase

  ESCROW_FIELDS = "{id uuid email balance}"

  desc "list", "list escrows"
  def list
    expression = "{escrows #{ESCROW_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  desc "show ID", "show escrow information"
  def show(id)
    expression = "{escrow(id: #{id}) #{ESCROW_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  # desc "show ESCROW_UUID", "show escrow details"
  # def show(escrow_uuid)
  #   escrow = BmxApiRuby::EscrowsApi.new(client)
  #   output escrow.get_escrows_uuid(escrow_uuid).to_hash
  # end
end
