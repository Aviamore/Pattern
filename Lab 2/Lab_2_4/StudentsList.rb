require 'json'
require 'yaml'
require_relative 'student_short'
require_relative 'data_list'

class StudentsList
  def initialize(file_path)
    @file_path = file_path # (Путь к файлу)
    @students = []
    load_from_file
  end

  def load_from_file
    raise NotImplementedError, 'Метод load_from_file не реализован'
  end

  def save_to_file
    File.open(@file_path, 'w') do |file|
      file.write(serialize_students)
    end
  end

  def serialize_students
    raise NotImplementedError, 'Метод serialize_students не реализован'
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
    @students.sort_by!(&:last_name_and_initials)
  end

  def add_student(student)
    student.id = @students.empty? ? 1 : @students.last.id + 1
    @students << student
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id == id }
    return unless index

    @students[index] = new_student
  end

  def delete_student_by_id(id)
    index = @students.find_index { |student| student.id == id }
    return unless index

    @students.delete_at(index)
  end

  def get_student_short_count
    @students.size
  end
end
