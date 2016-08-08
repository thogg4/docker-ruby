require 'docker/version'

# commands
require 'docker/commands/run.rb'

module Docker
  class << self
    attr_accessor :host

    def run_docker_command(subcommand, opts)
      c = "docker "
      c += "-H #{host} " if host
      c += subcommand + ' '
      c += opts

      puts c

      #run_command(c)
    end

    def run_command(command)
      result = system(command)
      raise StandardError.new('command failed to run. do you have docker installed?') if result.nil?
    end

  end
end
