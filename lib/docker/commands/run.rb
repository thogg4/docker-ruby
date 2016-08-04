module Docker
  module Run
    class << self

      def execute(options={})
        opts = parse_options(options)
        puts opts
        Docker.run_command("docker run #{opts}")
      end

      def parse_options(o)
        raise ArgumentError.new('image is required') if !o[:image]
        s = ''
        s += "#{o[:options]} " if o[:options] 

        if o[:volumes]
          raise ArgumentError.new('volumes must be an array') if !o[:volumes].is_a?(Array)

          o[:volumes].each do |volume|
            s += "-v #{volume} "
          end
        end

        if o[:ports]
          raise ArgumentError.new('ports must be an array') if !o[:ports].is_a?(Array)

          o[:ports].each do |port|
            s += "-p #{port} "
          end
        end

        s += "#{o[:image]} "
        s += "#{o[:command]} " if o[:command]
        s
      end

    end
  end
end
