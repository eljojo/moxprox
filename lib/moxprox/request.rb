module Moxprox
  class Request
    def initialize(path, method = "post", query = {})
      @path = path
      @query = query
      @method = method
    end

    def perform(ticket)
      result = ticket.connection.request(path: "/api2/json/#{@path}", method: @method, query: @query, headers: ticket.headers)
      data = JSON.parse(result.body)
      data["data"]
    end
  end
end
