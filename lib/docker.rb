# commands
require 'commands/run'

module Docker
  class << self
    attr_accessor :host

    def run_docker_command(subcommand, opts)
      c = "docker "
      c += "-H #{host} " if host
      c += subcommand + ' '
      c += opts

      run_command(c)
    end

    def run_command(command)
      result = system(command)
      raise StandardError.new('command failed to run. do you have docker installed?') if result.nil?
    end

  end
end
