require_relative 'Student.rb'

student1 = Student.new('Михайлов', 'Денис', 'Александрович')
student2 = Student.new('Кинешко', 'Денис', 'Петрович', { id: 2, phone: '79094574298', telegram: 'Molen', email: 'internet@mail.ru', github: 'Aiamore' })

student1.to_s
student2.to_s