#Вариант 12
#Метод 1. Найти сумму непростых делителей числа.
#Функция суммы непростых делителей
def sum_of_divisors(number)
  sum = 0
  i = 2
  while i <= number
    if number % i == 0
      if is_prime(i)
        else
        sum += i
      end
    end
    i += 1
  end
  return sum
end
#Функция проверки числа на простоту
def is_prime(number)
  i = 2
  while i < number
    if number % i == 0
      return false
    end
    i += 1
  end
  return true
end

puts sum_of_divisors(10000)

#Метод 2. Найти количество цифр числа, меньших 3.
#Функция подсчета цифр
def count_digits(numb)
  count = 0
  while numb > 0
    digit = numb % 10
    if digit < 3
      count += 1
    end
    numb = numb / 10
  end
  return count
end

puts count_digits(13323)

#Метод 3. Найти количество чисел, не являющихся делителями исходного числа, не взамно простых с ним и взаимно простых с суммой простых цифр этого числа.
#Функция нахождения НОД
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

#Функция проверки числа на простоту
def is_prime(figure)
  return false if figure <= 1
  return true if figure == 2 || figure == 3
  
  return false if figure % 2 == 0 || figure % 3 == 0
  
  i = 5
  while i * i <= figure
    return false if figure % i == 0 || figure % (i + 2) == 0
    i += 6
  end
  
  true
end
 
#Функция подсчета суммы простых цифр
def sum_prime_digits(number3)
  sum = 0
  while number3 > 0
    digit = number3 % 10
    if is_prime(digit)
      sum += digit
    end
    number3 = number3 / 10
  end
  return sum
end

#Функция подсчета количество чисел
def  count_number3(number3,original_number)
  count = 0
  if (number3 % original_number != 0) and (gcd(number3, original_number) != 1) and (gcd(number3,sum_prime_digits(number3)))
    count += 1
  end
  return count
end

puts count_number3(13323, 10000)
