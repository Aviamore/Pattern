class YAMLFileStrategy < FileFormatStrategy
  def read(file)
    YAML.load_file(file)
  end

  def write(file, data)
    File.open(file, 'w') do |f|
      f.write(YAML.dump(data))
    end
  end
end
