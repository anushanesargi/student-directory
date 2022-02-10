# an array of students
student =[
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

#print header
def header
    puts "The students of Villains Academy"
    puts "-------------"
end

#print names
def names(students) # takes an array
    students.each do |pupil|
    puts pupil
    end
end

#print footer
def footer(students) # takes an array
    puts "Overall, we have #{students.count} great students"
end

header
names(student)
footer(student)
