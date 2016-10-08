require 'spec_helper'

module Sportradar
  module Nhl
    module Parsers
      RSpec.describe BoxscoreParser do
        it 'has a game' do
          expect(nhl_boxscore.game_id).to eq('48a82e91-12e9-419b-938c-8a3051dd1e21')
        end

        it 'has a clock' do
          expect(nhl_boxscore.clock).to eq('00:00')
          expect(nhl_boxscore.clock_secs).to eq(0)
        end

        it 'has a period' do
          expect(nhl_boxscore.period).to eq(5)
        end

        it 'has a status' do
          expect(nhl_boxscore.status).to eq('closed')
        end

        it 'has a scheduled_at' do
          expect(nhl_boxscore.scheduled_at).to eq('2016-09-26T23:00:00+00:00'.to_datetime)
        end

        it 'has a started_at' do
          expect(nhl_boxscore.started_at).to eq('2016-09-26T23:07:45+00:00'.to_datetime)
        end

        it 'has a ended_at' do
          expect(nhl_boxscore.ended_at).to eq('2016-09-27T01:45:06+00:00'.to_datetime)
        end

        it 'has a completed' do
          expect(nhl_boxscore.completed).to eq('2016-09-27T01:45:06+00:00'.to_datetime)
        end

        it 'has a home_team' do
          expect(nhl_boxscore.home_team_id).to eq('4416ba1a-0f24-11e2-8525-18a905767e44')
        end

        it 'has home team scoring' do
          scoring = nhl_boxscore.home_team_scoring

          expect(scoring[:goals]).to eq 2
          expect(scoring[:goals_period_1]).to eq 0
          expect(scoring[:goals_period_2]).to eq 1
          expect(scoring[:goals_period_3]).to eq 1
          expect(scoring[:goals_overtime]).to eq 0
          expect(scoring[:goals_shootout]).to eq 0
        end

        it 'has a away_team' do
          expect(nhl_boxscore.away_team_id).to eq('44167db4-0f24-11e2-8525-18a905767e44')
        end

        it 'has away team scoring' do
          scoring = nhl_boxscore.away_team_scoring

          expect(scoring[:goals]).to eq 3
          expect(scoring[:goals_period_1]).to eq 0
          expect(scoring[:goals_period_2]).to eq 2
          expect(scoring[:goals_period_3]).to eq 0
          expect(scoring[:goals_overtime]).to eq 0
          expect(scoring[:goals_shootout]).to eq 1
        end

        it 'has a duration_secs' do
          expect(nhl_boxscore.duration).to eq('65:00')
          expect(nhl_boxscore.duration_secs).to eq(3900)
        end

        private

        def nhl_boxscore
          BoxscoreParser.new(json: nhl_game_boxscore_json)
        end

        def nhl_game_boxscore_json
          Oj.load(File.read('spec/fixtures/nhl/hockey_nhl_games_48a82e91-12e9-419b-938c-8a3051dd1e21_boxscore.json'))
        end
      end
    end
  end
end
