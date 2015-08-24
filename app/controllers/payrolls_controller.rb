class PayrollsController < ApplicationController
  before_filter :set_payroll, only: [:show, :edit, :update, :destroy]
  before_filter :payrollparamtaers, only: [:new , :edit , :create ,:update , :show]
  respond_to :html

  def index
    @payrolls = Payroll.all
    respond_with(@payrolls)
  end

  def show
    respond_with(@payroll)
  end

  def new
  
    @payroll = Payroll.new    
    respond_with(@payroll)
  end

  def edit
  end

  def create
    @employes.each do|employe|
    @payrollemploye << PayrollEmployee.new(employee_id: employe.id)
    end  
    event = params[:payroll]
    date = Date.new event["payrolls_value_day(1i)"].to_i, event["payrolls_value_day(2i)"].to_i, event["payrolls_value_day(3i)"].to_i
    @payroll = Payroll.new(payroll_amount:0 ,:payrolls_creation_date => DateTime.now ,:payrolls_value_day=>date.to_time ,:company_id=> current_user.company_id,payrolls_no_employees:@payrollemploye.count)
    @payroll.save
    @totalamount = 0.0
    @payrollemploye.each_with_index do|employe , i |
      @amount = params[:payroll][:"amount#{i}"][:amount]
      employe.update_attributes(payroll_id:@payroll.id,:amount=>@amount)
      @totalamount = @totalamount + @amount.to_f
      employe.save
    end

    @payroll.update_attributes(payroll_amount: @totalamount)
    respond_with(@payroll)
  end

  def update
   @employes.each do|employe|
      @payrollemploye =  PayrollEmployee.find_all_by_payroll_id(params[:id])
    end  
    event = params[:payroll]
    date = Date.new event["payrolls_value_day(1i)"].to_i, event["payrolls_value_day(2i)"].to_i, event["payrolls_value_day(3i)"].to_i
     Payroll.find(params[:id]).update_attributes(:payrolls_value_day=>date.to_time ,:company_id=> current_user.company_id,payrolls_no_employees:@payrollemploye.count)
    @totalamount = 0
    @payrollemploye.each_with_index do|employe , i |
      @amount = params[:payroll][:"amount#{i}"][:amount]
      employe.update_attributes(payroll_id:params[:id],:amount=>@amount)
      @totalamount = @totalamount + @amount.to_f
      employe.save
    end
     Payroll.find(params[:id]).update_attributes(payroll_amount: @totalamount)

    @payroll = Payroll.find(params[:id])

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
 
    def payrollparamtaers
     @companyob =Company.find_by_id(current_user.company_id) 
     @payrolls = Payroll.find(:all, :conditions => {:company_id => current_user.company_id}) 
     @ary = Payroll.find_all_by_company_id(current_user.company_id).map{ |d| d.payrolls_creation_date.strftime('%m %y') }.uniq 
     @payrollemploye = []
     @employes = Employee.find(:all, :conditions => {:company_id => current_user.company_id},:order => "employee_name asc")

    end
end
