require 'spec_helper'

module Sportradar
  module Nba
    module Parsers
      RSpec.describe PlayByPlayParser do
        it 'has a game' do
          expect(nba_play_by_play.game_id).to eq('7577bb94-0302-4bad-bdba-0fb4cc290792')
        end

        it 'parses events' do
          puts nba_play_by_play.events
        end

        it 'parses scoring_plays' do
          puts nba_play_by_play.scoring_plays
        end

        it 'parses stoppages' do
          puts nba_play_by_play.stoppages
        end

        it 'parses fouls' do
          puts nba_play_by_play.fouls
        end

        it 'parses possessions' do
          nba_play_by_play.events.each do |event|
            puts event.possession_team_name if event.possession?
          end
        end

        it 'parses play player stats' do
          nba_play_by_play.events.map do |event|
            event.play_player_stats.each do |p|
              puts p.to_s
            end
          end
        end

        it 'parses scoring play stats' do
          nba_play_by_play.scoring_plays.map do |play|
            puts play.scoring_players.map(&:to_s)
          end
        end

        private

        def nba_play_by_play
          PlayByPlayParser.new(game_play_by_play: nba_game_play_by_play)
        end

        def nba_game_play_by_play
          Oj.load(File.read('spec/fixtures/nba/basketball_nba_games_7577bb94-0302-4bad-bdba-0fb4cc290792_pbp.json'))
        end
      end
    end
  end
end
