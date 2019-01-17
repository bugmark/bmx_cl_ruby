require_relative './tracker_fetch'

module BmxClRuby
  class TrackerSync

    attr_reader :tracker_name, :data_source, :tracker_data, :client

    def initialize(tracker_name, data_source, client)
      @tracker_name = tracker_name
      @data_source = data_source
      @client = client
    end

    def sync
      tracker = find_tracker(tracker_name)
      list = fetch_issue_data(data_source)
      sync_issue_list(tracker, list)
    end

    private

    def find_tracker(tracker_name)
      @tracker_data ||= begin
        appr = BmxApiRuby::TrackersApi.new(client)
        list = appr.get_trackers.map {|tracker| tracker.to_hash}
        list.select {|el| el[:name] == tracker_name}.first || raise("Tracker Not Found")
      end
    end

    def fetch_issue_data(source)
      TrackerFetch.new(source).fetch
    end

    def sync_issue_list(tracker, issues)
      tracker_uuid = tracker[:uuid]
      issues.each do |issue|
        sync_issue(issue.merge({tracker_uuid: tracker_uuid}))
      end
    end

    def sync_issue(opts)
      issue = BmxApiRuby::IssuesApi.new(client)
      issue.post_issues_exid(opts["exid"], opts)
    end
  end
end
