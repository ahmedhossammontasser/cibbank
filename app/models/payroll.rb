# == Schema Information
#
# Table name: payrolls
#
#  id                     :integer          not null, primary key
#  payroll_amount         :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  payrolls_creation_date :datetime
#  payrolls_value_day     :datetime
#  payrolls_no_employees  :integer
#  company_id             :integer
#

class Payroll < ActiveRecord::Base
  attr_accessible :payroll_amount ,:employee , :payrolls_value_day
  belongs_to :company
  has_many :payroll_employees
  has_many :employees, through: :payroll_employees

  validates :company_id, presence: true

  validates :payroll_amount, presence: true ,:format => { :with => /^\d+??(?:\.\d{0,2})?$/  }
  validate :unique_month_year_payroll

  def unique_month_year_payroll
  	ary = PayrollEmployee.all.map { |d| d.created_at.strftime('%m %y') }.uniq 
  	if ary.include?(DateTime.now.to_date.strftime('%m %y'))
  		errors.add(:employee_id,"payroll is create for this month")
  	end
  end



end
