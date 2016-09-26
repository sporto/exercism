{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import SpaceAge (Planet(..), ageOn)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "space-age" $
          describe "ageOn" $ for_ cases test
  where

    test Case{..} = it description assertion
      where
        expression  = ageOn planet $ fromIntegral seconds
        assertion   = roundAge expression `shouldBe` roundAge expected
        roundAge    = (/ 100) . fromIntegral . round . (* 100)

-- Test cases adapted from `exercism/x-common/space-age.json` on 2016-07-27.

data Case = Case { description :: String
                 , planet      :: Planet
                 , seconds     :: Integer
                 , expected    :: Double
                 }

cases :: [Case]
cases = [ Case { description = "Earth"
               , planet      = Earth
               , seconds     = 1000000000
               , expected    = 31.69
               }
        , Case { description = "Mercury"
               , planet      = Mercury
               , seconds     = 2134835688
               , expected    = 280.88
               }
        , Case { description = "Venus"
               , planet      = Venus
               , seconds     = 189839836
               , expected    = 9.78
               }
        , Case { description = "Mars"
               , planet      = Mars
               , seconds     = 2329871239
               , expected    = 39.25
               }
        , Case { description = "Jupiter"
               , planet      = Jupiter
               , seconds     = 901876382
               , expected    = 2.41
               }
        , Case { description = "Saturn"
               , planet      = Saturn
               , seconds     = 3000000000
               , expected    = 3.23
               }
        , Case { description = "Uranus"
               , planet      = Uranus
               , seconds     = 3210123456
               , expected    = 1.21
               }
        , Case { description = "Neptune"
               , planet      = Neptune
               , seconds     = 8210123456
               , expected    = 1.58
               }
        ]
