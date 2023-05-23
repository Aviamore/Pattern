class Students_list_YAML < StudentsList
  def initialize(filename)
    super(filename, YAMLFileStrategy.new)
  end
end
