require "beautiful-css/rule"

module BeautifulCss
  class RuleParser

    def initialize(str)
      @body = str
    end

    def selectors
      @body.match(/[^{]*/).to_s.split(/,/).map{|s| s.strip}.select{|s| !s.empty? }
    end

    def props
      begin
      p = @body.match(/\{([^}]*)/)[1].split(';').select{|s| !s.strip.empty? }
      p.map{|s| s.strip.split(':') }
      rescue
        []
      end
    end

    def to_rules
      selectors.map do |selector|
        props.map do |prop|
          BeautifulCss::Rule.new(selector, prop[0], prop[1])
        end
      end.flatten
    end

    def body
      @body
    end


  end

end
