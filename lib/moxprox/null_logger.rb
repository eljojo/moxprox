require 'logger'

module Moxprox
  class NullLoger < Logger
    def initialize(*args)
    end

    def add(*args, &block)
    end
  end
end
