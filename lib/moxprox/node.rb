module Moxprox
  class Node < Struct.new(:cluster, :name)
    def machine(id)
      Machine.new(self, id)
    end

    def request(path, method = "get", query = {})
      cluster.request("nodes/#{name}/#{path}", method, query)
    end

    def task_status(upid)
      res = request("tasks/#{upid}/status")
      status = (res["exitstatus"] || res["status"] || "error").downcase.to_sym
      logger.debug "status of task #{upid}: #{status}"
    end

    def wait_for_task(upid, &block)
      while (status = task_status(upid)) == :running
        sleep 1
      end
      yield status
    end

    private
    def logger
      cluster.send(:logger)
    end
  end
end
