class Students_list_JSON < StudentsList
  def load_from_file
    return unless File.exist?(@file_path)

    file = File.read(@file_path)
    @students = JSON.parse(file, object_class: StudentShort)
  end

  def serialize_students
    JSON.generate(@students)
  end
end
