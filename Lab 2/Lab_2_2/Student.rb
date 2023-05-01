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
  
    def telegram=(new_telegram)
    raise ArgumentError, "Invalid argument: telegram=#{new_telegram}" unless new_telegram.nil? || Student.valid_profile_name?(new_telegram)

    @telegram = new_telegram
  end

  def git=(new_github)
    raise ArgumentError, "Invalid argument: github=#{new_github}" unless new_github.nil? || Student.valid_profile_name?(new_github)

    @git = new_git
  end

  def email=(new_email)
    raise ArgumentError, "Invalid argument: email=#{new_email}" unless new_email.nil? || Student.valid_email?(new_email)

    @email = new_email
  end
  
  def phone=(new_phone)
    raise ArgumentError, "Invalid argument: phone=#{new_phone}" unless new_phone.nil? || Student.valid_phone?(new_phone)

    @phone = new_phone
    
 def valid_contacts?
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  def valid_github?
    !github.nil?
  end
    
    def valid?
    valid_contacts? && valid_github?
  end
    
  def set_contacts(contacts)
    self.phone = contacts[:phone] if contacts.key?(:phone)
    self.telegram = contacts[:telegram] if contacts.key?(:telegram)
    self.email = contacts[:email] if contacts.key?(:email)
  end
    
  def short_contact
    return "Tg: #{telegram}" unless telegram.nil?
    return "Email: #{email}" unless email.nil?
    return "Тел: #{phone}" unless phone.nil?

    nil
  end

  def last_name_and_initials
    "#{last_name} #{first_name[0]}. #{father_name[0]}."
  end

  def get_info
    "#{last_name_and_initials}, #{short_contact}, Git: #{github}"
  end
   
  def to_s
    "ID: #{@id}, Фамилия: #{@last_name}, Имя: #{@first_name}, Отчество: #{@father_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@github}"
  end
end
