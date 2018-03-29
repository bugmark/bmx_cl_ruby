class Repo < ThorBase
  desc "list", "list all repos"
  option :cache_file  , desc: "local cache file"  , type: :string
  def list
    list = BmxApiRuby::ReposApi.new(client)
    cache_file = options["cache_file"] || "repos"
    output(list.get_repos.map {|repo| repo.to_hash}, cache_file)
  end

  desc "list_details", "list all repo details"
  option :cache_file  , desc: "local cache file"  , type: :string
  def list_details
    list = BmxApiRuby::ReposApi.new(client)
    cache_file = options["cache_file"] || "repos"
    output(list.get_repos.map {|repo| repo.to_hash}, cache_file)
  end

  desc "show REPO_UUID", "show repo details"
  option :issues , desc: "include issues", type: :boolean
  def show(repo_uuid)
    opts = {}
    opts[:issues] = options["issues"] unless options["issues"].nil?
    repo = BmxApiRuby::ReposApi.new(client)
    runput { repo.get_repos_uuid(cached_value(repo_uuid), opts) }
  end

  desc "create NAME", "create repo"
  option :type, desc: "repo type", type: :string, values: %w(GitHub Test), default: "Test"
  option :sync, desc: "sync repo on creation (GH only)", type: :boolean
  def create(repo_name)
    repo = BmxApiRuby::ReposApi.new(client)
    opts = {}
    opts[:sync] = "true" if options[:sync] == true
    output(run {repo.post_repos(options["type"], repo_name, opts)}.to_hash)
  end

  desc "sync REPO_UUID", "sync repo"
  def sync(_repo_uuid)
    under_construction
  end
end
