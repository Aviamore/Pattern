class Students_list_JSON < StudentsList
  def initialize(filename)
    super(filename, JSONFileStrategy.new)
    end
end
