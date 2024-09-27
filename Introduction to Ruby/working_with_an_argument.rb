
#Проверяем наличие аргумента и выводим прозьбу ввести его
if ARGV.length == 0
  puts ("Введите свое имя, хозяин.")
  exit
end
#Присвиваем аргументу имя
us_name=ARGV[0]
#Вывод приветствия
puts ("Добро пожаловать, #{us_name}!")
#Вывод прозьбы ввести любимый язык программирования
puts ("Какой язык у вас любимый, #{us_name}?")
#Ввод любимого языка и придумывание переменной fav_lenguage
fav_lenguage=$stdin.gets.chomp.downcase
#Проверка любимого языка и последующая обработка
if fav_lenguage=="Ruby"||fav_lenguage=="ruby"||fav_lenguage=="руби"||fav_lenguage=="RUBY"||fav_lenguage=="Руби"||fav_lenguage=="РУБИ"
  puts ("Вы подлиза! #{us_name}.")
else
  #Обработка для других языков
  case fav_lenguage
  when "python"
    puts ("#{us_name}, вы человек питон!")
  when "php"
    puts ("#{us_name}, вы красавчик!")
  when "javascript"
    puts ("#{us_name}, вы.... Ну вы сами поняли кто вы.")  
  else
    puts ("Извините #{us_name}, я не знаю такого языка!")
end
  puts ("Скоро будет ruby! Не переживайте #{us_name}")
end
