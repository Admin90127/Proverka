# Метод для генерации пароля
def generate_password(length)
  characters = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
  password = (0...length).map { characters[rand(characters.length)] }.join
end

# Метод для сохранения пароля на рабочем столе
def save_password_to_desktop(password, difficulty)
  desktop_path = File.join(File.expand_path('~/Desktop'), "Password_#{difficulty}.txt")
  File.open(desktop_path, 'w') { |file| file.write(password) }
  puts "Пароль сохранен на рабочем столе в файле: Password_#{difficulty}.txt"
end

# Метод для выбора уровня сложности пароля
def choose_difficulty
  puts "Выберите уровень сложности пароля:"
  puts "1. Легкий"
  puts "2. Нормальный"
  puts "3. Сложный"
  choice = gets.chomp.to_i
  case choice
  when 1
    return "Легкий"
  when 2
    return "Нормальный"
  when 3
    return "Сложный"
  else
    return "Нормальный"
  end
end

# Главная часть программы
puts "Добро пожаловать в генератор паролей!"
difficulty = choose_difficulty
puts "Введите длину пароля (количество символов):"
length = gets.chomp.to_i

password = generate_password(length)
save_password_to_desktop(password, difficulty)

puts "Пароль: #{password}"
puts "Уровень сложности: #{difficulty}"
