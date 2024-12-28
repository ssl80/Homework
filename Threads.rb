# Генерация файлов для примера
files = 5.times.map do |i|
    filename = "file_#{i}.txt"
    File.open(filename, 'w') { |f| f.puts(Array.new(100_000) { "Line from #{filename}" }) }
    filename
end
  
 # puts Threads
def process_files_threads(files)
  files.each do |file|
    threads = []
    threads << Thread.new do    
    File.open(file, 'r') do |f|
      f.each_line { |line| puts line }
    end
    end
    threads.each(&:join)
  end
end
  
start_time = Time.now

process_files_threads(files)

end_time = Time.now
  
puts "Время выполнения Threads: #{end_time - start_time} секунд" 

# Время выполнения Threads: 1.526124576 секунд