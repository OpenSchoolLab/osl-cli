require_relative '../lib/file_reader'

class HelpService
  def initialize(option=nil)
  end

  def execute_with(option)
    messages = FileReader.new("data/config/messages.json").content
    if option
      puts messages["INVALID_NUMBER_OF_ARGS"]
      exit(0)
    end

    help = FileReader.new("data/help.json").content
    puts formatter(help)
  end

  private
  def formatter(config)
    printer = ""

    ['services', 'options'].each do |key|
      printer.concat("\nAvailable #{key}:\n")
      config[key].each { |option| printer.concat("\t#{option.keys[0]}\t\t#{option[option.keys[0]]}\n") }
    end

    "#{config['name']}\n#{config['description']}\n\n".concat(printer)
  end
end
