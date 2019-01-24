class Event < ThorBase

  EVENT_FIELDS = "{id uuid}"

  desc "list", "list events"
  def list
    expression = "{events #{EVENT_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  desc "show ID", "show event information"
  def show(id)
    expression = "{event(id: #{id}) #{EVENT_FIELDS}}"
    puts graphql_client.query(expression).to_h
  end

  # desc "list", "list all events"
  # option :after , desc: "sequential ID", type: :numeric
  # option :limit , desc: "max results"  , type: :numeric
  # def list
  #   event = BmxApiRuby::EventsApi.new(client)
  #   opts  = {}
  #   opts[:after] = options[:after] if options[:after]
  #   opts[:limit] = options[:limit] if options[:limit]
  #   output(run { event.get_events(opts).map {|x| x.to_hash} })
  # end
  #
  # desc "update EVENT_ID ETHERSCAN_URL", "update etherscan url"
  # def update(id, etherscan_url)
  #   event = BmxApiRuby::EventsApi.new(client)
  #   runput { event.put_events(id, etherscan_url) }
  # end
end
