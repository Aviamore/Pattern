class Student
  def self.valid_phone?(phone)
    phone.match(/^\+?[78] ?[(-]?\d{3} ?[)-]?[ -]?\d{3}[ -]?\d{2}[ -]?\d{2}$/)
  end
  
  def self.valid_name?(name)
    name.match(/(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/)
  end
  
  def self.valid_profile_name?(profile_name)
    profile_name.match(/^[a-zA-Z0-9_.]+$/)
  end

  def self.valid_email?(email)
    email.match(/^(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/)
  end
  
  attr_accessor :phone
  attr_reader :last_name, :first_name, :father_name, :id, :telegram, :email, :github
  
  def initialize(last_name, first_name, father_name, options = {})
   self.last_name = last_name
   self.first_name = first_name
   self.father_name = father_name
   self.id = options[:id]
   self.phone = options[:phone]
   self.telegram = options[:telegram]
   self.email = options[:email]
   self.github = options[:github]
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
