
task :up_pic => :environment do
  path = Dir.new(STDIN.gets.chomp)

  add_categories_or_pictures(path)
end
def add_categories_or_pictures(value, parent=nil)
  value.entries.each do |element|

    if element != '.' && element != '..'

      file_or_dir = File.join(value.path, element)

      if File.directory?(file_or_dir)
        category = Category.find_or_create_by_name(element)
        file_or_dir = Dir.new(file_or_dir)
        add_categories_or_pictures(file_or_dir, category)

      elsif File.file?(file_or_dir)
       parent.pictures.create(:url => File.open(file_or_dir))
      else
        puts 'ERROR', file_or_dir
      end
    end
  end
end