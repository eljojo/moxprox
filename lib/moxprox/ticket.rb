module Moxprox
  class Ticket < Struct.new(:connection, :ticket, :csrf)
    def self.login(host, username, password)
      connection = Excon.new("https://#{host}:8006")
      res = connection.post(path: "/api2/json/access/ticket", query: { username: username, password: password })
      data = JSON.parse(res.body)
      self.new(connection, data["data"]["ticket"], data["data"]["CSRFPreventionToken"])
    end

    def headers
      { 'Cookie' => "PVEAuthCookie=#{ticket}", "CSRFPreventionToken" => csrf }
    end
  end
end
