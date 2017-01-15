require_relative 'file_reader'

class Services
  class << self
    def core(action)
      config = FileReader.new("data/config/core.json").content

      case action
        when "start"
          execute(config["path"], "nohup #{config["service"]["runner"]} server &")
        when "stop"
          execute(config["path"], "shutup")
        when "restart"
          core("stop")
          core("start")
        else
          puts "Action - #{action}: Not recognised"
          exit(0)
      end
    end

    def help(action)
      messages = FileReader.new("data/config/messages.json").content
      if action
        puts messages["INVALID_NUMBER_OF_ARGS"]
        exit(0)
      end

      help = FileReader.new("data/help.json").content
      puts formatter(help)
    end

    def execute(on, followed_by)
      Dir.chdir(on){
        system(followed_by)
      }
    end

    private
    def formatter(config)
      available_services = "\nAvailable Services:\n"
      config['services'].each { |service| available_services.concat("\t#{service.keys[0]}\t\t#{service[service.keys[0]]}\n") }

      available_options = "\nAvailable Options:\n"
      config['options'].each { |options| available_options.concat("\t#{options.keys[0]}\t\t#{options[options.keys[0]]}\n") }

      "#{config['name']}\n#{config['description']}\n\n".concat(available_services).concat(available_options)

    end
  end
end