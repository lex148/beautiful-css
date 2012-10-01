module BeautifulCss
  module Exec
    class Css

      def initialize args
        @args = args
      end


      def run
        file = File.open(@args.first, "rb")
        input = file.read
        file.close
        clean = BeautifulCss::Engine.new(input).render
        file = File.open(@args.first, "wb")
        file.puts clean
        file.close
      end

    end

  end
end
