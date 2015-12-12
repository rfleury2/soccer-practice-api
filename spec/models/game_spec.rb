require 'rails_helper'

RSpec.describe Game, type: :model do
	it { should belong_to(:home_team).class_name('Team') }
	it { should belong_to(:away_team).class_name('Team') }
	it { should belong_to(:season) }
	it { should belong_to(:league) }

	# TODO: Delegate spec

	it { should validate_presence_of(:date) }
	it { should validate_presence_of(:home_team) }
	it { should validate_presence_of(:away_team) }
	it { should validate_presence_of(:home_goals) }
	it { should validate_presence_of(:away_goals) }
	it { should validate_presence_of(:season) }

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

	describe "league scoping" do
		# TODO: Reset this
		let(:english_league) { FactoryGirl.create(:league, :english) }
		let(:spanish_league) { FactoryGirl.create(:league, :spanish) }
		let(:italian_league) { FactoryGirl.create(:league, :italian) }
		let(:dutch_league) { FactoryGirl.create(:league, :dutch) }
		let(:german_league) { FactoryGirl.create(:league, :german) }

		let!(:english_game) { FactoryGirl.create(:game, league: english_league) }
		let!(:english_game_2) { FactoryGirl.create(:game, league: english_league) }
		let!(:spanish_game) { FactoryGirl.create(:game, league: spanish_league) }
		let!(:spanish_game_2) { FactoryGirl.create(:game, league: spanish_league) }
		let!(:italian_game) { FactoryGirl.create(:game, league: italian_league) }
		let!(:italian_game_2) { FactoryGirl.create(:game, league: italian_league) }
		let!(:dutch_game) { FactoryGirl.create(:game, league: dutch_league) }
		let!(:dutch_game_2) { FactoryGirl.create(:game, league: dutch_league) }
		let!(:german_game) { FactoryGirl.create(:game, league: german_league) }
		let!(:german_game_2) { FactoryGirl.create(:game, league: german_league) }

		scenario "english returns only english games" do
			expect(Game.league('england')).to eq [english_game, english_game_2] 
		end

		scenario "spanish returns only spanish games" do
			expect(Game.league('spain')).to eq [spanish_game, spanish_game_2] 
		end

		scenario "italian returns only italian games" do
			expect(Game.league('italy')).to eq [italian_game, italian_game_2] 
		end

		scenario "dutch returns only dutch games" do
			expect(Game.league('holland')).to eq [dutch_game, dutch_game_2] 
		end

		scenario ".german returns only german games" do
			expect(Game.league('germany')).to eq [german_game, german_game_2] 
		end
	end

	describe "division scoping" do
		let!(:top_flight) { FactoryGirl.create(:game) }
		let!(:top_flight_2) { FactoryGirl.create(:game) }
		let!(:game_1) { FactoryGirl.create(:game, :second_division) }
		let!(:game_2) { FactoryGirl.create(:game, :second_division) }
		let!(:game_3) { FactoryGirl.create(:game, :second_division) }

		scenario "top flight" do
			expect(Game.top_flight).to eq [top_flight, top_flight_2] 
		end
	end
end
