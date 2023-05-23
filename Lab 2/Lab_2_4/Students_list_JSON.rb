require 'json'

class Students_list_JSON < StudentsList
  def read_students
    file = File.read(@filename)
    @students = JSON.parse(file, object_class: Student)
  end

  def write_students
    File.open(@filename, 'w') do |f|
      f.write(JSON.generate(@students))
    end
  end
end
