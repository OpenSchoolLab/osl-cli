require_relative 'core_service'
require_relative 'apps_service'
require_relative 'help_service'

class ServiceMapper
  class << self
    def map(service_name)
      services = {
          "core" => CoreService.new(),
          "apps" => AppsService.new(),
          "--help" => HelpService.new()
      }

      services[service_name]
    end
  end
end