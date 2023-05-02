class StudentShort < StudentSuper

  public_class_method :new

  private

  attr_writer :last_name_and_initials, :contact

  public

  attr_reader :last_name_and_initials, :contact

  def self.from_student(student)
    raise ArgumentError, 'required: ID' if student.id.nil?

    StudentShort.new(student.id, student.get_info)
  end

  def initialize(id, info)
    raise ArgumentError, 'required: last_name_and_initials' if !info.key?(:last_name_and_initials) || info[:last_name_and_initials].nil?
    self.id = id
    self.last_name_and_initials = info[:last_name_and_initials]
    self.contact = info[:contact].transform_keys(&:to_sym)
    self.github = info[:github]

    options = {}
    options[:id] = id
    options[:github] = github
    options[contact[:type].to_sym] = contact[:value]
    super(options)
  end

  def to_s
    result = last_name_and_initials
    %i[id contact github].each do |attr|
      attr_val = send(attr)
      result += ", #{attr}=#{attr_val}" unless attr_val.nil?
    end
    result
  end
end
