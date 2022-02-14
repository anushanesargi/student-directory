require 'csv'

@students = []

def menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "MENU".center(80, '.')
    puts "Please select one of the following:"
    puts "1. Input the students"
    puts "2. Print the students"
    puts "3. Save the list to student.csv"
    puts "4. Load the list from student.csv"
    puts "9. Exit program"
end

def show_students
    header
    names(@students)
    footer(@students)
end

def process(selection)
    case selection
    when "1"
        @students = input_students    
    when "2"
        show_students
    when "9"
        puts "Application closed!"
        exit
    when "3"
        puts "Please type the filename you need the students to be saved in."
        filename = STDIN.gets.chomp
        filename = "students.csv" if filename.empty?
        save_students(filename)
    when "4"
        puts "Please type the filename you need the students to be loaded from."
        filename = STDIN.gets.chomp
        if File.exist?(filename)
            load_students(filename)
        else
            load_students("students.csv")
        end
    else
        puts "Please enter from the selection"
    end
end

def input_students
    puts "Please enter the names of the students and their cohort"
    puts "To finish, just type quit"

    name_and_cohort = STDIN.gets.chomp.split(",")
    
    while name_and_cohort[0] != "Quit"
        name_and_cohort = check_input(name_and_cohort)

        break if name_and_cohort[0] == "Quit"

        if !name_and_cohort.empty? && name_and_cohort[0] != "Quit"
            name = name_and_cohort[0].strip.capitalize
            cohort = name_and_cohort[1].strip.capitalize.to_sym
        end
        
        pushing_students(name, typo(cohort))
        student_count(@students)
        name_and_cohort = STDIN.gets.chomp.split(",")
    end

    @students
end

def typo(cohort)
    if cohort == :November || cohort == :December
        cohort
    elsif cohort != :November && cohort[0] == "N"
        cohort = :November
    elsif cohort != :December && cohort[0] == "D"
        cohort = :December
    else 
        cohort = :TBC
    end
end

def student_count(students)
    if students.count == 1
        puts "Now we have #{students.count} student"
    else
        puts "Now we have #{students.count} students"
    end
end

def check_input(name_and_cohort)
    while name_and_cohort.empty?
        puts "Please type name and cohort separated by a comma"
        name_and_cohort = STDIN.gets.chomp.split(",")
    end
    name_and_cohort
end

def header
    puts "The students of Villains Academy".center(80,'.')
    puts "-------------".center(80)
end


def names(students) # takes an array
    puts students
    i = 0
    cohorts = students.map { |student| student[:cohort] }.uniq
    puts cohorts
    while i < cohorts.length
        puts "In the #{cohorts[i]} cohort we have:"
        students.select do |student|
        puts student[:name] if student[:cohort] == cohorts[i]
        end
        i += 1
    end
end

#print footer
def footer(students) # takes an array
    puts "Overall, we have #{students.count} great students"
end
    
def save_students(filename = "students.csv")
    File.open(filename, "w") { |file| save_students_to_file(file) }
    puts "Saved #{@students.count} students to #{filename}"
end

def save_students_to_file(file)
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
end

def load_students(filename = "students.csv")
    CSV.foreach(filename) do |row| 
        name, cohort = row
        pushing_students(name, cohort) 
    end
    puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
    filename = ARGV.first
    filename = "students.csv" if filename.nil?
    if File.exist?(filename)
        load_students(filename)
    else
        puts "Sorry, #{filename} deosn't exist"
        exit
    end
end

def pushing_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
menu