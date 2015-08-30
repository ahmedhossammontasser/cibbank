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
  attr_accessible :payroll_amount , :payrolls_creation_date,:payrolls_value_day,:company_id , :payrolls_no_employees
  belongs_to :company
  has_many :payroll_employees ,  dependent: :destroy
  has_many :employees, through: :payroll_employees
  accepts_nested_attributes_for :payroll_employees
# validates_associated :payroll_employees

  validates :company_id, presence: true
  validates :payroll_amount, presence: true ,:format => { :with => /^\d+??(?:\.\d{0,3})?$/  } 
 validate :unique_month_year_payroll


  def unique_month_year_payroll
  	ary = Payroll.find_all_by_company_id(company_id).map{ |d| d.payrolls_creation_date.strftime('%m %y') }.uniq 
  	if ary.include?(DateTime.now.to_date.strftime('%m %y'))
  		errors.add(:payroll.id ,"payroll is create for this month")
  	end
  end



end
