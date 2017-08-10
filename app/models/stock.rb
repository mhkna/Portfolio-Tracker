class Stock < ApplicationRecord
	has_many :positions
	has_many :portfolios, through: :positions

	validates_presence_of :name, :symbol
end
