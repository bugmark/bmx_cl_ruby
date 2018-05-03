require_relative '../bmx_cl_ruby/tracker_fetch'
require_relative '../bmx_cl_ruby/tracker_sync'

class Tracker < ThorBase
  desc "list", "list all trackers"
  option :cache_file  , desc: "local cache file"  , type: :string
  def list
    list = BmxApiRuby::TrackersApi.new(client)
    cache_file = options["cache_file"] || "trackers"
    output(list.get_trackers.map {|tracker| tracker.to_hash}, cache_file)
  end

  desc "list_details", "list all tracker details"
  option :cache_file  , desc: "local cache file"  , type: :string
  def list_details
    list = BmxApiRuby::TrackersApi.new(client)
    cache_file = options["cache_file"] || "trackers"
    output(list.get_trackers.map {|tracker| tracker.to_hash}, cache_file)
  end

  desc "show tracker_UUID", "show tracker details"
  option :issues , desc: "include issues", type: :boolean
  def show(tracker_uuid)
    opts = {}
    opts[:issues] = options["issues"] unless options["issues"].nil?
    tracker = BmxApiRuby::TrackersApi.new(client)
    runput { tracker.get_trackers_uuid(cached_value(tracker_uuid), opts) }
  end

  desc "create NAME", "create tracker"
  option :type, desc: "tracker type", type: :string, values: %w(GitHub Test), default: "Test"
  def create(tracker_name)
    tracker = BmxApiRuby::TrackersApi.new(client)
    opts = {}
    output(run {tracker.post_trackers(options["type"], tracker_name, opts)}.to_hash)
  end

  desc "fetch", "fetch tracker data from source"
  long_desc <<~EOF
  Fetch tracker data from source.

  `source` specifies a connection string - one of:
    - `github:<user_name>/<tracker_name>`
    - `yaml:<filepath>`
  EOF
  option :source, desc: "data source", type: :string, required: true
  def fetch
    iora = BmxClRuby::TrackerFetch.new(options[:source])
    output iora.fetch
  end

  desc "sync NAME", "sync tracker"
  long_desc <<~EOF
  Sync all tracker issues.

  `name` must be the name of an existing Bugmark tracker.

  `source` specifies a connection string - one of:
    - `github:<user_name>/<tracker_name>`
    - `yaml:<filepath>`
  EOF
  option :source, desc: "data source", type: :string, required: true
  def sync(tracker_name)
    iora = BmxClRuby::TrackerSync.new(tracker_name, options[:source], client)
    iora.sync
    puts "OK"
  end
end
