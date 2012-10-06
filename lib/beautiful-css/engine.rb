require "beautiful-css/rule_parser"
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
      save_imports
      rules = build_rules
      cleaned = remove_unset rules
      groups = build_groups(cleaned)
      return format( groups )
    end


    private

    def save_imports
      @imports = @input.scan(/@import[^;]+;/i)
    end

    def build_rules
      text = scss_to_css @input
      text = text.gsub(/@import[^;]+;/i, '') #remove imports
      text = text.gsub( /[\n\r\t]/m, " " )
      text = text.gsub( / +/m, " " )
      text = text.gsub( /\/\*[^*]*\*\//m, " " ) #remove comments
      rules = text.split('}')
      rules = rules.map{|r| RuleParser.new(r).to_rules }.flatten
    end

    def remove_unset rules
      hash = {}
      rules.each do |r|
        hash[r.prop] = {} if !( hash.has_key? r.prop)
        hash[r.prop][r.selector] = r.value
      end
      hash
    end

    def build_groups rules
      groups = {}
      rules.keys.each do |prop|
        rules[prop].keys.each do |selector|
          val = rules[prop][selector]
          prop_val = "{ #{prop}:#{val} }"
          groups[prop_val] = [] if !( groups.has_key? prop_val)
          groups[prop_val] << selector
        end
      end
      groups
    end

    def format groups
      output = @imports.join('\n') + "\n"

      groups.keys.sort.each do |key|
        output += "\n"
        output += groups[key].uniq.join(",\n") + "\n"
        output += key + "\n"
      end
      output.gsub( /: +/, ':' ).strip
    end


  end
end
