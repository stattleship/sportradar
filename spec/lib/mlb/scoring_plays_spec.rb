require 'spec_helper'

module Sportradar
  module Mlb
    RSpec.describe ScoringPlays do
      it 'does something useful' do
        puts scoring_plays.events
      end

      it 'does something useful' do
        puts scoring_plays.events.first
      end

      it 'does something useful' do
        puts scoring_plays.all.first.hitter_id
      end

      it 'does something useful' do
        puts scoring_plays.all.first.runners.first.last_name
      end

      it 'does something useful' do
        puts scoring_plays.game_id
      end

      it 'does something useful' do
        puts scoring_plays.away_team_id
      end

      it 'does something useful' do
        puts scoring_plays.home_team_id
      end

      it 'does something useful' do
        scoring_plays.all.each do |sp|
          puts sp.scoring_method
          puts sp.time_code
        end
      end

      private

      def scoring_plays
        ScoringPlays.new(game_boxscore: mlb_game_boxscore)
      end

      def mlb_game_boxscore
        @mlb_game_boxscore ||= mlb_boxscore_games.sample['game']
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
