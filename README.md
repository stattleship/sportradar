# Sportradar

Simple API client for [Sportradar API](http://developer.sportradar.us/).

Currently supports a subset of [Major League Baseball API](http://developer.sportradar.us/docs/MLB_API) endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sportradar', '>= 0.0.4'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sportradar

## Usage

### Configuration

In your `.env`:

```
SPORTRADAR_ACCESS_LEVEL_MLB=t
SPORTRADAR_API_KEY_MLB=YOUR_API_KEY

SPORTRADAR_ACCESS_LEVEL_NBA=t
SPORTRADAR_API_KEY_NBA=YOUR_API_KEY

SPORTRADAR_ACCESS_LEVEL_NFL=t
SPORTRADAR_API_KEY_NFL=YOUR_API_KEY

SPORTRADAR_ACCESS_LEVEL_NHL=t
SPORTRADAR_API_KEY_NHL=YOUR_API_KEY

SPORTRADAR_FILE_PATH=/path/to/save/responses
```

`SPORTRADAR_ACCESS_LEVEL` is `t` or 'p' (or 'rt')

Note: Currently only MLB and NFL support.

Important: This is a breaking change from version 0.0.3 that had a global access level.

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

Note: `.save` vs `.fetch` will store in the path specified in `SPORTRADAR_FILE_PATH`.

#### Bulk Saves

Some helpers will call .save for each response as separate items.

* `Sportradar::Mlb::DailyGameSummary.new(date: Date.today).perform`
* `Sportradar::Mlb::DailyPlayByPlay.new(date: Date.today).perform`

### Football/NFL

Defaults to and supports NFL Classic API feed version 1 only (not Official).

#### API Requests

* `Sportradar::Nfl::LeagueHierarchy.new().fetch`
* `Sportradar::Nfl::WeeklySchedule.new(year: '2016', interval_type: <reg|pre|pst>, week: <0..17>).fetch`
* `Sportradar::Nfl::LeagueSchedule.new(year: '2016', interval_type: <reg|pre|pst>).fetch`
* `Sportradar::Nfl::GameStatistics.new(week: 1,
                                       year: 2015,
                                       interval_type: 'reg',
                                       away_team_abbreviation: 'PIT',
                                       home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::GameSummary.new(week: 1,
                                    year: 2015,
                                    interval_type: 'reg',
                                    away_team_abbreviation: 'PIT',
                                    home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::PlayByPlay.new(week: 1,
                                   year: 2015,
                                   interval_type: 'reg',
                                   away_team_abbreviation: 'PIT',
                                   home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::PlaySummary.new(week: 1,
                                    year: 2015,
                                    interval_type: 'reg',
                                    away_team_abbreviation: 'PIT',
                                    home_team_abbreviation: 'NE',
                                    play_id: '4788eac3-c59e-4f82-94ef-d449ac6d6fca').fetch`
* `Sportradar::Nfl::Boxscore.new(week: 1,
                                 year: 2015,
                                 away_team_abbreviation: 'PIT',
                                 home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::ExtendedBoxscore.new(week: 1,
                                         year: 2015,
                                         away_team_abbreviation: 'PIT',
                                         home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::WeeklyBoxscore.new(week: 1, year: 2015).fetch`
* `Sportradar::Nfl::TeamRoster.new(team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::GameDepthChart.new(week: 1, year: 2015, away_team_abbreviation: 'PIT', home_team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::TeamDepthChart.new(team_abbreviation: 'NE').fetch`
* `Sportradar::Nfl::WeeklyLeaders.new(week: 1, year: 2015).fetch`
* `Sportradar::Nfl::Standings.new(year: 2015, interval_type: <reg|pre|pst>).fetch`
* `Sportradar::Nfl::Rankings.new(year: 2015).fetch`
* `Sportradar::Nfl::TeamStatistics.new(year: 2015, interval_type: 'reg', team_abbreviation: 'NE').fetch`

#### Bulk Saves

Some helpers will call `.save` for each response as separate items.

* `Sportradar::Nfl::TeamRosters.perform`
* `Sportradar::Nfl::TeamDepthCharts.perform`
* `Sportradar::Nfl::WeeklyExtendedBoxscores.perform(year: 2015, interval_type: 'reg', week: 1)`
* `Sportradar::Nfl::WeeklyGameDepthCharts.perform(year: 2015, interval_type: 'reg', week: 1)`
* `Sportradar::Nfl::WeeklyGameStatistics.perform(year: 2015, interval_type: 'reg', week: 2)`
* `Sportradar::Nfl::WeeklyGameSummary.perform(year: 2015, interval_type: 'reg', week: 2)`
* `Sportradar::Nfl::WeeklyPlayByPlay.perform(year: 2015, interval_type: 'reg', week: 1)`
* `Sportradar::Nfl::SeasonStatistics.perform(year: 2015, interval_type: 'reg')`

### Model Helpers

#### Boxscore and Scoring Plays

* `Sportradar::Mlb::Parsers::ScoringPlays.new(game_boxscore: {})`

Given game boxscore JSON, makes it easy to get the events and runners as scoring plays and players via a set of convenience methods.

For example:

```
sp = Sportradar::Mlb::Parsers::ScoringPlays.new(game_boxscore: g.game_boxscore)

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

#### Play by Play, At Bats and Pitches

The `Sportradar::Mlb::Parsers::PlayByPlayParser.new(game_play_by_play: g.game_play_by_play)` takes thes play-by-play json and can return

* `.at_bats`
* `.at_bat_summary`
* `.pitches`
* `.pitch_summary`

Both the `at_bats` and `pitch` are models with each attribute, like `pitch_speed` or `hitter_id`.

The summary convenience methods list each at bat or pitch as text.

#### At Bat Summary

Given the play-by-play json, `Sportradar::Mlb::Parsers::PlayByPlayParser.new(game_play_by_play: g.game_play_by_play).at_bat_summary` returns:

```
T of 1: Ruben Tejada strikes out swinging.
T of 1: Grant Green singles to shallow center field.
T of 1: Brandon Belt walks. Grant Green to second.
T of 1: Buster Posey singles to shallow right field. Brandon Belt to second. Grant Green to third.
T of 1: Brandon Crawford strikes out swinging.
T of 1: Mac Williamson grounds out to third base, Jake Lamb to Paul Goldschmidt.
B of 1: Jean Segura flies out to shallow right field to Mac Williamson.
B of 1: Michael Bourn singles to shallow infield.
B of 1: Paul Goldschmidt reaches on a fielder's choice to second base. Michael Bourn out at second.
B of 1: Jake Lamb strikes out swinging.
T of 2: Trevor Brown grounds out to third base, Jake Lamb to Paul Goldschmidt.
T of 2: Jarrett Parker grounds out to second base, Philip Gosselin to Paul Goldschmidt.
T of 2: Albert Suarez strikes out swinging.
B of 2: Yasmany Tomas grounds out to shortstop, Brandon Crawford to Buster Posey.
B of 2: Philip Gosselin doubles to deep left center field.
B of 2: Brandon Drury doubles to deep left center field. Philip Gosselin scores.
B of 2: Tuffy Gosewisch singles to shallow left field. Brandon Drury to third.
B of 2: Robbie Ray out on a sacrifice bunt to shallow infield, Buster Posey to Grant Green. Tuffy Gosewisch to second.
B of 2: Jean Segura flies out to center field to Jarrett Parker.
T of 3: Ruben Tejada lines out to left center field to Brandon Drury.
T of 3: Grant Green singles to center field.
T of 3: Brandon Belt singles to right field. Grant Green to second.
T of 3: Buster Posey lines out to center field to Michael Bourn.
T of 3: Brandon Crawford hit by pitch. Brandon Belt to second. Grant Green to third.
T of 3: Mac Williamson singles to shallow center field. Brandon Crawford to third. Brandon Belt scores. Grant Green scores.
T of 3: Trevor Brown called out on strikes.
B of 3: Michael Bourn grounds out to shortstop, Ruben Tejada to Buster Posey.
B of 3: Paul Goldschmidt grounds out to shortstop, Brandon Crawford to Buster Posey.
B of 3: Jake Lamb strikes out swinging.
T of 4: Jarrett Parker lines out to left field to Brandon Drury.
T of 4: Albert Suarez singles to shallow center field.
T of 4: Ruben Tejada doubles to deep center field. Albert Suarez to third.
T of 4: Grant Green flies out to left field to Brandon Drury.
T of 4: Brandon Belt doubles to left field. Ruben Tejada scores. Albert Suarez scores.
T of 4: Buster Posey walks.
T of 4: Brandon Crawford strikes out swinging.
B of 4: Yasmany Tomas strikes out swinging.
B of 4: Philip Gosselin grounds out to first base, Buster Posey to Albert Suarez.
B of 4: Brandon Drury grounds out to shortstop, Brandon Crawford to Buster Posey.
T of 5: Mac Williamson grounds out to third base, Jake Lamb to Paul Goldschmidt.
T of 5: Trevor Brown grounds out to third base, Jake Lamb to Paul Goldschmidt.
T of 5: Jarrett Parker called out on strikes.
B of 5: Tuffy Gosewisch grounds out to third base, Ruben Tejada to Brandon Crawford to Buster Posey.
B of 5: Robbie Ray grounds out to second base, Grant Green to Buster Posey.
B of 5: Jean Segura doubles to deep right field.
B of 5: Michael Bourn strikes out swinging.
T of 6: Albert Suarez strikes out swinging.
T of 6: Ruben Tejada grounds out to third base, Jake Lamb to Paul Goldschmidt.
T of 6: Grant Green strikes out swinging.
B of 6: Paul Goldschmidt homers to center field.
B of 6: Jake Lamb lines out to deep center field to Jarrett Parker.
B of 6: Yasmany Tomas grounds out to second base, Grant Green to Buster Posey.
B of 6: Philip Gosselin called out on strikes.
T of 7: Brandon Belt strikes out swinging.
T of 7: Buster Posey walks.
T of 7: Brandon Crawford strikes out on a foul tip.
T of 7: Mac Williamson lines out to deep left field to Brandon Drury.
B of 7: Brandon Drury flies out to deep left field to Brandon Belt.
B of 7: Tuffy Gosewisch singles to left field.
B of 7: Chris Herrmann strikes out swinging.
B of 7: Jean Segura grounds out to shallow infield, George Kontos to Buster Posey.
T of 8: Trevor Brown flies out to right center field to Yasmany Tomas.
T of 8: Jarrett Parker strikes out swinging.
T of 8: Conor Gillaspie grounds out to second base, Philip Gosselin to Paul Goldschmidt.
B of 8: Michael Bourn grounds out to first base to Buster Posey.
B of 8: Paul Goldschmidt reaches on error. Fielding error by Gerald Posey.
B of 8: Jake Lamb homers to right field. Paul Goldschmidt scores.
B of 8: Yasmany Tomas grounds out to first base, Buster Posey to Cory Gearrin.
B of 8: Philip Gosselin walks.
B of 8: Brandon Drury flies out to center field to Jarrett Parker.
T of 9: Ruben Tejada called out on strikes.
T of 9: Grant Green grounds out to shortstop, Jean Segura to Paul Goldschmidt.
T of 9: Brandon Belt walks.
T of 9: Buster Posey lines out to deep left field to Brandon Drury.
B of 9: Tuffy Gosewisch strikes out swinging.
B of 9: Rickie Weeks walks.
B of 9: Jean Segura lines out to shallow infield to Hunter Strickland. Rickie Weeks doubled off first.
T of 10: Brandon Crawford flies out to deep right center field to Yasmany Tomas.
T of 10: Mac Williamson strikes out on a foul tip.
T of 10: Trevor Brown called out on strikes.
B of 10: Michael Bourn grounds out to second base, Grant Green to Buster Posey.
B of 10: Paul Goldschmidt grounds out to shortstop, Brandon Crawford to Buster Posey.
B of 10: Jake Lamb strikes out swinging.
T of 11: Jarrett Parker walks.
T of 11: Ramiro Pena doubles to deep right field. Jarrett Parker scores.
T of 11: Ruben Tejada out on a sacrifice bunt to shallow infield, Enrique Burgos to Paul Goldschmidt. Ramiro Pena to third.
T of 11: Angel Pagan strikes out swinging.
T of 11: Brandon Belt pops out to shallow left field to Jake Lamb.
B of 11: Yasmany Tomas singles to shallow left field.
B of 11: Philip Gosselin out on a sacrifice bunt to shallow infield, Ruben Tejada to Ramiro Pena. Yasmany Tomas to second.
B of 11: Brandon Drury grounds out to third base, Ruben Tejada to Buster Posey.
B of 11: Welington Castillo walks.
B of 11: Peter O'Brien strikes out swinging.
```

#### Pitch Summary

Given the play-by-play json, `Sportradar::Mlb::Parsers::PlayByPlayParser.new(game_play_by_play: g.game_play_by_play).pitch_summary` returns the type and result of each pitch:

```
Fastball = Strike Looking
Fastball = Foul Ball
Fastball = Ball
Fastball = Foul Ball
Slider = Strike Swinging
Fastball = Strike Looking
Fastball = Foul Ball
Fastball = Single
Slider = Ball
Slider = Ball
Fastball = Ball
Fastball = Ball
Fastball = Foul Tip
Fastball = Single
Slider = Strike Swinging
Slider = Dirt Ball
Fastball = Strike Looking
Fastball = Ball
Fastball = Ball
Slider = Foul Ball
Fastball = Strike Swinging
Fastball = Strike Looking
Fastball = Ball
Fastball = Foul Ball
Slider = Ball
Fastball = Ground Out
Sinker = Ball
Fastball = Strike Looking
Sinker = Ball
Slider = Fly Out
Sinker = Ball
Fastball = Single
Slider = Strike Looking
Sinker = Dirt Ball
Sinker = Strike Swinging
Sinker = Foul Ball
Fastball = Ball
Slider = Fielders Choice
Fastball = Ball
Changeup = Foul Ball
Sinker = Ball
Fastball = Foul Ball
Curveball = Foul Ball
Curveball = Strike Swinging
Changeup = Ball
Fastball = Ground Out
Fastball = Strike Looking
Fastball = Foul Ball
Fastball = Ground Out
Fastball = Strike Looking
Fastball = Ball
Fastball = Ball
Fastball = Strike Swinging
Fastball = Strike Swinging
Sinker = Strike Looking
Slider = Foul Ball
Slider = Ground Out
Fastball = Strike Looking
Fastball = Ball
Changeup = Foul Ball
Sinker = Ball
Sinker = Ball
Slider = Double
Sinker = Double
Slider = Ball
Fastball = Strike Looking
Sinker = Strike Swinging
Curveball = Dirt Ball
Slider = Ball
Sinker = Single
Sinker = Foul Ball
Slider = Ball
Sinker = Sacrifice Bunt
Curveball = Ball
Fastball = Ball
Slider = Strike Looking
Slider = Fly Out
Fastball = Strike Looking
Curveball = Ball
Fastball = Line Out
Slider = Ball
Fastball = Single
Fastball = Strike Looking
Fastball = Foul Ball
Slider = Foul Ball
Fastball = Ball
Fastball = Foul Ball
Slider = Single
Fastball = Foul Ball
Slider = Line Out
Fastball = Strike Looking
Fastball = Hit By Pitch
Fastball = Single
Fastball = Strike Looking
Fastball = Strike Swinging
Fastball = Strike Looking
Sinker = Strike Looking
Curveball = Foul Ball
Sinker = Foul Ball
Fastball = Ground Out
Sinker = Ball
Slider = Ball
Fastball = Strike Looking
Slider = Strike Looking
Slider = Ball
Fastball = Foul Ball
Slider = Ground Out
Curveball = Ball
Changeup = Strike Looking
Curveball = Ball
Sinker = Foul Ball
Sinker = Foul Ball
Sinker = Foul Ball
Sinker = Ball
Curveball = Strike Swinging
Fastball = Line Out
Fastball = Strike Looking
Fastball = Ball
Fastball = Single
Fastball = Ball
Fastball = Foul Ball
Slider = Ball
Slider = Ball
Fastball = Double
Fastball = Ball
Fastball = Fly Out
Slider = Strike Swinging
Fastball = Strike Swinging
Fastball = Foul Ball
Fastball = Double
Intentional Ball = iBall
Intentional Ball = iBall
Intentional Ball = iBall
Intentional Ball = iBall
Slider = Strike Swinging
Fastball = Ball
Slider = Strike Swinging
Slider = Foul Ball
Fastball = Ball
Slider = Strike Swinging
Slider = Strike Swinging
Fastball = Ball
Slider = Foul Ball
Slider = Foul Ball
Fastball = Ball
Slider = Ball
Sinker = Strike Swinging
Slider = Ball
Fastball = Strike Looking
Sinker = Ground Out
Slider = Ball
Slider = Ball
Slider = Strike Looking
Fastball = Ground Out
Fastball = Strike Looking
Slider = Strike Looking
Slider = Foul Ball
Fastball = Foul Ball
Slider = Ball
Fastball = Ground Out
Slider = Ground Out
Slider = Ball
Slider = Strike Swinging
Slider = Strike Swinging
Fastball = Ball
Slider = Strike Looking
Sinker = Ground Out
Sinker = Strike Looking
Sinker = Foul Ball
Curveball = Ball
Curveball = Foul Ball
Fastball = Ground Out
Sinker = Foul Ball
Fastball = Double
Curveball = Strike Looking
Slider = Dirt Ball
Fastball = Foul Ball
Sinker = Strike Swinging
Fastball = Foul Ball
Slider = Foul Ball
Fastball = Foul Ball
Slider = Strike Swinging
Slider = Strike Looking
Slider = Ground Out
Slider = Strike Swinging
Fastball = Foul Ball
Slider = Strike Swinging
Slider = Ball
Slider = Foul Ball
Slider = Strike Swinging
Fastball = Ball
Curveball = Homerun
Changeup = Ball
Sinker = Line Out
Fastball = Ball
Fastball = Ball
Sinker = Ball
Sinker = Strike Looking
Sinker = Ground Out
Fastball = Foul Ball
Sinker = Ball
Sinker = Foul Ball
Sinker = Foul Ball
Sinker = Strike Looking
Slider = Ball
Sinker = Foul Ball
Sinker = Foul Ball
Sinker = Ball
Slider = Strike Swinging
Fastball = Ball
Slider = Ball
Changeup = Ball
Sinker = Foul Ball
Sinker = Ball
Sinker = Strike Swinging
Fastball = Ball
Slider = Foul Ball
Sinker = Ball
Fastball = Foul Tip
Fastball = Ball
Slider = Strike Looking
Fastball = Line Out
Slider = Fly Out
Cutter = Strike Looking
Cutter = Single
Fastball = Strike Swinging
Fastball = Foul Ball
Fastball = Ball
Fastball = Ball
Fastball = Ball
Fastball = Strike Swinging
Fastball = Ground Out
Slider = Ball
Fastball = Foul Ball
Slider = Fly Out
Fastball = Ball
Changeup = Foul Ball
Fastball = Ball
Fastball = Foul Ball
Fastball = Ball
Fastball = Strike Swinging
Fastball = Strike Looking
Fastball = Ground Out
Sinker = Ground Out
Sinker = Ball
Sinker = Foul Ball
Slider = Reached On Error
Sinker = Ball
Slider = Strike Swinging
Sinker = Foul Ball
Changeup = Ball
Changeup = Ball
Slider = Homerun
Sinker = Ball
Sinker = Ball
Sinker = Ground Out
Sinker = Ball
Slider = Ball
Sinker = Ball
Sinker = Ball
Fastball = Foul Ball
Slider = Ball
Sinker = Ball
Slider = Strike Looking
Slider = Fly Out
Sinker = Ball
Sinker = Strike Looking
Sinker = Ball
Sinker = Foul Ball
Sinker = Ball
Sinker = Foul Ball
Sinker = Strike Looking
Sinker = Foul Ball
Changeup = Strike Swinging
Curveball = Ball
Curveball = Ball
Sinker = Foul Ball
Sinker = Foul Ball
Changeup = Foul Ball
Changeup = Ground Out
Changeup = Ball
Sinker = Ball
Sinker = Ball
Sinker = Strike Looking
Sinker = Ball
Sinker = Line Out
Curveball = Ball
Fastball = Strike Swinging
Fastball = Strike Looking
Fastball = Foul Ball
Fastball = Strike Swinging
Fastball = Strike Swinging
Fastball = Ball
Curveball = Ball
Fastball = Foul Ball
Curveball = Ball
Fastball = Foul Ball
Fastball = Ball
Curveball = Foul Ball
Curveball = Line Out
Changeup = Fly Out
Fastball = Strike Looking
Curveball = Ball
Changeup = Strike Looking
Splitter = Foul Tip
Fastball = Ball
Fastball = Ball
Changeup = Ball
Fastball = Strike Looking
Changeup = Strike Swinging
Changeup = Foul Ball
Changeup = Foul Ball
Fastball = Foul Ball
Fastball = Strike Looking
Fastball = Strike Looking
Cutter = Strike Looking
Fastball = Ball
Fastball = Ground Out
Fastball = Foul Ball
Changeup = Ball
Changeup = Ball
Fastball = Ground Out
Changeup = Ball
Fastball = Strike Swinging
Fastball = Strike Looking
Fastball = Strike Swinging
Slider = Ball
Fastball = Strike Swinging
Fastball = Ball
Slider = Ball
Slider = Foul Ball
Fastball = Foul Ball
Fastball = Ball
Fastball = Ball
Slider = Double
Slider = Foul Ball
Fastball = Sacrifice Bunt
Slider = Strike Looking
Fastball = Strike Looking
Fastball = Strike Swinging
Slider = Ball
Slider = Strike Looking
Fastball = Ball
Fastball = Strike Swinging
Fastball = Ball
Slider = Pop Out
Fastball = Foul Ball
Fastball = Single
Fastball = Ball
Fastball = Sacrifice Bunt
Fastball = Ball
Curveball = Strike Looking
Slider = Ball
Curveball = Ball
Curveball = Ground Out
Fastball = Ball
Fastball = Ball
Fastball = Ball
Fastball = Ball
Fastball = Strike Swinging
Curveball = Ball
Fastball = Foul Ball
Fastball = Ball
Curveball = Strike Swinging
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stattleship/sportradar.


## License

None.

