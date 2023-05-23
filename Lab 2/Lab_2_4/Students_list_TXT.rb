class Students_list_TXT < StudentsList
  def initialize(filename)
    super(filename, TXTFileStrategy.new)
  end
end
