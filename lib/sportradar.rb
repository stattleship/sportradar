require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'active_support/inflector'

require 'addressable/uri'
require 'addressable/template'

require 'dotenv'
require 'fileutils'
require 'net/https'
require 'oj'

require 'sportradar/version'

require 'sportradar/client/api_request'
require 'sportradar/client/daily_api_request'
require 'sportradar/client/client'
require 'sportradar/client/configuration'

require 'sportradar/feeds/league_schedule'
require 'sportradar/feeds/league_hierarchy'
require 'sportradar/feeds/team_statistics'

require 'sportradar/mlb/models/at_bat'
require 'sportradar/mlb/models/pitch'
require 'sportradar/mlb/models/pitch_outcome'
require 'sportradar/mlb/models/pitch_type'
require 'sportradar/mlb/models/runner'
require 'sportradar/mlb/models/scoring_play'

require 'sportradar/mlb/parsers/play_by_play_parser'
require 'sportradar/mlb/parsers/scoring_plays_parser'

require 'sportradar/mlb/boxscore'
require 'sportradar/mlb/daily_boxscore'
require 'sportradar/mlb/daily_schedule'
require 'sportradar/mlb/daily_game_summary'
require 'sportradar/mlb/daily_summary'
require 'sportradar/mlb/game_summary'
require 'sportradar/mlb/glossary'
require 'sportradar/mlb/injuries'
require 'sportradar/mlb/league_hierarchy'
require 'sportradar/mlb/play_by_play'
require 'sportradar/mlb/player_profile'
require 'sportradar/mlb/daily_play_by_play'
require 'sportradar/mlb/league_schedule'
require 'sportradar/mlb/teams_request'
require 'sportradar/mlb/season_statistics'
require 'sportradar/mlb/team_active_rosters'
require 'sportradar/mlb/team_profile'
require 'sportradar/mlb/team_rosters'
require 'sportradar/mlb/team_statistics'
require 'sportradar/mlb/venues'

require 'sportradar/nba/league_hierarchy'
require 'sportradar/nba/league_schedule'
require 'sportradar/nba/play_by_play'

require 'sportradar/nfl/models/quarter'
require 'sportradar/nfl/models/drive'
require 'sportradar/nfl/models/event'
require 'sportradar/nfl/models/play'
require 'sportradar/nfl/models/play_player_stat'
require 'sportradar/nfl/models/play_advancement'
require 'sportradar/nfl/models/play_summary'

require 'sportradar/nfl/parsers/boxscore_parser'
require 'sportradar/nfl/parsers/play_by_play_parser'

require 'sportradar/nfl/league_hierarchy'
require 'sportradar/nfl/league_schedule'
require 'sportradar/nfl/weekly_schedule'
require 'sportradar/nfl/weekly_game_depth_charts'
require 'sportradar/nfl/weekly_game_statistics'
require 'sportradar/nfl/weekly_game_summary'
require 'sportradar/nfl/weekly_play_by_play'
require 'sportradar/nfl/game_request'
require 'sportradar/nfl/game_depth_chart'
require 'sportradar/nfl/game_injuries'
require 'sportradar/nfl/game_roster'
require 'sportradar/nfl/game_statistics'
require 'sportradar/nfl/game_summary'
require 'sportradar/nfl/play_by_play'
require 'sportradar/nfl/play_summary'
require 'sportradar/nfl/play_summaries'
require 'sportradar/nfl/boxscore'
require 'sportradar/nfl/extended_boxscore'
require 'sportradar/nfl/weekly_boxscore'
require 'sportradar/nfl/weekly_extended_boxscores'
require 'sportradar/nfl/teams_request'
require 'sportradar/nfl/team_roster'
require 'sportradar/nfl/team_rosters'
require 'sportradar/nfl/team_depth_chart'
require 'sportradar/nfl/team_depth_charts'
require 'sportradar/nfl/team_statistics'
require 'sportradar/nfl/weekly_leaders'
require 'sportradar/nfl/rankings'
require 'sportradar/nfl/standings'
require 'sportradar/nfl/season_statistics'

require 'sportradar/nhl/parsers/boxscore_parser'

require 'sportradar/nhl/boxscore'
require 'sportradar/nhl/daily_schedule'
require 'sportradar/nhl/game_summary'
require 'sportradar/nhl/league_hierarchy'
require 'sportradar/nhl/league_schedule'
require 'sportradar/nhl/play_by_play'
require 'sportradar/nhl/teams_request'
require 'sportradar/nhl/team_roster'
require 'sportradar/nhl/team_rosters'

Oj.default_options = {}

Dotenv.load
