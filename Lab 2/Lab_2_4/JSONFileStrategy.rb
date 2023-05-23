class JSONFileStrategy < FileFormatStrategy
  def read(file)
    json_data = File.read(file)
    JSON.parse(json_data, object_class: Student)
  end

  def write(file, data)
    File.open(file, 'w') do |f|
      f.write(JSON.generate(data))
    end
  end
end
