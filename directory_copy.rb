def menu
    students = []
    loop do
        # 1. print the menu
        puts "Please select one of the following:"
        puts "1. Input the students"
        puts "2. Print the students"
        puts "9. Exit program"
        
        # 2. read the input and save it into a variable
        user_input = gets.chomp

        # 3. Do what the user asked
        case user_input
        when "1"
            students = input_students
            
        when "2"
            header
            names(students)
            footer(students)
        when "9"
            break
        else
            puts "Please enter from the selection"
        end
        # 4. repeat from step 1
    end
end


def input_students
    puts "Please enter the names of the students and their cohort"
    puts "To finish, just type quit"
    # create an empty array
    students = []
    # name_and_cohort = []
    # name = name_and_cohort[0].capitalize
    # cohort = name_and_cohort[1].strip.capitalize.to_sym
    name_and_cohort = gets.chomp.split(",")
    
    while name_and_cohort[0] != "Quit"
        
        while name_and_cohort.empty?
            puts "Please type name and cohort separated by a comma"
            name_and_cohort = gets.chomp.split(",")
        end
        
        break if name_and_cohort[0] == "Quit"

        if !name_and_cohort.empty? && name_and_cohort[0] != "Quit"
            name = name_and_cohort[0].strip.capitalize
            cohort = name_and_cohort[1].strip.capitalize.to_sym
        end
        
        
        if cohort != :November && cohort[0] == "N"
            cohort = :November
        elsif cohort != :December && cohort[0] == "D"
            cohort = :December
        else 
            cohort = :TBC
        end
        students << {name: name, cohort: cohort, hobby: :skiing, food: :upma}
        puts "#{students}"
        
        if students.count == 1
            puts "Now we have #{students.count} student"
        else
            puts "Now we have #{students.count} students"
        end

        name_and_cohort = gets.chomp.split(",")
    end
    students
end

#print header
def header
    puts "The students of Villains Academy".center(80,'.')
    puts "-------------".center(80)
end

#print names
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

menu