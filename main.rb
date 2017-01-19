require_relative 'handlers/installer_handler'
require_relative 'handlers/runner_handler'

if ARGV.include?("install")
  InstallerHandler.new(ARGV).execute
else
  RunnerHandler.new(ARGV).execute
end