require 'json'
require 'yaml'
require_relative 'student_short'
require_relative 'data_list'
require_relative 'serialization_strategy'

class StudentsList
  def initialize(file_path, serialization_strategy)
    @file_path = file_path # путь к файлу
    @students = []
    @serialization_format = serialization_format
    load_from_file
  end

  def load_from_file
    raise NotImplementedError, 'Метод load_from_file не реализован'
  end

  def save_to_file
    File.open(@file_path, 'w') do |file|
      file.write(serialize(@students))
    end
  end

  def get_student_short_count
    StudentShort.new({ count: @students.count })
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
  
   private

  def serialize(students)
    case @serialization_format
    when :json
      JSON.generate (students)
    when :yaml
      YAML.dump(students)
    else
      raise "Unsupported serialization format: #{@serialization_format}"
    end
  end

  def deserialize(data)
    case @serialization_format
    when :json
      JSON.parse(data).map { |student| StudentShort.new(student) }
    when :yaml
      YAML.safe_load(data).map { |student| StudentShort.new(student) }
    else
      raise "Unsupported serialization format: #{@serialization_format}"
    end
  end
end
