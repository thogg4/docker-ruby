require 'docker/version'

# commands
require 'docker/commands/run.rb'

module Docker

  def self.run_command(command)
    result = system(command)
    raise StandardError.new('command failed to run. do you have docker installed?') if result.nil?
  end

end
