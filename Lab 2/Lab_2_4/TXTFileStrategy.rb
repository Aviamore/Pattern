class TXTFileStrategy < FileFormatStrategy
  def read(file)
    students = []
    File.foreach(file) do |line|
      student_data = line.strip.split(',')
      id = student_data[0].to_i
      name = student_data[1]
      surname = student_data[2]
      student = Student.new(id, name, surname)
      students << student
    end
    students
  end

  def write(file, data)
    File.open(file, 'w') do |f| data.each do |student|
        f.puts("#{student.id},#{student.name},#{student.surname}")
      end
    end
  end
end
