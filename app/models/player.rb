class Player < ApplicationRecord
	belongs_to :team
	Tags = %i[Batsman Bowler All-Rounder captain Vice-Captain Wicket-Keeper]
end
