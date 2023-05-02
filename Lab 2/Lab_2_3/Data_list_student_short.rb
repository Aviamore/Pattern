require_relative 'data_list'

class DataListStudentShort < DataList
  public_class_method :new
  
  def get_names
    %w[github contact last_name_and_initials]
  end
  
  def get_data
    result = []
    counter = 0
    objects.each do |obj|
      row = []
      row << counter
      row << obj.github
      row << obj.contact
      row << obj.last_name_and_initials
      result << row
      counter += 1
    end
    DataTable.new(result)
  end
end
