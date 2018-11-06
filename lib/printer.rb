# frozen_string_literal: true

require_relative 'helpers/printer'

# Class to print the bank statements to the console
class Printer
  include Helpers::Printer

  def display_statement(transactions)
    puts STATEMENT_HEADER
    puts parse_transactions(transactions)
  end

  private

  def parse_transactions(transactions)
    prettify_all_transactions(transactions)
  end
end
