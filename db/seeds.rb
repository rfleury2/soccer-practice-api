# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def seed_england
	x = 0
	puts "Loading English games"
	CSV.foreach("vendor/raw_data/english_games.csv") do |date, season, home, visitor, ft, hgoal, vgoal, division|
		puts "Loading game #{x} - #{home} vs #{visitor}"
		x = x+1
		Game.find_or_create_by(
			date: Date.parse(date),
			season: season.to_s,
			home_team: Team.find_or_create_by(name: home),
			away_team: Team.find_or_create_by(name: visitor),
			home_goals: hgoal.to_i,
			away_goals: vgoal.to_i,
			division: division,
			league: 'England'
		)
	end
end

def seed_italy
	x = 0
	puts "Loading Italian games"
	CSV.foreach("vendor/raw_data/italycalcio.csv") do |date, season, home, visitor, ft, hgoal, vgoal, division|
		puts "Loading game #{x} - #{home} vs #{visitor} - #{date}"
		x = x+1
		Game.find_or_create_by(
			date: Date.parse(date),
			season: season.to_s,
			home_team: Team.find_or_create_by(name: home),
			away_team: Team.find_or_create_by(name: visitor),
			home_goals: hgoal.to_i,
			away_goals: vgoal.to_i,
			division: division,
			league: 'Italy'
		)
	end
end

def seed_holland
	x = 0
	puts "Loading Dutch games"
	CSV.foreach("vendor/raw_data/holland1.csv") do |date, season, home, visitor, ft, hgoal, vgoal, division|
		puts "Loading game #{x} - #{home} vs #{visitor} - #{date}"
		x = x+1
		Game.find_or_create_by(
			date: Date.parse(date),
			season: season.to_s,
			home_team: Team.find_or_create_by(name: home),
			away_team: Team.find_or_create_by(name: visitor),
			home_goals: hgoal.to_i,
			away_goals: vgoal.to_i,
			division: division,
			league: 'Holland'
		)
	end
end

def seed_spain
	x = 0
	puts "Loading Spanish games"
	CSV.foreach("vendor/raw_data/spainliga.csv") do |date, season, home, visitor, ft, hgoal, vgoal, division|
		puts "Loading game #{x} - #{home} vs #{visitor} - #{date}"
		x = x+1
		Game.find_or_create_by(
			date: Date.parse(date),
			season: season.to_s,
			home_team: Team.find_or_create_by(name: home),
			away_team: Team.find_or_create_by(name: visitor),
			home_goals: hgoal.to_i,
			away_goals: vgoal.to_i,
			division: division,
			league: 'Spain'
		)
	end
end

def seed_germany
	x = 0
	puts "Loading German games"
	CSV.foreach("vendor/raw_data/bundesliga.csv") do |date, season, home, visitor, ft, hgoal, vgoal, division|
		puts "Loading game #{x} - #{home} vs #{visitor} - #{date}"
		x = x+1
		Game.find_or_create_by(
			date: Date.parse(date),
			season: season.to_s,
			home_team: Team.find_or_create_by(name: home),
			away_team: Team.find_or_create_by(name: visitor),
			home_goals: hgoal.to_i,
			away_goals: vgoal.to_i,
			division: division,
			league: 'Germany'
		)
	end
end

seed_england 
seed_italy
seed_holland
seed_spain
seed_germany
