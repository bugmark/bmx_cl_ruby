class Position < ThorBase

  POSITION_FIELDS = "{id uuid}"

  desc "list", "list positions"
  def list
    expression = "{positions #{POSITION_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  desc "show ID", "show position information"
  def show(id)
    expression = "{position(id: #{id}) #{POSITION_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  # desc "show POSITION_UUID", "show position details"
  # def show(position_uuid)
  #   position = BmxApiRuby::PositionsApi.new(client)
  #   output position.get_positions_uuid(position_uuid).to_hash
  # end
end
