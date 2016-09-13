require 'spec_helper'

module Sportradar
  module Nfl
    module Parsers
      RSpec.describe PlayByPlayParser do
        it 'has a game' do
          expect(nfl_play_by_play.game_id).to eq('568d84eb-874f-49f4-b77d-dc23412fb87c')
        end

        it 'has quarters' do
          puts nfl_play_by_play.quarters
        end

        it 'has pbp' do
          puts nfl_play_by_play.quarters.first.pbp
        end

        it 'has drives' do
          puts nfl_play_by_play.drives
        end

        it 'has drives number_of_plays' do
          puts nfl_play_by_play.quarters.first.drives.first.number_of_plays
        end

        it 'has plays' do
          puts nfl_play_by_play.plays
        end

        it 'has events' do
          puts nfl_play_by_play.events
        end

        private

        def nfl_play_by_play
          @nfl_play_by_play ||= PlayByPlayParser.new(game_play_by_play: nfl_game_play_by_play)
        end

        def nfl_game_play_by_play
          @nfl_game_play_by_play ||= nfl_game_play_by_play_json
        end

        def nfl_game_play_by_play_json
          Oj.load(File.read('spec/fixtures/nfl/football_nfl_2016_reg_1_NE_ARI_pbp.json'))
        end
      end
    end
  end
end
