class SearchResultsFacade

  def initialize(criteria)
    @criteria = criteria
  end

  def students
    student_results.map do |student_data|
      Student.new(student_data)
    end
  end

  def total_students
    "#{students.count} Students"
  end

  private

  def service
    @_service ||= HogwartsService.new
  end

  def student_results
    @_student_results ||= service.get_students(@criteria)
  end

end
