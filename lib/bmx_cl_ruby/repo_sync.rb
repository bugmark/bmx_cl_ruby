require_relative './repo_fetch'

module BmxClRuby
  class RepoSync

    attr_reader :repo_name, :data_source, :repo_data, :client

    def initialize(repo_name, data_source, client)
      @repo_name = repo_name
      @data_source = data_source
      @client = client
    end

    def sync
      repo = find_repo(repo_name)
      list = fetch_issue_data(data_source)
      sync_issue_list(repo, list)
    end

    private

    def find_repo(repo_name)
      @repo_data ||= begin
        appr = BmxApiRuby::ReposApi.new(client)
        list = appr.get_repos.map {|repo| repo.to_hash}
        list.select {|el| el[:name] == repo_name}.first || raise("Repo Not Found")
      end
    end

    def fetch_issue_data(source)
      RepoFetch.new(source).fetch
    end

    def sync_issue_list(repo, issues)
      repo_uuid = repo[:uuid]
      issues.each do |issue|
        sync_issue(issue.merge({repo_uuid: repo_uuid}))
      end
    end

    def sync_issue(opts)
      issue = BmxApiRuby::IssuesApi.new(client)
      issue.post_issues_exid(opts["exid"], opts)
    end
  end
end