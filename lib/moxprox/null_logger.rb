require 'logger'

module Moxprox
  attr_reader :logger

  def initialize(opts = {})
    @ticket = Ticket.login(opts.fetch(:host), opts.fetch(:username), opts.fetch(:password))
    @logger = opts[:logger] || NullLoger.new
  end

  def node(name)
    Node.new(self, name)
  end

  def request(path, method = "get", query = {})
    Request.new(path, method, query).perform(@ticket)
  end
end
