# Генерация файлов для примера
files = 5.times.map do |i|
    filename = "file_#{i}.txt"
    File.open(filename, 'w') { |f| f.puts(Array.new(100_000) { "Line from #{filename}" }) }
    filename
end
  
# puts Sequentially
def process_files_sequentially(files)
  files.each do |file|
    File.foreach(file) { |line| puts line }
  end
end
  
start_time = Time.now

process_files_sequentially(files)

end_time = Time.now
  
puts "Время выполнения Sequentially: #{end_time - start_time} секунд" 

# Время выполнения Sequentially: 1.527182949 секунд