class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

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

  def show
    render json: @student
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student.messages.delete_all
    @student.destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :phone_number)
  end
end
