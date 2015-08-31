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
#  payroll_amount_usd     :float
#

require 'spec_helper'

describe Payroll do
  pending "add some examples to (or delete) #{__FILE__}"
end
