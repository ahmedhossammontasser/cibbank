class EmployeesController < ApplicationController
  before_filter :set_employee, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  respond_to :html

  def index
    @employees = Employee.find_all_by_company_id(current_user.company_id,:order => "employee_name asc")
    respond_with(@employees)
  end

  def show
    respond_with(@employee)
  end

  def new
    @employee = Employee.new
    respond_with(@employee)
  end

  def edit
  end

  def create
    @employee = Employee.new(params[:employee])
    @employee.company_id = current_user.company_id
    @employee.save
    respond_with(@employee)
  end

  def update
    @employee.update_attributes(params[:employee])
    respond_with(@employee)
  end

  def destroy
    @employee.destroy
    respond_with(@employee)
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end
end
