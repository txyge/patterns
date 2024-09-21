puts"3---------------------"
#Ввод команды для Ruby
print"Введите команду языка Ruby:"
Ruby_Command=$stdin.gets.chomp
#Вывод результата команды для Ruby
puts"Результат для Руби:"
eval(Ruby_Command)
#Ввод команды для ОС
print"Введите команду операционной системы:"
OS_Command=$stdin.gets.chomp
#Вывод результата команды для ОС
puts"Результат для ОС:"
system(OS_Command)
