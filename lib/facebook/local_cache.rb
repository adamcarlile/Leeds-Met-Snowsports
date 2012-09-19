module Facebook
  class LocalCache

    def initialize
      @cache = {}
    end

    attr_reader :cache

    #def get(object, graph = nil)
    #  if out = @cache[object]
    #    return out
    #    if out = object[graph]
    #      return out
    #    end
    #  end

  end
end
