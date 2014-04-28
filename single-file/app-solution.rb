def assign_group(group_size, students)
  number_of_groups = students.count / group_size
  group_number = 1
  students.shuffle!

  number_of_groups.times do
    assigned_group = []

    group_size.times do
      assigned_group << students.delete_at(0)
    end

    while students.size < group_size && students[0] != nil
      assigned_group << students.delete_at(0)
    end

    puts "Group #{group_number}: #{assigned_group}"
    group_number += 1
  end

end

def load_students(file_name)
  students = []
  File.open(file_name, "r").each_line do |line|
    students << line.chomp
  end
  students
end



def validate_group_size(students, group_size)
  while (students.count / group_size) < 1
    puts "There aren't #{group_size} students in this class!"
    puts "Let's try this again..."
    puts 'How many people would you like per group?'
    group_size = gets.chomp.to_i
  end
end

def validate_reassign(continue, options)
  while !options.include? continue
    puts "#{continue} is not an option."
    puts "Would you like to reassign these groups? (y)es or (n)o"
    continue = gets.chomp.downcase
  end
end



students = load_students('students.csv')

loop do
  puts "How many people would you like per group?"
  group_size = gets.chomp.to_i

  validate_group_size(students, group_size)

  assign_group(group_size, students)

  puts "Would you like to reassign these groups? (y)es or (n)o"
  continue = gets.chomp.downcase
  validate_reassign(continue, ["y", "n"])

  break if continue == "n"

  puts "REASSIGNED GROUPS"
end

puts "Thanks for using my app!"
