require "beautiful-css/rule"

module BeautifulCss
  class RuleParser

    def initialize(str)
      @body = str
      @body = @body.gsub( /;base64,/ , '__base64__')
    end

    def selectors
      @body.match(/[^{]*/).to_s.split(/,/).map{|s| s.strip}.select{|s| !s.empty? }
    end

    def props
      begin
      p = @body.match(/\{([^}]*)/)[1].split(';').select{|s| !s.strip.empty? }
      p.map do |s|
        first, *rest = s.strip.split(':')
        rest.class == Array ? [first, rest.join(':') ] : [first, rest ]
      end
      rescue
        []
      end
    end

    def restore_special_strings str
      str = str.gsub( /__base64__/, ';base64,')
      str
    end

    def to_rules
      selectors.map do |selector|
        props.map do |prop|
          val = restore_special_strings prop[1]
          BeautifulCss::Rule.new(selector, prop[0], val)
        end
      end.flatten
    end

    def body
      @body
    end


  end

end
