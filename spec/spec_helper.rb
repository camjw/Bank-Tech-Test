# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Console

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

require_relative '../lib/helpers/balance_calculator/error_helper'
require_relative '../lib/helpers/balance_calculator/transaction_helper'
require_relative '../lib/helpers/interface/error_helper'
require_relative '../lib/helpers/printer/output_helper'

# Helper class to make testing helper modules easier
class Helper
  include Helpers::BalanceCalculator::Errors
  include Helpers::BalanceCalculator::Transactions
  include Helpers::Interface::Errors
  include Helpers::Printer::Outputs
end
