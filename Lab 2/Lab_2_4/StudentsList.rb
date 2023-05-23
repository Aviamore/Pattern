class StudentsList
  attr_accessor :students

  def initialize(filename)
    @file_format_strategy = nil
    @filename = filename
    set_value
  end

  def write_to_file
    @file_format_strategy.write(@filename, @students.map(&:to_h))
  end

  def get_k_n_student_short_list(list_number, quan_element)
    message = "В текущем списке недостаточно элементов, чтобы получить #{list_number}-й список из #{quan_element}-ти элементов!"
    raise(ArgumentError, message) unless valid_k_n?(list_number, quan_element)

    student_short_arr = @students.map { |obj| StudentShort.from_object(obj) }
    student_short_arr = student_short_arr[(list_number - 1) * quan_element...list_number * quan_element]
    DataListStudentShort.new(student_short_arr)
  end

  def sort_by_full_name
    @students.sort_by! { |obj| [obj.last_name, obj.first_name, obj.patronymic]}
  end

  def get_by_id(id)
    @students.find { |obj| obj.id == id }
  end

  def append(object)
    raise(ArgumentError,'Переданное значение должно быть типа Student!') unless valid_student?(object)
    object.id = get_count_id
    @students.push(object)
  end

  def replace_by_id(id, object)
    raise(ArgumentError,'Переданное значение должно быть типа Student!') unless valid_student?(object)
    index = @students.find_index { |obj|  obj.id == id}
    object.id = @students[index].id
    @students[index] = object
  end

  def delete_by_id(id)
    index = @students.find_index { |obj| obj.id == id }
    @students.delete_at(index) if index
  end

  def get_student_count
    @students.length
  end

  private
  
  def set_value
    file_loader = FileLoader.new
    @file_format_strategy = file_loader.get_file_format_strategy(@filename)
    @students = @file_format_strategy.read(@filename).map do |data|
      if data['patronymic'].nil?
        Student.new(data['id'], data['first_name'], data['last_name'])
      else
        Student.new(data['id'], data['first_name'], data['last_name'], data['patronymic'])
      end
    end
  end
