class PayrollsController < ApplicationController
  before_filter :set_payroll, only: [ :show , :destroy]
  before_filter :payrollparamtaers, only: [:new ,  :create , :show ,:confirm]
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

  

  def confirm
    @payroll = Payroll.new(payroll_amount:params[:totalamount],payroll_amount_usd:params[:totalamountusd] ,:payrolls_creation_date => DateTime.now ,:payrolls_value_day=>params[:date].to_time ,:company_id=> current_user.company_id,payrolls_no_employees:params[:amounts].count)
    @payroll.save
    @employes = Employee.find_all_by_company_id(current_user.company_id,:order => "employee_name asc") 
    @company = Company.find(current_user.company_id)
@body = 'H'+@company.company_code+@payroll.payrolls_value_day.to_date.strftime('%d%m%y')+@payroll.payrolls_creation_date.to_date.strftime('%d%m%y')+@company.Company_account_no+@company.Company_account_no_usd+"\n" 


    @employes.each_with_index do|employe,i |
      @employee=PayrollEmployee.new(employee_id: employe.id,payroll_id:@payroll.id,:amount=>params[:amounts][i])
      @employee.save
      @amount = PayrollEmployee.find_by_employee_id_and_payroll_id(@employee.employee_id , @payroll.id).amount * 100

       
@body = @body +'D'+employe.employee_branch_code+ employe.employee_account_no+employe.employee_currency_code+@amount.to_i.to_s.rjust(13,'0')+employe.employee_debit_credit+'R' +"\n" 
    end  
     
      UserRequestPassword.send_payroll_info_value_day(current_user).deliver

      UserRequestPassword.send_payroll_info_to_bank(current_user,@body).deliver
    flash[:success] = "Email has been send to CIB Bank "
    redirect_to root_path
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
     @employes = Employee.find_all_by_company_id(current_user.company_id,:order => "employee_name asc")

    end
end
