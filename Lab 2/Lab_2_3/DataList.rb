class DataList
  private_class_method :new

  attr_writer :objects

  def initialize(objects)
    self.objects = objects
  end
  
  def select_element(number)
    self.selected_num = number < objects.size ? number : nil
  end
  
  def get_select
    objects[selected_num].id
  end
  
  def get_names
    raise NotImplementedError, 'get_names must be defined in subclass'
  end
  
  def get_data
    raise NotImplementedError, 'get_data must be defined in subclass'
  end
  
  protected
  
  def table_fields(_obj)
    []
  end

  private

  attr_reader :objects
  attr_accessor :selected_num
  
end
