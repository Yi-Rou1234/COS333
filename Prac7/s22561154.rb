# Define the Employee class
class Employee
    attr_reader :earnings
  
    def initialize(base_salary = 20000.00)
      @earnings = 0.0
      @base_salary = base_salary
      @base_salary_paid = false
    end
  
    def payEmployee
      unless @base_salary_paid
        @earnings += @base_salary
        @base_salary_paid = true
      end
    end
  
    def newMonth
      @base_salary_paid = false
    end
  end
  
  class Manager < Employee
    def initialize(bonus)
      super()
      @bonus = bonus
    end
  
    def payEmployee
      super()
      @earnings += @bonus
    end
  end
  
  class Programmer < Employee
    def initialize(percentage)
      computed_salary = 20000.00 * percentage
      super(computed_salary)
    end
  end
  
  class Team
    def initialize
      @members = []
    end
  
    def addMember(employee)
      raise "Cannot add more than 2 members to the team" if @members.size >= 2
      @members << employee
    end
  
    def payTeam
      @members.each(&:payEmployee)
    end
  
    def newMonth
      @members.each(&:newMonth)
    end
  
    def printEarnings
      @members.each { |member| puts member.earnings }
    end
  end
  
  # Test code
  def prompt(message)2
    print message
    gets.chomp
  end
  
  def main
    teams = [Team.new, Team.new]
  
    manager_bonus = prompt("Enter the manager's bonus: ").to_f
    manager = Manager.new(manager_bonus)
    
    teams.each { |team| team.addMember(manager) }
  
    teams.each_with_index do |team, index|
      percentage = prompt("Enter the programmer's salary % for team #{index + 1}: ").to_f
      programmer = Programmer.new(percentage)
      team.addMember(programmer)
    end
  
    loop do
      continue = prompt("Do you want to pay the teams for another month of work? (y/n): ")
      break if continue.downcase != 'y'
      teams.each(&:payTeam)
      teams.each(&:newMonth)
    end
  
    teams.each_with_index do |team, index|
      puts "Team #{index + 1} earnings:"
      team.printEarnings
    end
  end
  
  main
  