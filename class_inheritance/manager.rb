require_relative 'employee'

class Manager < Employee
  attr_reader :employee

  def initialize(name, title, salary, boss=nil)
    super
    @employee = []
  end

  def add_employee(name)
    @employee << name
  end

  def bonus(multiplier)
    bonus = 0
    queue = [self]

    until queue.empty?
      worker = queue.shift
      if worker.is_a?(Manager)
        queue += worker.employee
      end
      bonus += worker.salary * multiplier
    end
    bonus -= self.salary * multiplier
    bonus
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)