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

require 'spec_helper'

describe PayrollEmployee do
  pending "add some examples to (or delete) #{__FILE__}"
end
