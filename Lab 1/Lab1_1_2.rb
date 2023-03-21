print "Представтесь, пожалуйста\n"
user_name = ARGV[0].chomp
print "Здравствуйте, #{user_name}!\n"

puts "Какой ваш любимый язык программирования?"
answer = STDIN.gets
exit if answer.nil? or answer.empty?
answer.chomp!

case answer
when "Ruby"
  puts "Подлиза, но выбора у тебя не было."
when "Python"
  puts "Нейронку для курсача пишешь?"
when "Java"
  puts "Хороооош, красавчик!"
else
  puts "Тут надо вводить только языки."
end
