require_relative 'student_super'

class Student < StudentSuper
  
  public :phone, :telegram, :email, 'id=', 'phone=', 'telegram=', 'email=', 'github='
  attr_reader :last_name, :first_name, :father_name
  
  def initialize(last_name, first_name, father_name, options = {})
   self.last_name = last_name
   self.first_name = first_name
   self.father_name = father_name
   super(options)
  end
  
 def last_name=(new_last_name)
    raise ArgumentError, "Invalid argument: last_name=#{new_last_name}" unless Student.valid_name?(new_last_name)

    @last_name = new_last_name
  end

  def first_name=(new_first_name)
    raise ArgumentError, "Invalid argument: first_name=#{new_first_name}" unless Student.valid_name?(new_first_name)

    @first_name = new_first_name
  end

  def father_name=(new_father_name)
    raise ArgumentError, "Invalid argument: father_name=#{new_father_name}" unless Student.valid_name?(new_father_name)

    @father_name = new_father_name
  end
  
  def set_contacts(contacts)
    self.phone = contacts[:phone] if contacts.key?(:phone)
    self.telegram = contacts[:telegram] if contacts.key?(:telegram)
    self.email = contacts[:email] if contacts.key?(:email)
    
  def last_name_and_initials
    "#{last_name} #{first_name[0]}. #{father_name[0]}."
    
  def short_contact
    return "Tg: #{telegram}" unless telegram.nil?
    return "Email: #{email}" unless email.nil?
    return "Тел: #{phone}" unless phone.nil?

    nil
  end

  def get_info
    info = {}
    info[:last_name_and_initials] = last_name_and_initials
    info[:contact] = short_contact
    info[:github] = github
    info
  end
   
  def to_s
    result = "#{last_name} #{first_name} #{father_name}"
    %i[id phone telegram email git].each do |attr|
      attr_val = send(attr)
      result += ", #{attr}=#{attr_val}" unless attr_val.nil?
    end
    result
  end
end
