
# a = $stdin.read

module FileManager
  private

  def load_game
    if !Dir.exist?('./saved_games/')
      loop do
        puts "\nNo saved games!"
        break if user_input == '1'
      end
    else
      loaded_game =
        File.open("./saved_games/#{load_file_name}.yml", 'r') do |file|
          YAML.load(file)
        end
      loaded_game.play
    end
  end

  def load_file_name
    saved_games =
      Dir
        .glob('saved_games/*')
        .map { |game| game.split('/').last.split('.yml').first }
    file_count = saved_games.size
    loop do
      puts 'Enter a number of a game to load:'
      saved_games.each_with_index { |game, i| puts "#{i + 1}: #{game}" }
      file_nr = gets.chomp.strip
      if /\A[1-9]+\Z/.match?(file_nr) && file_nr.to_i <= file_count
        return saved_games[file_nr.to_i - 1]
      end
      puts "\nInvalid input.\n\n"
    end
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    File.open("./saved_games/#{save_file_name}.yml", 'w') do |f|
      f.write(YAML.dump(self))
    end
    puts "Your game has been saved!"
    exit
  end

  def save_file_name
    saved_games = Dir.glob('saved_games/*')
    loop do
      puts 'Enter a name to save your game: '
      file_name = gets.chomp.strip
      if saved_games.include?("saved_games/#{file_name}.yml")
        puts "\nFile aready exists"
        next
      end
      return file_name unless /\s+|^$/.match?(file_name)
    end
  end
end

p $stdout

text_file = File.open("./text.txt", "w")
old_stdout = $stdout
p old_stdout
$stdout = text_file # new output stream is file
puts "Sakam"
puts $stdout # #<File:0x000055b3bea97de8>
$stderr = text_file # output stream for errors is file
# z = 10/0 # exits program
10.times {|i| puts "#{i} hello"}
text_file.close

$stdout = old_stdout # return to default value
puts "Atpakal"

text_file2 = File.new("./text.txt")
puts text_file2.read
text_file2.rewind
puts text_file2.gets # nil when finishes
puts text_file2.gets
text_file2.rewind
puts text_file2.readline # EOF error when finishes
puts text_file2.getc # reads char by char, returns nil when finishes
puts text_file2.readchar # returns EOF error when finishes
p text_file2.readlines # returnes array
text_file2.close

puts File.readlines("./text.txt") # returns array of lines

File.open("./text.txt") do |text_file|
  text_file.each do |line|
    p line
  end
end

p FileTest.exist?("./text.txt") # true
p FileTest.empty?("./text.txt") # false