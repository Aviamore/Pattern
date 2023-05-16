require_relative 'student_short'
require_relative 'data_list'
require_relative 'serialization_strategy'

class StudentsList
  def initialize(file_path, serialization_strategy)
    @file_path = file_path # путь к файлу
    @students = []
    @serialization_strategy = serialization_strategy
    load_from_file
  end

  def load_from_file
    raise NotImplementedError, 'Метод load_from_file не реализован'
  end

  def save_to_file
    File.open(@file_path, 'w') do |file|
      file.write(@serialization_strategy.serialize(@students))
    end
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    data_list ||= DataList.new(@students)
    data_list.select_element((k - 1) * n)
    selected_students = @students[data_list.selected_num, n]
    StudentShortDataList.new(selected_students).tap do |result|
      result.prev_data_list = data_list if data_list
    end
  end

  def sort_by_last_name_and_initials
    @students.sort_by! { |student| [student.last_name, student.first_name, student.patronymic] }
  end

  def add_student(student)
    @students << student
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id == id }
    @students[index] = new_student if index
  end
  
  def remove_student_by_id(id)
    @students.reject! { |student| student.id == id }
  end
end
