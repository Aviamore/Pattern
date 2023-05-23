class FileFormatStrategy
  def read(file)
    raise NotImplementedError, 'Subclasses must implement this method'
  end

  def write(file, data)
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end
