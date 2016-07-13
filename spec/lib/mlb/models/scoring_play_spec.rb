require 'spec_helper'

module Sportradar
  module Mlb
    module Models
      RSpec.describe ScoringPlay do
        it 'has a hitter' do
          expect(scoring_play.hitter_id).to eq('8b5827ef-6325-4183-8b40-fe30e50e20cd')
        end

        it 'has a pitcher' do
          expect(scoring_play.pitcher_id).to eq('f83736c4-6587-438f-af93-bb880f0763c5')
        end

        it 'has runners' do
          expect(scoring_play.runners).to_not be_blank
        end

        it 'has an outcome and scoring info' do
          expect(scoring_play.hitter_outcome).to eq('aS')
          expect(scoring_play.scoring_method).to eq('Single')
          expect(scoring_play.scoring_how).to eq('pitch')
          expect(scoring_play.scoring_type).to eq('aS')
        end

        it 'has inning info' do
          expect(scoring_play.inning).to eq(4)
          expect(scoring_play.inning_half).to eq('T')
          expect(scoring_play.time_code).to eq('T4')
          expect(scoring_play.inning_label).to eq('Top of 4th')
        end

        it 'has points' do
          expect(scoring_play.points).to eq(1)
        end

        it 'was a pitch' do
          expect(scoring_play).to be_pitch
        end

        it 'has scoring players' do
          expect(scoring_play.scoring_players.count).to eq(3)
        end

        private

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
