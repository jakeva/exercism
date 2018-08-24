class School
  def initialize
    @students = {}
  end
  
  def students(grade)
    @students[grade]&.sort || []
  end
  
  def add(name, grade)
    if @students[grade]
      @students[grade] << name
    else
      @students[grade] = [name]
    end
  end
  
  def students_by_grade
    res = []
    for key in @students.keys.sort do
      res << {grade: key, students: @students[key].sort}
    end
    res
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
