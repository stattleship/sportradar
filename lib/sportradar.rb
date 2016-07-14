require 'active_support/core_ext/string'
require 'active_support/inflector'

require 'addressable/uri'
require 'addressable/template'

require 'dotenv'
require 'net/https'
require 'oj'

require 'sportradar/version'

require 'sportradar/client/api_request'
require 'sportradar/client/daily_api_request'
require 'sportradar/client/client'
require 'sportradar/client/configuration'

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
require 'sportradar/mlb/team_active_rosters'
require 'sportradar/mlb/team_profile'
require 'sportradar/mlb/team_rosters'
require 'sportradar/mlb/venues'

Oj.default_options = {}

Dotenv.load
