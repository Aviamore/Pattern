class FileLoader
  def self.load(filename)
    file_extension = File.extname(filename)
    case file_extension
    when '.json'
      strategy = JSONFileStrategy.new
    when '.txt'
      strategy = TXTFileStrategy.new
    when '.yaml'
      strategy = YAMLFileStrategy.new
    else
      raise "Unsupported file format: #{file_extension}"
    end
    StudentsList.new(filename, strategy)
  end
end
