require 'json'

class FileReader

  def initialize(file_path)
    cli_path = "/opt/osl/osl-cli/"
    file_path = cli_path.concat(file_path)
    file = File.read(file_path)
    @content = JSON.parse(file)
  end

  def content
    @content
  end
end