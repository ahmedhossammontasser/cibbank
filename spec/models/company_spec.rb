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

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
