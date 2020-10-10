class StudentsController < ApplicationController
  def index
    render json: Student.all
  end

  def create
    student = Student.new(student_params)

    if student.save
      return render json: student, status: :ok
    end

    render json: student.errors, status: :unprocessable_entity
  end

  private

  def student_params
    params.require(:student).permit(:name, :phone_number)
  end
end
