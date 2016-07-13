require 'spec_helper'

module Sportradar
  module Mlb
    RSpec.describe ScoringPlays do
      it 'parses events' do
        expect(scoring_plays.events).to_not be_blank
      end

      it 'parsers a scoring play' do
        expect(scoring_plays.all.first).to be_a Models::ScoringPlay
      end

      it 'has a game' do
        expect(scoring_plays.game_id).to eq('ce048047-4105-42fa-8140-0da2147d1314')
      end

      it 'has an away team' do
        expect(scoring_plays.away_team_id).to eq('d52d5339-cbdd-43f3-9dfa-a42fd588b9a3')
      end

      it 'has away team playes' do
        expect(scoring_plays.away_team_plays).to_not be_blank
      end

      it 'has a home team' do
        expect(scoring_plays.home_team_id).to eq('25507be1-6a68-4267-bd82-e097d94b359b')
      end

      it 'has home team plays' do
        expect(scoring_plays.home_team_plays).to_not be_blank
      end

      it 'has pitcher_ids' do
        expect(scoring_plays.pitcher_ids).to_not be_blank
      end

      it 'has hitter_ids' do
        expect(scoring_plays.hitter_ids).to_not be_blank
      end

      it 'has runner_ids' do
        expect(scoring_plays.runner_ids).to_not be_blank
      end

      private

      def scoring_plays
        ScoringPlays.new(game_boxscore: mlb_game_boxscore)
      end

      def mlb_game_boxscore
        @mlb_game_boxscore ||= mlb_boxscore_games.first['game']
      end

      def mlb_boxscore_games
        @mlb_boxscore_games ||= mlb_game_boxscores_json['league']['games']
      end

      def mlb_game_boxscores_json
        Oj.load(File.read('spec/fixtures/mlb/baseball_mlb_games_2016_07_06_boxscore.json'))
      end
    end
  end
end
