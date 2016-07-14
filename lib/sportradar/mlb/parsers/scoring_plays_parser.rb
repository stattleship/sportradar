module Sportradar
  module Mlb
    module Parsers
      class ScoringPlaysParser
        def initialize(game_boxscore: {})
          @game_boxscore = game_boxscore['game'] || game_boxscore
        end

        def game_id
          game_boxscore['id']
        end

        def away
          game_boxscore['away'] || {}
        end

        def away_team_id
          away['id']
        end

        def home
          game_boxscore['home'] || {}
        end

        def home_team_id
          home['id']
        end

        def away_events
          away['events'] || []
        end

        def home_events
          home['events'] || []
        end

        def events
          away_events + home_events
        end

        def away_team_plays
          away_events.map do |event|
            build_scoring_play(team_id: away_team_id,
                               event: event)
          end
        end

        def home_team_plays
          home_events.map do |event|
            build_scoring_play(team_id: home_team_id,
                               event: event)
          end
        end

        def all
          away_team_plays + home_team_plays
        end

        def away_team_hitter_ids
          away_team_plays.map(&:hitter_id).
            uniq
        end

        def home_team_hitter_ids
          home_team_plays.map(&:pitcher_id).
            uniq
        end

        def away_team_pitcher_ids
          away_team_plays.map(&:pitcher_id).
            uniq
        end

        def home_team_pitcher_ids
          home_team_plays.map(&:pitcher_id).
            uniq
        end

        def away_team_runner_ids
          away_team_plays.map(&:runner_ids).
            flatten.
            uniq
        end

        def home_team_runner_ids
          home_team_plays.map(&:runner_ids).
            flatten.
            uniq
        end

        def pitcher_ids
          all.map(&:pitcher_id)
        end

        def hitter_ids
          all.map(&:hitter_id)
        end

        def runner_ids
          all.map(&:runner_ids).
            flatten.
            uniq
        end

        def first
          all.
            first
        end

        def last
          all.
            last
        end

        private

        attr_reader :game_boxscore

        def build_scoring_play(team_id:, event:)
          Sportradar::Mlb::Models::ScoringPlay.new(game_id: game_id,
                                                   team_id: team_id,
                                                   event: event)
        end
      end
    end
  end
end
