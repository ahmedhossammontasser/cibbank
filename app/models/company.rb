# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  company_name           :string(255)
#  company_code           :string(255)
#  Company_account_no     :string(255)
#  Company_account_no_usd :string(255)      default("0")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :Company_account_no, :Company_account_no_usd, :company_code, :company_name
  has_many :users
  has_many :payrolls
  has_many :employees

  validates :company_name, presence: true

  validates :company_code, presence: true, length: { is: 6 } 
  validates_numericality_of :company_code

  validates :Company_account_no, presence: true, length: { is: 10 }
  validates_numericality_of :Company_account_no

  validates :Company_account_no_usd, presence: true, length: { is: 10 }
  validates_numericality_of :Company_account_no_usd


  
  

end
