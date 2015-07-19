class Account < ActiveRecord::Base
	has_many :account_incomes, dependent: :destroy
	has_many :account_outcomes, dependent: :destroy
	has_many :records, dependent: :destroy

	validates :month, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }, uniqueness: {scope: :year}
	validates :year, numericality: { greater_than_or_equal_to: 2000 }
end