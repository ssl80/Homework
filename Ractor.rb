# Генерация файлов для примера
files = (0...5).map do |i|
    filename = "file_#{i}.txt"
    File.write(filename, Array.new(100_000) { "Line from #{filename}" }.join("\n"))
    filename
end   

# Ractor
def process_files_ractor(files)
    ractors = files.map do |file|
      Ractor.new(file) do |f|
        File.foreach(f) { |line| puts line }
      end
    end
    ractors.each(&:take)
end     

start_time = Time.now

process_files_ractor(files)

end_time = Time.now
  
puts "Время выполнения Ractor: #{end_time - start_time} секунд" 

# Время выполнения Ractor: 1.438327443 секунд
