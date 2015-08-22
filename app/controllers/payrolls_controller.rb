class PayrollsController < ApplicationController
  before_filter :set_payroll, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payrolls = Payroll.all
    respond_with(@payrolls)
  end

  def show
    respond_with(@payroll)
  end

  def new
     @companyob =Company.find_by_id(current_user.company_id) 
     @payrolls = Payroll.find(:all, :conditions => {:company_id => current_user.company_id}) 
     @ary = Payroll.find_all_by_company_id(current_user.company_id).map{ |d| d.payrolls_creation_date.strftime('%m %y') }.uniq 
     @employes = Employee.find(:all, :conditions => {:company_id => current_user.company_id},:order => "employee_name asc")
     @payroll = Payroll.new
    
     @payrollemploye = []
     @employes.each do|employe|
     @payrollemploye << PayrollEmployee.new(employee_id: employe.id)
    end  
    respond_with(@payroll)
  end

  def edit
  end

  def create
    event = params[:payroll]
    date = Date.new event["payrolls_value_day(1i)"].to_i, event["payrolls_value_day(2i)"].to_i, event["payrolls_value_day(3i)"].to_i
    @payroll = Payroll.new(payroll_amount:0 ,:payrolls_creation_date => DateTime.now ,:payrolls_value_day=>date.to_time ,:company_id=> current_user.company_id,payrolls_no_employees:0)
    @payroll.save

     @employes = Employee.find(:all, :conditions => {:company_id => current_user.company_id},:order => "employee_name asc")
     @payrollemploye = []
     @employes.each do|employe|
     @payrollemploye << PayrollEmployee.new(employee_id: employe.id)
   end
      @payrollemploye.each_with_index do|employe , i |
      @amount = params[:payroll][:"amount#{0}"][:amount]
      employe.update_attributes(payroll_id:@payroll.id,:amount=>@amount)
      @index = @index+1      
      employe.save
    end
    respond_with(@payroll)
  end

  def update
    @payroll.update_attributes(params[:payroll])
    respond_with(@payroll)
  end

  def destroy
    @payroll.destroy
    respond_with(@payroll)
  end

  private
    def set_payroll
      @payroll = Payroll.find(params[:id])
    end
end
