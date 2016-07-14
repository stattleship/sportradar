require 'spec_helper'

module Sportradar
  module Mlb
    module Parsers
      RSpec.describe PlayByPlayParser do
        it 'has a game' do
          expect(mlb_play_by_play.game_id).to eq('bca04056-a48f-489e-8244-0dd85481b730')
        end

        it 'parses at_bats' do
          mlb_play_by_play.at_bats
        end

        it 'parses pitches' do
          puts mlb_play_by_play.pitches
          puts mlb_play_by_play.pitches.count
        end

        private

        def mlb_play_by_play
          PlayByPlayParser.new(game_play_by_play: mlb_game_play_by_play)
        end

        def mlb_game_play_by_play
          @mlb_game_play_by_play ||= mlb_game_play_by_play_json['game']
        end

        def mlb_game_play_by_play_json
          Oj.load(File.read('spec/fixtures/mlb/baseball_mlb_games_d00abb72-f605-4dbd-8959-c70d1d7fd7c2_pbp.json'))
        end
      end
    end
  end
end
