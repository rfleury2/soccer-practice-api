require 'rails_helper'

RSpec.describe Game, type: :model do
	it { should belong_to(:home_team).class_name('Team') }
	it { should belong_to(:away_team).class_name('Team') }

	it { should validate_presence_of(:date) }
	it { should validate_presence_of(:season) }
	it { should validate_presence_of(:home_team) }
	it { should validate_presence_of(:away_team) }
	it { should validate_presence_of(:season) }
	it { should validate_presence_of(:division) }
	it { should validate_presence_of(:league) }

	describe "calculates game results" do
		let(:home_win) { FactoryGirl.build(:game, home_goals: 1, away_goals: 0) }
		let(:draw) { FactoryGirl.build(:game, home_goals: 2, away_goals: 2) }
		let(:home_loss) { FactoryGirl.build(:game, home_goals: 0, away_goals: 1) }

		it "for a home win returns 'W'" do
			expect(home_win.result).to eq "W"
		end

		it "for a draw returns 'D'" do
			expect(draw.result).to eq "D"
		end

		it "for a home loss returns 'L'" do
			expect(home_loss.result).to eq "L"
		end
	end
end
