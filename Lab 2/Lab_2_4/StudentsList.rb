class StudentsList
  attr_accessor :students

  def initialize(filename, strategy)
    @filename = filename
    @strategy = strategy
    @students = []
  end

   def read_students
    file_data = @strategy.read(@filename)
    @students = file_data.map do |student_data|
      Student.new(student_data['id'], student_data['name'], student_data['surname'])
    end
  end

  def write_students
    file_data = @students.map do |student|
      { 'id' => student.id, 'name' => student.name, 'surname' => student.surname }
    end
    @strategy.write(@filename, file_data)
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
