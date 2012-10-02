module BeautifulCss
  class Rule

    attr_accessor :selector, :prop, :value

    def initialize(selector, prop, value)
      @selector, @prop, @value = selector.strip, prop.strip, value.strip
    end

    def to_s
      @selector + "\n" + "{ #{prop}:#{value} }"
    end

  end

end
