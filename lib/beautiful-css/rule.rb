
module BeautifulCss

  class Rule
    def initialize(str)
      @body = str
    end

    def selectors
      @body.match(/[^{]*/).to_s.split(/,/).map{|s| s.strip}.select{|s| !s.empty? }
    end

    def props
      begin
      p = @body.match(/\{([^}]*)/)[1].split(';').select{|s| !s.strip.empty? }
      p.map{|s| "{ " + s.strip + " }"}
      rescue
        []
      end
    end

    def body
      @body
    end

  end

end
