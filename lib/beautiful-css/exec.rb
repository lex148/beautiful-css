module BeautifulCss
  module Exec
    class Css

      def initialize args
        @args = args
      end

      def run!
        begin
          run
        rescue Exception => e
          raise e if @options[:trace] || e.is_a?(SystemExit)
          $stderr.print "#{e.class}: " unless e.class == RuntimeError
          $stderr.puts "#{e.message}"
          $stderr.puts "  Use --trace for backtrace."
          exit 1
        end
        exit 0
      end

      def run
        file = File.open(@args[0], "rb")
        input = file.read
        file.close
        file = File.open(@args[0], "wb")
        file.puts BeautifulCss.Engine.new(input).render
        file.close
      end

    end

  end
end
