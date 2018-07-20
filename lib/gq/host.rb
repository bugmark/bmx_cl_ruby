require_relative 'base'

module Gq
  class Host
    attr_reader :gclient

    def initialize(client)
      @gclient = Gq::Base.gclient(client)
    end

    def get_host_info
      qry = <<-GRAPHQL
        query {
          host {
            info {
              hostName
              hostTime
              hourOffset
            }
          }
        }
      GRAPHQL
      gclient.query(qry).to_h
    end

    def get_host_counts
      qry = <<-GRAPHQL
        query {
          host {
            count {
              users
              trackers
            }
          }
        }
      GRAPHQL
      gclient.query(qry).to_h
    end
  end
end
