require_relative 'student'

class DataTable
  def self.student_to_array(student)
    [
      student.id,
      student.last_name,
      student.first_name,
      student.father_name,
      student.phone,
      student.telegram,
      student.email,
      student.github
    ]
  end

  private

  attr_accessor :table

  public

  def initialize(*students)
    self.table = []
    students.each { |student| table.append(DataTable.student_to_array(student)) }
  end

end
