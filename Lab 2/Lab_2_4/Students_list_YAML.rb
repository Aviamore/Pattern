require 'yaml'

class Students_list_YAML
  attr_accessor :students

  def initialize(filename)
    @filename = filename
    @students = []
  end

  def read_students
    @students = YAML.load_file(@filename)
  end

  def write_students
    File.open(@filename, 'w') do |f|
      f.write(YAML.dump(@students))
    end
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n)
    start_idx = (n - 1) * k
    end_idx = start_idx + k
    @students[start_idx...end_idx]
  end

  def sort_students_by_name
    @students.sort_by! { |student| [student.surname, student.name] }
  end

  def add_student(name, surname)
    new_id = @students.size + 1
    new_student = Student.new(new_id, name, surname)
    @students << new_student
  end

  def replace_student_by_id(id, name, surname)
    student = get_student_by_id(id)
    if student
      student.name = name
      student.surname = surname
    else
      raise "Student with id #{id} not found"
    end
  end

  def remove_student_by_id(id)
    student = get_student_by_id(id)
    if student
      @students.delete(student)
    else
      raise "Student with id #{id} not found"
    end
  end

  def get_student_short_count
    @students.size
  end
end
