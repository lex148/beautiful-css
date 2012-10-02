module BeautifulCss
  class Rule

    attr_accessor :selector, :prop, :value

    def initialize(selector, prop, value)
      @selector, @prop, @value = selector, prop, value
    end

    def to_s
      @selector + "\n" + "{ #{prop}:#{value} }"
    end

  end

end
