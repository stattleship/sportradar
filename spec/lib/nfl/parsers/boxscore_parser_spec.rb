require 'spec_helper'

module Sportradar
  module Nfl
    module Parsers
      RSpec.describe BoxscoreParser do
        it 'has a game' do
          expect(nfl_boxscore.game_id).to eq('acbb3001-6bb6-41ce-9e91-942abd284e4c')
        end

        it 'has a clock' do
          expect(nfl_boxscore.clock).to eq('1:21')
          expect(nfl_boxscore.clock_secs).to eq(81)
        end

        it 'has a quarter' do
          expect(nfl_boxscore.quarter).to eq(4)
        end

        it 'has a completed' do
          expect(nfl_boxscore.completed).to eq('2015-09-11T03:40:49+00:00'.to_datetime)
        end

        it 'has a home_team' do
          expect(nfl_boxscore.home_team_id).to eq('NE')
        end

        it 'has home team scoring' do
          scoring = nfl_boxscore.home_team_scoring

          expect(scoring[:points]).to eq 28
          expect(scoring[:remaining_challenges]).to eq 1
          expect(scoring[:remaining_timeouts]).to eq 2
          expect(scoring[:points_quarter_1]).to eq 0
          expect(scoring[:points_quarter_2]).to eq 14
          expect(scoring[:points_quarter_3]).to eq 7
          expect(scoring[:points_quarter_4]).to eq 7
          expect(scoring[:points_overtime]).to eq 0
        end

        it 'has a away_team' do
          expect(nfl_boxscore.away_team_id).to eq('PIT')
        end

        it 'has away team scoring' do
          scoring = nfl_boxscore.away_team_scoring

          expect(scoring[:points]).to eq 21
          expect(scoring[:remaining_challenges]).to eq 2
          expect(scoring[:remaining_timeouts]).to eq 2
          expect(scoring[:points_quarter_1]).to eq 0
          expect(scoring[:points_quarter_2]).to eq 3
          expect(scoring[:points_quarter_3]).to eq 8
          expect(scoring[:points_quarter_4]).to eq 10
          expect(scoring[:points_overtime]).to eq 0
        end

        private

        def nfl_boxscore
          BoxscoreParser.new(json: nfl_game_boxscore_json)
        end

        def nfl_game_boxscore_json
          Oj.load(File.read('spec/fixtures/nfl/football_nfl_2015_reg_1_PIT_NE_boxscore.json'))
        end
      end
    end
  end
end
