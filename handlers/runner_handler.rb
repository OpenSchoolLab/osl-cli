require_relative '../lib/file_reader'
require_relative 'option_handler'

class RunnerHandler
  def initialize(arguments=[])
    @args = arguments
    @messages = FileReader.new("data/config/messages.json").content
  end

  def execute
    if validate_arguments
      service_name = @args[0]
      option = @args[1]
      OptionHandler.new(service_name, option).execute
    end
  end

  private
  def validate_arguments
    unless @args.length == 2 || @args.include?("--help")
      puts @messages["INVALID_NUMBER_OF_ARGS"]
      exit(0)
    end
    true
  end
end