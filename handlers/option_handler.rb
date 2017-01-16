require_relative '../services/service_mapper'
class OptionHandler
  def initialize(service_name=nil, option=nil)
    @service_name = service_name
    @option = option
  end

  def execute
    ServiceMapper.map(@service_name).execute_with(@option)
  end
end