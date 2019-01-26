require "rubygems"
require "thor"

BMCL = true

require_relative "./base/version"
require_relative "./bmg_base/client"
require_relative "./thor_base"

require_relative "./bmg_cmd/config"
require_relative "./bmg_cmd/graphql"
require_relative "./bmg_cmd/user"
require_relative "./bmg_cmd/tracker"
require_relative "./bmg_cmd/issue"
require_relative "./bmg_cmd/offer"
require_relative "./bmg_cmd/contract"
require_relative "./bmg_cmd/escrow"
require_relative "./bmg_cmd/position"
require_relative "./bmg_cmd/event"
require_relative "./bmg_cmd/host"
require_relative "./bmg_cmd/cache"

class Bmg < Thor
  desc "config SUBCOMMAND", "set BMX host and user credentials"
  subcommand "config", Config

  desc "graphql SUBCOMMAND", "interact via GraphQL"
  subcommand "graphql", Graphql

  desc "host SUBCOMMAND", "display host info"
  subcommand "host", Host

  desc "user SUBCOMMAND", "manage user"
  subcommand "user", User

  desc "tracker SUBCOMMAND", "manage tracker"
  subcommand "tracker", Tracker

  desc "issue SUBCOMMAND", "manage issue"
  subcommand "issue", Issue

  desc "offer SUBCOMMAND", "manage offer"
  subcommand "offer", Offer

  desc "contract SUBCOMMAND", "manage contract"
  subcommand "contract", Contract

  desc "position SUBCOMMAND", "manage position"
  subcommand "position", Position

  desc "escrow SUBCOMMAND", "manage escrow"
  subcommand "escrow", Escrow

  desc "event SUBCOMMAND", "manage event"
  subcommand "event", Event

  desc "cache SUBCOMMAND", "manage local cache"
  subcommand "cache", Cache
end


