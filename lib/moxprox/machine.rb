module Moxprox
  class Machine < Struct.new(:node, :id)
    def start(&block)
      logger.info "starting machine #{id} on #{node.name}"
      upid = request("status/start", "post")
      if block_given?
        node.wait_for_task(upid, &block)
      end
    end

    def shutdown(&block)
      logger.info "shutting down machine #{id} on #{node.name}"
      upid = request("status/shutdown", "post")
      if block_given?
        node.wait_for_task(upid, &block)
      end
    end

    def config
      request("config")
    end

    def status
      res = request("status/current")
      logger.debug "status of machine #{id} on #{node.name}: #{res["status"]}"
      res["status"].to_sym
    end

    def request(path, method = "get", query = {})
      node.request("qemu/#{id}/#{path}", method, query)
    end

    private
    def logger
      node.send(:logger)
    end
  end
end
