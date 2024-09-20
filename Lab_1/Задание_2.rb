
puts"2---------------------"
#Проверяем наличие аргумента и выводим прозьбу ввести его
if ARGV.length == 0
  puts ("Введите свое имя, хозяин.")
  exit
end
#Присвиваем аргументу имя
Us_Name=ARGV[0]
#Вывод приветствия
puts ("Добро пожаловать, #{Us_Name}!")
#Вывод прозьбы ввести любимый язык программирования
puts ("Какой язык у вас любимый, #{Us_Name}?")
#Ввод любимого языка и придумывание переменной Fav_Lenguage
Fav_Lenguage=$stdin.gets.chomp.downcase
#Проверка любимого языка и последующая обработка
if Fav_Lenguage=="Ruby"||Fav_Lenguage=="ruby"||Fav_Lenguage=="руби"||Fav_Lenguage=="RUBY"||Fav_Lenguage=="Руби"||Fav_Lenguage=="РУБИ"
  puts ("Вы подлиза! #{Us_Name}.")
else
  #Обработка для других языков
  case Fav_Lenguage
  when "python"
    puts ("#{Us_Name}, вы человек питон!")
  when "php"
    puts ("#{Us_Name}, вы красавчик!")
  when "javascript"
    puts ("#{Us_Name}, вы.... Ну вы сами поняли кто вы.")  
  else
    puts ("Извините #{Us_Name}, я не знаю такого языка!")
end
  puts ("Скоро будет ruby! Не переживайте #{Us_Name}")
end
