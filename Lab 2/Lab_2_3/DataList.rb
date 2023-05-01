class DataList
  private_class_method :new

  def initialize(objects)
    self.objects = objects
  end

  def select_element(number)
    self.selected_num = number < objects.size ? number : nil
  end

  def selected_id
    objects[selected_num].id
  end

  def column_names
    []
  end

  def data_table
    result = []
    counter = 0
    objects.each do |obj|
      row = []
      row << counter
      row.push(*table_fields(obj))
      result << row
      counter += 1
    end
    DataTable.new(result)
  end

  protected

  def table_fields(_obj)
    []
  end

  private

  attr_accessor :objects, :selected_num
end
