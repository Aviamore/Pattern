class StudentShortDataList < DataList

  def initialize(students)
    super(students)
  end

  def get_names
    objects.map(&:last_name_and_initials)
  end

  def get_data
    objects.map { |student| table_fields(student) }
  end

  protected

  def table_fields(student)
    [student.last_name_and_initials, student.contact[:email]]
  end
end