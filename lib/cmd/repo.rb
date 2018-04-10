require_relative '../bmx_cl_ruby/repo_fetch'
require_relative '../bmx_cl_ruby/repo_sync'

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
  def create(repo_name)
    repo = BmxApiRuby::ReposApi.new(client)
    opts = {}
    output(run {repo.post_repos(options["type"], repo_name, opts)}.to_hash)
  end

  desc "fetch", "fetch repo data from source"
  long_desc <<~EOF
  Fetch repo data from source.

  `source` specifies a connection string - one of:
    - `github:<user_name>/<repo_name>`
    - `yaml:<filepath>`
  EOF
  option :source, desc: "data source", type: :string, required: true
  def fetch
    iora = BmxClRuby::RepoFetch.new(options[:source])
    output iora.fetch
  end

  desc "sync NAME", "sync repo"
  long_desc <<~EOF
  Sync all repo issues.

  `name` must be the name of an existing Bugmark repo.

  `source` specifies a connection string - one of:
    - `github:<user_name>/<repo_name>`
    - `yaml:<filepath>`
  EOF
  option :source, desc: "data source", type: :string, required: true
  def sync(repo_name)
    iora = BmxClRuby::RepoSync.new(repo_name, options[:source], client)
    iora.sync
    puts "OK"
  end
end
