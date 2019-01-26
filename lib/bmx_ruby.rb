require "rubygems"
require "thor"

require_relative "./base/version"
require_relative "./thor_base"

require_relative "./cmd/config"
require_relative "./cmd/user"
require_relative "./cmd/tracker"
require_relative "./cmd/issue"
require_relative "./cmd/offer"
require_relative "./cmd/contract"
require_relative "./cmd/escrow"
require_relative "./cmd/position"
require_relative "./cmd/event"
require_relative "./cmd/host"
require_relative "./cmd/cache"

class BmxRuby < Thor
  desc "config SUBCOMMAND", "set BMX host and user credentials"
  subcommand "config", Config

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


