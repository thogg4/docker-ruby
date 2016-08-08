module Docker
  module Run
    class << self

      def execute(options={})
        opts = parse_options(options)
        puts opts
        Docker.run_docker_command('run', opts)
      end

      def parse_options(o)
        raise ArgumentError.new('image is required') if !o[:image]
        s = ''
        s += "#{o[:options]} " if o[:options] 

        if o[:detach]
          s += "-d "
        else
          s += "--rm "
        end


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

        if o[:env]
          raise ArgumentError.new('env must be an array') if !o[:env].is_a?(Array)

          o[:env].each do |v|
            s += "-e #{v} "
          end
        end

        s += "--name=#{o[:name]}" if o[:name]

        s += "#{o[:image]} "
        s += "#{o[:command]} " if o[:command]
        s
      end

    end
  end
end
