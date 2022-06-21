class Bootcamp
  def initialize(name,slogan,student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new
    @students = Array.new
    @grades = Hash.new {|h,k| h[k] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end
  
  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
        @students << student
        return true
    end
    false
  end
  
  def enrolled?(student)
    @students.each do |s|
        if students.include?(student)
            return true
        end
    end
    false
  end

  def student_capacity
    @student_capacity
  end

  def student_to_teacher_ratio
    @students.length/@teachers.length*1.0
  end

  def add_grade(student,grade)
    if self.enrolled?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
  end

   def num_grades(student)
        @grades.each do |k,v|
            if @grades.has_key?(student)
                return @grades[student].length
            end
        end
    end

    def average_grade(student)
        if !enrolled?(student) || @grades[student].length == 0
            return nil 
        end
        @grades.each do |k,v|
            if @grades.has_key?(student)
                return @grades[student].sum/num_grades(student)*1.0
            end
        end
    end

end
