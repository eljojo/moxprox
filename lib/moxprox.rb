require "json"
require "logger"
require "excon"
require "moxprox/version"
require "moxprox/machine"
require "moxprox/node"
require "moxprox/request"
require "moxprox/ticket"
require "moxprox/null_logger"
require "moxprox/cluster"

module Moxprox
  def self.new(*params)
    Cluster.new(*params)
  end
end
