require 'yaml'
dir_to_watch = 'payloads'
previous_state = YAML.load_file('info.yaml') rescue {}
current_state = Dir[File.join(dir_to_watch, '**', '*')].each_with_object({}) do |file, state|
  state[file] = File.mtime(file)
end
if current_state == previous_state
  puts "No files have been modified."
else
  puts "Some files have been modified:"
  (current_state.keys - previous_state.keys).each do |file|
    puts "#{file} (new)"
  end
  (current_state.keys & previous_state.keys).each do |file|
    puts "#{file} (modified)" if current_state[file] != previous_state[file]
  end
  (previous_state.keys - current_state.keys).each do |file|
    puts "#{file} (deleted)"
  end
end
File.open('info.yaml', 'w') { |f| f.write(current_state.to_yaml) }
