class Students_list_YAML < StudentsList
  def initialize(file_path)
    super(file_path, YAMLSerializationStrategy.new)
  end

  def load_from_file
    return unless File.exist?(@file_path)

    file = File.read(@file_path)
    @students = YAML.load(file, [Symbol, StudentShort])
  end
end
