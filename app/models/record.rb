class Record < ActiveRecord::Base
  belongs_to :account
  validates :day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31}, uniqueness: {scope: :account}
end
