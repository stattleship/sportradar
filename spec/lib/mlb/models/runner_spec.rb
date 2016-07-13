require 'spec_helper'

module Sportradar
  module Mlb
    module Models
      RSpec.describe Runner do
        it 'has an id' do
          expect(runner.id).to eq('8f6f5bdf-9712-472e-8af5-12d5fb1e52e8')
        end

        it 'has a first_name' do
          expect(runner.first_name).to eq('William')
        end

        it 'has a jersey number' do
          expect(runner.jersey_number).to eq('4')
        end

        it 'has a last_name' do
          expect(runner.last_name).to eq('Myers')
        end

        it 'has a preferred name' do
          expect(runner.preferred_name).to eq('Wil')
        end

        it 'has a starting base' do
          expect(runner.starting_base).to eq(3)
        end

        it 'has a starting base name' do
          expect(runner.starting_base_name).to eq('3rd base')
        end

        it 'has a starting base label' do
          expect(runner.starting_base_label).to eq('3B')
        end

        private

        def runner
          runners.first
        end

        def runners
          scoring_play.runners
        end

        def scoring_play
          scoring_plays.all.first
        end

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
end
