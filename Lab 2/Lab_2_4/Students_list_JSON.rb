class Students_list_JSON < StudentsList
  def initialize(file_path)
    super(file_path, JSONSerializationStrategy.new)
  end

  def load_from_file
    return unless File.exist?(@file_path)

    file = File.read(@file_path)
    @students = JSON.parse(file, object_class: StudentShort)
  end
end
