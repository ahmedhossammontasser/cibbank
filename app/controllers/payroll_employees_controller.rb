class PayrollEmployeesController < ApplicationController
  before_filter :set_payroll_employee, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  
  respond_to :html

  def index
    @payroll_employees = PayrollEmployee.all
    respond_with(@payroll_employees)
  end

  def show
    respond_with(@payroll_employee)
  end

  def new
    @payroll_employee = PayrollEmployee.new
    respond_with(@payroll_employee)
  end

  def edit
  end

  def create
    @payroll_employee = PayrollEmployee.new(params[:payroll_employee])
    @payroll_employee.save
    respond_with(@payroll_employee)
  end

  def update
    @payroll_employee.update_attributes(params[:payroll_employee])
    respond_with(@payroll_employee)
  end

  def destroy
    @payroll_employee.destroy
    respond_with(@payroll_employee)
  end

  private
    def set_payroll_employee
      @payroll_employee = PayrollEmployee.find(params[:id])
    end
end
