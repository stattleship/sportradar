require 'spec_helper'

module Sportradar
  module Mlb
    module Parsers
      RSpec.describe PlayByPlayParser do
        it 'has a game' do
          expect(mlb_play_by_play.game_id).to eq('d00abb72-f605-4dbd-8959-c70d1d7fd7c2')
        end

        it 'parses at_bats' do
          puts mlb_play_by_play.at_bats.map(&:to_s)
        end

        it 'summarizes at bats' do
          puts mlb_play_by_play.at_bat_summary
        end

        it 'parses pitches' do
          puts mlb_play_by_play.pitches.map(&:at_bat_strikes)
          puts mlb_play_by_play.pitches.map(&:at_bat_outs)
          puts mlb_play_by_play.pitches.count
        end

        it 'summarizes pitches' do
          puts mlb_play_by_play.pitch_summary
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
