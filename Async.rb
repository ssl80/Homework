require 'async'

# Генерация файлов для примера
files = (0...5).map do |i|
    filename = "file_#{i}.txt"
    File.write(filename, Array.new(100_000) { "Line from #{filename}" }.join("\n"))
    filename
  end   

# puts Async 
def process_files_async(files)
    Async do
      tasks = files.map do |file|
        Async do
          File.foreach(file) { |line| puts line }
        end
      end
  
      tasks.each(&:wait)
    end
end           

start_time = Time.now

process_files_async(files)

end_time = Time.now
  
puts "Время выполнения Async: #{end_time - start_time} секунд" 

# Время выполнения Async: 1.487615002 секунд


