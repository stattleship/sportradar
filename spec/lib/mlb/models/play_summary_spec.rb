require 'spec_helper'

module Sportradar
  module Nfl
    module Models
      RSpec.describe PlaySummary do
        context 'with a play' do
          it 'has a id' do
            expect(nfl_play_summary.id).to eq('4c578712-3589-416c-90aa-76064830fa7e')
          end

          it 'has a game_id' do
            expect(nfl_play_summary.game_id).to eq('568d84eb-874f-49f4-b77d-dc23412fb87c')
          end

          it 'has a clock' do
            expect(nfl_play_summary.clock).to eq('15:00')
          end

          it 'has a controller' do
            expect(nfl_play_summary.controller).to eq('ARI')
          end

          it 'has a direction' do
            expect(nfl_play_summary.direction).to eq('Left')
          end

          it 'is official' do
            expect(nfl_play_summary).to be_official
          end

          it 'has a quarter_number' do
            expect(nfl_play_summary.quarter_number).to eq(1)
          end

          it 'has a summary' do
            expect(nfl_play_summary.summary).to eq('31-D.Johnson to ARI 27 for 2 yards (97-A.Branch).')
          end

          it 'has a type' do
            expect(nfl_play_summary.type).to eq('rush')
          end

          it 'has an update timestamp' do
            expect(nfl_play_summary.updated_at).to eq('2016-09-12T00:37:14+00:00')
          end

          it 'has advancements' do
            expect(nfl_play_summary).to have_advancements
          end

          it 'builds advancements' do
            nfl_play_summary.advancements.each do |advancement|
              puts advancement.to_s
            end
          end

          it 'builds player stats' do
            nfl_play_summary.player_stats.each do |player_stat|
              puts player_stat.to_s
            end
          end
        end

        context 'with a scoring play' do
          it 'has a controller team' do
            expect(nfl_scoring_play_summary.controller).to eq('DEN')
          end

          it 'has a scoring team' do
            expect(nfl_scoring_play_summary.scoring_team).to eq('DEN')
          end

          it 'has a points_scored' do
            expect(nfl_scoring_play_summary.points_scored).to eq(1)
          end

          it 'has a score_type' do
            expect(nfl_scoring_play_summary.score_type).to eq('extrapoint')
          end

          it 'has advancements' do
            expect(nfl_scoring_play_summary).to have_advancements
          end

          it 'builds advancements' do
            nfl_scoring_play_summary.advancements.each do |advancement|
              puts advancement.to_s
            end
          end

          it 'builds player stats' do
            nfl_scoring_play_summary.player_stats.each do |player_stat|
              puts player_stat.to_s
            end
          end
        end

        private

        def nfl_play_summary
          @nfl_play_summary ||= PlaySummary.new(attributes: nfl_play_summary_json)
        end

        def nfl_play_summary_json
          Oj.load(File.read('spec/fixtures/nfl/football_nfl_2016_REG_1_NE_ARI_plays_4c578712-3589-416c-90aa-76064830fa7e.json'))
        end

        def nfl_scoring_play_summary
          @nfl_scoring_play_summary ||= PlaySummary.new(attributes: nfl_play_scoring_play_summary_json)
        end

        def nfl_play_scoring_play_summary_json
          Oj.load(File.read('spec/fixtures/nfl/football_nfl_scoring_play_summary.json'))
        end
      end
    end
  end
end
