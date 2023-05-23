class StudentListStrategy
  private_class_method :new

  protected

  def str_to_hash_list(str)
    raise NotImplementedError('Должен быть реализован в дочернем')
  end

  def hash_list_to_str(hash_list)
    raise NotImplementedError('Должен быть реализован в дочернем')
  end
end
