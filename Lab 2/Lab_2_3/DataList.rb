 attr_reader :obj_list, :selected_items

  def initialize(obj_list)
    self.obj_list = obj_list
    self.selected_items = []
  end

  # выделение элементов по номеру
  def select(*numbers)
    selected_items.concat(numbers)
  end

  # массив id выделенных элементов
  def get_select
    obj_list.values_at(*selected_items).map(&:id)
  end

  def get_names; end

  # получение таблицы
  def get_data; end

  protected

  # obj_list геттер для доступа к списку объектов obj_list
  # obj_list сеттер для установки списка объектов obj_list
  attr_writer :obj_list
  attr_accessor :selected_items

  # Возвращает значения полей объекта object
  def get_fields(object)
    []
  end
end
