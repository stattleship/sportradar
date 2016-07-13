module Sportradar
  module Mlb
    module Models
      class PitchOutcome
        def initialize(outcome:)
          @outcome = outcome
        end

        def to_s
          outcomes[outcome] || ''
        end

        private

        attr_reader :outcome

        def outcomes
          {
            "aBK" => "Balk",
            "aCI" => "Catcher Interference",
            "aD" => "Double",
            "aDAD3" => "Double - Adv 3rd",
            "aDAD4" => "Double - Adv Home",
            "aFCAD2" => "Fielders Choice - Adv 2nd",
            "aFCAD3" => "Fielders Choice - Adv 3rd",
            "aFCAD4" => "Fielders Choice - Adv Home",
            "aHBP" => "Hit By Pitch",
            "aHR" => "Homerun",
            "aKLAD1" => "Strike Looking - Adv 1st",
            "aKLAD2" => "Strike Looking - Adv 2nd",
            "aKLAD3" => "Strike Looking - Adv 3rd",
            "aKLAD4" => "Strike Looking - Adv Home",
            "aKSAD1" => "Strike Swinging - Adv 1st",
            "aKSAD2" => "Strike Swinging - Adv 2nd",
            "aKSAD3" => "Strike Swinging - Adv 3rd",
            "aKSAD4" => "Strike Swinging - Adv Home",
            "aROE" => "Reached On Error",
            "aROEAD2" => "Reached On Error - Adv 2nd",
            "aROEAD3" => "Reached On Error - Adv 3rd",
            "aROEAD4" => "Reached On Error - Adv Home",
            "aS" => "Single",
            "aSAD2" => "Single - Adv 2nd",
            "aSAD3" => "Single - Adv 3rd",
            "aSAD4" => "Single - Adv Home",
            "aSBAD1" => "Sacrifice Bunt - Adv 1st",
            "aSBAD2" => "Sacrifice Bunt - Adv 2nd",
            "aSBAD3" => "Sacrifice Bunt - Adv 3rd",
            "aSBAD4" => "Sacrifice Bunt - Adv Home",
            "aSFAD1" => "Sacrifice Fly - Adv 1st",
            "aSFAD2" => "Sacrifice Fly - Adv 2nd",
            "aSFAD3" => "Sacrifice Fly - Adv 3rd",
            "aSFAD4" => "Sacrifice Fly - Adv Home",
            "aT" => "Triple",
            "aTAD4" => "Triple - Adv Home",
            "bB" => "Ball",
            "bDB" => "Dirt Ball",
            "bIB" => "iBall",
            "bPO" => "Pitchout",
            "kF" => "Foul Ball",
            "kFT" => "Foul Tip",
            "kKL" => "Strike Looking",
            "kKS" => "Strike Swinging",
            "oBI" => "Batter Interference",
            "oDT3" => "Double - Out at 3rd",
            "oDT4" => "Double - Out at Home",
            "oFC" => "Fielders Choice",
            "oFCT2" => "Fielders Choice - Out at 2nd",
            "oFCT3" => "Fielders Choice - Out at 3rd",
            "oFCT4" => "Fielders Choice - Out at Home",
            "oFO" => "Fly Out",
            "oGO" => "Ground Out",
            "oKLT1" => "Strike Looking - Out at 1st",
            "oKLT2" => "Strike Looking - Out at 2nd",
            "oKLT3" => "Strike Looking - Out at 3rd",
            "oKLT4" => "Strike Looking - Out at Home",
            "oKST1" => "Strike Swinging - Out at 1st",
            "oKST2" => "Strike Swinging - Out at 2nd",
            "oKST3" => "Strike Swinging - Out at 3rd",
            "oKST4" => "Strike Swinging - Out at Home",
            "oLO" => "Line Out",
            "oOBB" => "Out of Batters Box",
            "oOP" => "Out on Appeal",
            "oPO" => "Pop Out",
            "oROET2" => "Reached On Error - Out at 2nd",
            "oROET3" => "Reached On Error - Out at 3rd",
            "oROET4" => "Reached On Error - Out at Home",
            "oSB" => "Sacrifice Bunt",
            "oSBT2" => "Sacrifice Bunt - Out at 2nd",
            "oSBT3" => "Sacrifice Bunt - Out at 3rd",
            "oSBT4" => "Sacrifice Bunt - Out at Home",
            "oSF" => "Sacrifice Fly",
            "oSFT2" => "Sacrifice Fly - Out at 2nd",
            "oSFT3" => "Sacrifice Fly - Out at 3rd",
            "oSFT4" => "Sacrifice Fly - Out at Home",
            "oST2" => "Single - Out at 2nd",
            "oST3" => "Single - Out at 3rd",
            "oST4" => "Single - Out at Home",
            "oTT4" => "Triple - Out at Home",
          }
        end
      end
    end
  end
end
