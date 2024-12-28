require 'parallel'

# Генерация файлов для примера
files = (0...5).map do |i|
    filename = "file_#{i}.txt"
    File.write(filename, Array.new(100_000) { "Line from #{filename}" }.join("\n"))
    filename
end      

# Parallel
def process_files_parallel(files)
    Parallel.each(files) do |file|
      File.foreach(file) { |line| puts line }
    end
end   

start_time = Time.now

process_files_parallel(files)

end_time = Time.now
  
puts "Время выполнения Parallel: #{end_time - start_time} секунд" 

# Время выполнения Parallel: 1.372949012 секунд
