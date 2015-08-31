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

require 'spec_helper'

describe Employee do
  pending "add some examples to (or delete) #{__FILE__}"
end
