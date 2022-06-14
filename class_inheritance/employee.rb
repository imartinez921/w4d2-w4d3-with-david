
class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss

    if @boss != nil
      @boss.add_employee(self)
    end

  end

  def bonus(multiplier)
    return salary * multiplier
  end

end