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

  # Переопределить в наследниках
  def column_names
    []
  end

  # Переопределить в наследниках
  def data_table
    DataTable.new([])
  end

  private

  attr_accessor :objects, :selected_num
end
