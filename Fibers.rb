# Генерация файлов для примера
files = 5.times.map do |i|
    filename = "file_#{i}.txt"
    File.open(filename, 'w') { |f| f.puts(Array.new(100_000) { "Line from #{filename}" }) }
    filename
end
  
# puts Fibers 
def process_files_fibers(files)
    fibers = files.map do |file|
        Fiber.new do
            File.foreach(file) { |line| puts line }
        end
    end
    fibers.each(&:resume)
end           
  
start_time = Time.now

process_files_fibers(files)

end_time = Time.now
  
puts "Время выполнения fibers: #{end_time - start_time} секунд" 

# Время выполнения fibers: 1.54189431 секунд