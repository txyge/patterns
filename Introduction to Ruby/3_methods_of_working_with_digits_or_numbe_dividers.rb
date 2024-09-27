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
def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

def sum_of_prime_digits(n)
  n.to_s.chars.map(&:to_i).select { |digit| prime?(digit) }.sum
end

def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

def count_number3(n)
  sum_primes = sum_of_prime_digits(n)
  count = 0

  (1..n).each do |i|
    if n % i != 0 && gcd(n, i) != 1 && gcd(sum_primes, i) == 1
      count += 1
    end
  end
  count
end

puts count_number3(124)