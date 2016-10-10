require 'spec_helper'

module Sportradar
  module Nhl
    module Parsers
      RSpec.describe PlayByPlayParser do
        it 'has a game' do
          expect(nhl_play_by_play.game_id).to eq('48302533-5b8e-457e-a10e-a43cb0586667')
        end

        it 'parses events' do
          puts nhl_play_by_play.events
        end

        it 'parses penalties' do
          puts nhl_play_by_play.penalties
        end

        it 'parses plays' do
          puts nhl_play_by_play.plays
        end

        it 'parses scoring_plays' do
          puts nhl_play_by_play.scoring_plays
        end

        it 'parses stoppages' do
          puts nhl_play_by_play.stoppages
        end

        it 'parses play stats' do
          nhl_play_by_play.plays.map do |play|
            puts play.play_player_stats.map(&:to_s)
          end
        end

        it 'parses scoring play stats' do
          nhl_play_by_play.scoring_plays.map do |play|
            puts play.play_player_stats.map(&:to_s)
          end
        end

        private

        def nhl_play_by_play
          PlayByPlayParser.new(game_play_by_play: nhl_game_play_by_play)
        end

        def nhl_game_play_by_play
          Oj.load(File.read('spec/fixtures/nhl/hockey_nhl_48302533-5b8e-457e-a10e-a43cb0586667_pbp.json'))
        end
      end
    end
  end
end
