# Sportradar

Simple API client for [Sportradar API](http://developer.sportradar.us/).

Currently supports [Major League Baseball API](http://developer.sportradar.us/docs/MLB_API) endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sportradar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sportradar

## Usage

### Configuration

In your `.env`:

```
SPORTRADAR_ACCESS_LEVEL=t
SPORTRADAR_API_KEY_MLB=YOUR_API_KEY
SPORTRADAR_API_KEY_NBA=YOUR_API_KEY
SPORTRADAR_API_KEY_NFL=YOUR_API_KEY
SPORTRADAR_API_KEY_NHL=YOUR_API_KEY
SPORTRADAR_FILE_PATH=/path/to/save/responses
```

`SPORTRADAR_ACCESS_LEVEL` is `t` or 'p'

### Console

`bin/console`

### Baseball/MLB

Defaults to and supports API version 5 only.

#### API Requests

* `Sportradar::Mlb::Boxscore.new(event_id: '<game_guid>').fetch`
* `Sportradar::Mlb::DailyBoxscore.new(date: Date.today).fetch`
* `Sportradar::Mlb::DailyGameSummary.new(date: Date.today).fetch`
* `Sportradar::Mlb::DailyPlayByPlay.new(date: Date.today).fetch`
* `Sportradar::Mlb::DailySchedule.new(date: Date.today).fetch`
* `Sportradar::Mlb::DailySummary.new(date: Date.today).fetch`
* `Sportradar::Mlb::GameSummary.new(event_id: '<game_guid>').fetch`
* `Sportradar::Mlb::Glossary.new().fetch`
* `Sportradar::Mlb::Injuries.new().fetch`
* `Sportradar::Mlb::LeagueHierarchy.new().fetch`
* `Sportradar::Mlb::LeagueSchedule.new(year: '2016', interval_type: <reg|pre|pst>).fetch`
* `Sportradar::Mlb::PlayByPlay.new(event_id: '<game_guid>').fetch`
* `Sportradar::Mlb::PlayerProfile.new(player_id: '<player_guid>').fetch`
* `Sportradar::Mlb::TeamActiveRosters.new().fetch`
* `Sportradar::Mlb::TeamProfile.new(player_id: '<team_guid>').fetch`
* `Sportradar::Mlb::TeamRosters.new().fetch`
* `Sportradar::Mlb::Venues.new().fetch`

Note: `.save` vs `.fetch` will store in the path specified in `SPORTRADAR_FILE_PATH`. However, you need to have a directory created for each request within that path.

For example:

* `boxscore`
* `daily_boxscore`
* `daily_game_summary`
* `daily_play_by_play`
* `daily_schedule`
* `daily_summary`
* `game_summary`
* `glossary`
* `injuries`
* `league_hierarchy`
* `league_schedule`
* `play_by_play`
* `player_profile`
* `team_active_rosters`
* `team_profile`
* `team_rosters`
* `venues`

#### Bulk Saves

Some helpers will call `.save` for each response as separate items.

* `Sportradar::Mlb::DailyGameSummary.new(date: Date.today).perform`
* `Sportradar::Mlb::DailyPlayByPlay.new(date: Date.today).perform`

### Model Helpers

#### Boxscore and Scoring Plays

* `Sportradar::Mlb::ScoringPlays.new(game_boxscore: {})`

Given game boxscore JSON, makes it easy to get the events and runners as scoring plays and players via a set of convenience methods.

For example:

```
sp = Sportradar::Mlb::ScoringPlays.new(game_boxscore: g.game_boxscore)

sp.first.scoring_players
=> [{:player_id=>"66c43b7f-760a-446c-9f50-671915570227", :player_info=>nil, :role=>"pitcher"},
 {:player_id=>"e1633ff9-8c46-4698-9bea-3eecd478fa94", :player_info=>nil, :role=>"hitter"},
 {:player_id=>"e1633ff9-8c46-4698-9bea-3eecd478fa94",
  :player_info=>
   #<Sportradar::Mlb::Models::Runner:0x007fabc82ba748
    @runner=
     {"id"=>"e1633ff9-8c46-4698-9bea-3eecd478fa94",
      "starting_base"=>0,
      "first_name"=>"Kristopher",
      "last_name"=>"Bryant",
      "preferred_name"=>"Kris",
      "jersey_number"=>"17"}>,
  :role=>"runner"}]

sp.runner_ids
=> ["e1633ff9-8c46-4698-9bea-3eecd478fa94",
 "898c62b6-95bf-4973-a435-c6cb42a52158",
 "6ef878e2-1f2d-4855-a250-2ec7c97f961c",
 "9baf07d4-b1cb-4494-8c95-600d9e8de1a9",
 "084d2514-9ffb-414e-ae16-3bc690aaad51",
 "8ec56596-5b8b-41f8-88a7-384f20b8b6a7"]

sp.first.runner_ids
=> ["e1633ff9-8c46-4698-9bea-3eecd478fa94"]

sp.first.inning_label
=> "Top of 1st"

sp.first.scoring_method
=> "Homerun"

sp.away_team_hitter_ids
=> ["e1633ff9-8c46-4698-9bea-3eecd478fa94", "57f0a40f-e0f5-4e76-bd59-b8c4de7a680c"]

sp.home_team_pitcher_ids
=> ["1a574c70-eb33-4202-ab97-548645a4d15e", "29e9830d-b31a-4246-998c-6ca6f5a73ee8"]

sp.home_team_runner_ids
=> ["6ef878e2-1f2d-4855-a250-2ec7c97f961c",
 "9baf07d4-b1cb-4494-8c95-600d9e8de1a9",
 "084d2514-9ffb-414e-ae16-3bc690aaad51",
 "8ec56596-5b8b-41f8-88a7-384f20b8b6a7"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stattleship/sportradar.


## License

None.

