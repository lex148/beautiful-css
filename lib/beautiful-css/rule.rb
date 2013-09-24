module BeautifulCss
  class Rule

    attr_accessor :selector, :prop, :value

    def initialize(selector, prop, value)
      @selector, @prop, @value = cleaner(selector), (prop || '').downcase, value
    end

    def cleaner sel
      sel.to_s.split(' ').map do |part|
        #only tags are case insensitive
        tag = part.split(/\.|#/)[0]
        to_replace = Regexp.new("^"+ tag)
        part.gsub to_replace, tag.downcase
      end.join(' ')
    end

    def to_s
      @selector + "\n" + "{ #{prop}:#{value} }"
    end

  end

end
