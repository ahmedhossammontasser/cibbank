# == Schema Information
#
# Table name: payroll_employees
#
#  id          :integer          not null, primary key
#  amount      :float            default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#  payroll_id  :integer
#

class PayrollEmployee < ActiveRecord::Base
 
  attr_accessible :amount ,:payroll_id,:employee_id
    belongs_to :payroll
    belongs_to :employee

  validates :employee_id, presence: true
  validates :payroll_id, presence: true


  validates :amount, presence: true ,:format => { :with => /^\d+??(?:\.\d{0,2})?$/  }


end
