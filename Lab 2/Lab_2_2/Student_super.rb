class StudentSuper

  private_class_method :new

  def self.valid_name?(name)
    name.match(/(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/)
  end

  def self.valid_phone?(phone)
    phone.match(/^\+?[78] ?[(-]?\d{3} ?[)-]?[ -]?\d{3}[ -]?\d{2}[ -]?\d{2}$/)
  end

  def self.valid_profile_name?(profile_name)
    profile_name.match(/^[a-zA-Z0-9_.]+$/)
  end

  def self.valid_email?(email)
    email.match(/^(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/)
  end

  protected

  attr_writer :id
  attr_reader :phone, :telegram, :email

  public

  attr_reader :id, :github

  def initialize(options)
    self.id = options[:id]
    self.phone = options[:phone]
    self.telegram = options[:telegram]
    self.email = options[:email]
    self.github = options[:github]
  end

  def short_contact
    contact = {}
    %i[telegram email git].each do |attr|
      attr_val = send(attr)
      next if attr_val.nil?

      contact[:type] = attr
      contact[:value] = attr_val
      return contact
    end

    nil
  end

  protected

  def phone=(new_phone)
    raise ArgumentError, "Invalid argument: phone=#{new_phone}" unless new_phone.nil? || StudentSuper.valid_phone?(new_phone)

    @phone = new_phone
  end

  def telegram=(new_telegram)
    raise ArgumentError, "Invalid argument: telegram=#{new_telegram}" unless new_telegram.nil? || StudentSuper.valid_profile_name?(new_telegram)

    @telegram = new_telegram
  end

  def github=(new_github)
    raise ArgumentError, "Invalid argument: github=#{new_github}" unless new_github.nil? || StudentSuper.valid_profile_name?(new_github)

    @github = new_github
  end

  def email=(new_email)
    raise ArgumentError, "Invalid argument: email=#{new_email}" unless new_email.nil? || StudentSuper.valid_email?(new_email)

    @email = new_email
  end

  public

  def has_contacts?
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  def has_github?
    !github.nil?
  end

  def valid?
    has_contacts? && has_github?
  end
end
