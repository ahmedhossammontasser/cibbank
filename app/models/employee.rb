# == Schema Information
#
# Table name: employees
#
#  id                     :integer          not null, primary key
#  employee_name          :string(255)
#  employee_branch_code   :string(255)
#  employee_account_no    :string(255)
#  employee_currency_code :string(255)
#  employee_debit_credit  :string(255)      default("C")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#

class Employee < ActiveRecord::Base
  attr_accessible  :employee_account_no, :employee_branch_code, :employee_currency_code, :employee_debit_credit, :employee_name ,:company_id
  belongs_to :company
  has_many :payroll_employees
  has_many :payrolls, through: :payroll_employees


  validates :company_id, presence: true

  validates :employee_branch_code, presence: true, length: { is: 3 } 
  validates_numericality_of :employee_branch_code

  validates :employee_account_no, presence: true, length: { is: 10 }
  validates_numericality_of :employee_account_no

  validates :employee_currency_code, presence: true, length: { is: 3 }
  validates_inclusion_of :employee_currency_code, :in => %w( EGP USD )

  validates :employee_debit_credit, presence: true, length: { is: 1 }
  validates_inclusion_of :employee_debit_credit, :in => %w( C D )
  
  


end
