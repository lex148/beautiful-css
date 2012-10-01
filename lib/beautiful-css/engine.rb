require "beautiful-css/rule"
require "sass"

module BeautifulCss
  class Engine

    def initialize input
      @input = input
    end

    def scss_to_css scss
      Sass::Engine.new(scss,{:syntax => :scss}).render
    end

    def to_s
      render
    end

    def render
      return nil if @input.nil?

      text = scss_to_css @input
      text = text.gsub( /[\n\r\t]/m, " " )
      text = text.gsub( / +/m, " " )
      text = text.gsub( /\/\*[^*]*\*\//m, " " )
      rules = text.split('}')
      rules = rules.map{|r| Rule.new(r) }.reverse

      hash = {}

      ##BUILD
      rules.each do |r|
        r.props.each do |p|
          hash[p] = [] if !( hash.has_key? p)
          r.selectors.each { |s| hash[p].push s }
        end
      end

      ##PRINT
      output = ""
      hash.keys.sort.each do |key|
        output += "\n"
        output += hash[key].uniq.join(",\n") + "\n"
        output += key + "\n"
      end

      output.gsub( /: +/, ':' )
    end

  end
end
