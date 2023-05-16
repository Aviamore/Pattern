class Students_list_YAML < StudentsList
  def load_from_file
    return unless File.exist?(@file_path)

    file = File.read(@file_path)
    @students = YAML.load(file, [Symbol, StudentShort])
  end

  def serialize_students
    YAML.dump(@students)
  end
end
