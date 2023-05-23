require 'yaml'

class Students_list_YAML < StudentsList
  def read_students
    @students = YAML.load_file(@filename)
  end

  def write_students
    File.open(@filename, 'w') do |f|
      f.write(YAML.dump(@students))
    end
  end
end
