print "Введи команду для Ruby\n"
cmd_ruby = gets.chomp
system "ruby -e \"#{cmd_ruby}\""
puts ''
print "Введите команду для вашей OS\n"
cmd_os = gets.chomp
system cmd_os