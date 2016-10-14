require 'spec_helper'

module Sportradar
  module Nba
    module Parsers
      RSpec.describe BoxscoreParser do
        it 'has a game' do
          expect(nba_boxscore.game_id).to eq('fd18d602-96b9-4a11-b898-59570219f4c8')
        end

        it 'has a clock' do
          expect(nba_boxscore.clock).to eq('00:00')
          expect(nba_boxscore.clock_secs).to eq(0)
        end

        it 'has a quarter' do
          expect(nba_boxscore.quarter).to eq(4)
        end

        it 'has a times_tied' do
          expect(nba_boxscore.times_tied).to eq(1)
        end

        it 'has a lead_changes' do
          expect(nba_boxscore.lead_changes).to eq(3)
        end

        it 'has a status' do
          expect(nba_boxscore.status).to eq('closed')
        end

        it 'has a scheduled_at' do
          expect(nba_boxscore.scheduled_at).to eq('2016-10-04T23:00:00+00:00'.to_datetime)
        end

        it 'has a started_at' do
          expect(nba_boxscore.started_at).to eq('2016-10-04T23:00:00+00:00'.to_datetime)
        end

        it 'has a ended_at' do
          expect(nba_boxscore.ended_at).to eq('2016-10-05T01:13:00+00:00'.to_datetime)
        end

        it 'has a completed' do
          expect(nba_boxscore.completed).to eq('2016-10-05T01:13:00+00:00'.to_datetime)
        end

        it 'has a home_team' do
          expect(nba_boxscore.home_team_id).to eq('583ec87d-fb46-11e1-82cb-f4ce4684ea4c')
        end

        it 'has home team scoring' do
          scoring = nba_boxscore.home_team_scoring

          expect(scoring[:points]).to eq 92
          expect(scoring[:points_quarter_1]).to eq 15
          expect(scoring[:points_quarter_2]).to eq 16
          expect(scoring[:points_quarter_3]).to eq 30
          expect(scoring[:points_quarter_4]).to eq 31
          expect(scoring[:points_overtime]).to eq 0
        end

        it 'has an away_team' do
          expect(nba_boxscore.away_team_id).to eq('583eccfa-fb46-11e1-82cb-f4ce4684ea4c')
        end

        it 'has away team scoring' do
          scoring = nba_boxscore.away_team_scoring

          expect(scoring[:points]).to eq 89
          expect(scoring[:points_quarter_1]).to eq 25
          expect(scoring[:points_quarter_2]).to eq 18
          expect(scoring[:points_quarter_3]).to eq 20
          expect(scoring[:points_quarter_4]).to eq 26
          expect(scoring[:points_overtime]).to eq 0
        end

        it 'has a duration_secs' do
          expect(nba_boxscore.duration).to eq('2:13')
          expect(nba_boxscore.duration_secs).to eq(7980)
        end

        it 'has clock_attributes' do
          clock_attributes = nba_boxscore.clock_attributes

          expect(clock_attributes[:clock]).to eq('00:00')
          expect(clock_attributes[:clock_secs]).to eq(0)
          expect(clock_attributes[:duration]).to eq(7980)
          expect(clock_attributes[:ended_at]).to eq('2016-10-05T01:13:00+00:00'.to_datetime)
          expect(clock_attributes[:status]).to eq('closed')
        end

        it 'has a attendance' do
          expect(nba_boxscore.attendance).to eq(4532)
        end

        it 'has a home_team_outcome' do
          expect(nba_boxscore.home_team_outcome).to eq('win')
        end

        it 'has a home_team_score' do
          expect(nba_boxscore.home_team_score).to eq(92)
        end

        it 'has a away_team_outcome' do
          expect(nba_boxscore.away_team_outcome).to eq('loss')
        end

        it 'has a away_team_score' do
          expect(nba_boxscore.away_team_score).to eq(89)
        end

        it 'has game_scoring_attributes' do
          game_scoring_attributes = nba_boxscore.game_scoring_attributes

          expect(game_scoring_attributes[:attendance]).to eq(4532)
          expect(game_scoring_attributes[:home_team_outcome]).to eq('win')
          expect(game_scoring_attributes[:home_team_score]).to eq(92)
          expect(game_scoring_attributes[:away_team_outcome]).to eq('loss')
          expect(game_scoring_attributes[:away_team_score]).to eq(89)
        end

        it 'has game_attributes' do
          game_attributes = nba_boxscore.game_attributes

          expect(game_attributes[:clock]).to eq('00:00')
          expect(game_attributes[:clock_secs]).to eq(0)
          expect(game_attributes[:duration]).to eq(7980)
          expect(game_attributes[:ended_at]).to eq('2016-10-05T01:13:00+00:00'.to_datetime)
          expect(game_attributes[:status]).to eq('closed')
          expect(game_attributes[:attendance]).to eq(4532)
          expect(game_attributes[:home_team_outcome]).to eq('win')
          expect(game_attributes[:home_team_score]).to eq(92)
          expect(game_attributes[:away_team_outcome]).to eq('loss')
          expect(game_attributes[:away_team_score]).to eq(89)
        end

        private

        def nba_boxscore
          BoxscoreParser.new(json: nba_game_boxscore_json)
        end

        def nba_game_boxscore_json
          Oj.load(File.read('spec/fixtures/nba/basketball_nba_games_fd18d602-96b9-4a11-b898-59570219f4c8_boxscore.json'))
        end
      end
    end
  end
end
