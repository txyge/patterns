
#Ввод команды для Ruby
print"Введите команду языка Ruby:"
ruby_command=$stdin.gets.chomp
#Вывод результата команды для Ruby
puts"Результатик для Руби:"
eval(ruby_command)
#Ввод команды для ОС
print"Введите команду операционной системы:"
os_command=$stdin.gets.chomp
#Вывод результата команды для ОС
puts"Результатик для ОС:"
system(os_command)
