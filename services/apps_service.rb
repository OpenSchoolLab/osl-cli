class AppsService
  def initialize
    @option = nil
    @config = FileReader.new("data/config/app.json").content
    @messages = FileReader.new("data/config/messages.json").content
  end

  def execute_with(option)
    @option = option
    unless @config['service']['available_actions'].include?(option)
      puts "#{@messages['OPTION_NOT_RECOGNISED']}: #{option}"
    end
    case option
      when "start"
        execute(@config["path"], "nohup #{@config["service"]["runner"]} start &")
      when "stop"
        execute(@config["path"], "kill $(lsof -t -i:4200)")
      when "restart"
        execute_with("stop")
        execute_with("start")
    end
  end

  private
  def execute(on, followed_by)
    Dir.chdir(on){
      system(followed_by)
    }
  end
end