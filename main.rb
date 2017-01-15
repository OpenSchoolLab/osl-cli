require_relative 'lib/services'
require_relative 'lib/file_reader'

@messages = FileReader.new("data/config/messages.json").content

def execute(service_name, action)
  case service_name
    when "core"
      Services.core(action)
    when "--help"
      Services.help(action)
    else
      puts "No service found with the name '#{service_name}'"
      exit(0)
  end
end

def is_command_valid(commandline_arguments)
  unless commandline_arguments.length == 2 || commandline_arguments.include?("--help")
    puts @messages["INVALID_NUMBER_OF_ARGS"]
    exit(0)
  end
  true
end

if is_command_valid(ARGV)
  service_name = ARGV[0]
  action = ARGV[1]
  execute(service_name, action)
end