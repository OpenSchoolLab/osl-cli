require 'json'

class FileReader
  def initialize(file_path)
    @file_path = file_path
    file = File.read(file_path)
    @content = JSON.parse(file)
  end

  def content
    @content
  end
end