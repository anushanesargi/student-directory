# an array of students
# student = [
# { name: "Dr. Hannibal Lecter", cohort: :November },
# { name: "Darth Vader", cohort: :November }, 
# { name: "Nurse Ratched", cohort: :November },
# { name: "Michael Corleone", cohort: :November },
# { name: "Alex DeLarge", cohort: :November },
# { name: "The Wicked Witch of the West", cohort: :November },
# { name: "Terminator", cohort: :November },
# { name: "Freddy Krueger", cohort: :November },
# { name: "The Joker", cohort: :November },
# { name: "Joffrey Baratheon", cohort: :November },
# { name: "Norman Bates", cohort: :November }
# ]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    name = gets.chomp
    while !name.empty?
        students << {name: name, cohort: :November}
        if students.count == 1
            puts "Now we have #{students.count} student"
        else
            puts "Now we have #{students.count} students"
        end
        name = gets.chomp
    end
    students
end

#print header
def header
    puts "The students of Villains Academy"
    puts "-------------"
end

#print names
def names(students) # takes an array
    students.each do |pupil|
    puts "#{pupil[:name]} (#{pupil[:cohort]} cohort)"
    end
end

#print footer
def footer(students) # takes an array
    puts "Overall, we have #{students.count} great students"
end

student = input_students
header
names(student)
footer(student)
