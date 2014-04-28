# Print out the randomly assigned groups
def assign_group(group_size, students)

end


# Read all the students' names from the students.csv
# Place all the names in an array
def load_students(file_name)

end


# Validate that there enough names in students to create more than one group
def validate_group_size(students, group_size)

end

# Validate the user selected one of the options
def validate_reassign(continue, options)

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
