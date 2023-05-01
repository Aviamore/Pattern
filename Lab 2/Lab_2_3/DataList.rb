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
    protected

  def table_fields(obj)
    [obj.github, obj.contact, obj.last_name_and_initials]
  end
end
