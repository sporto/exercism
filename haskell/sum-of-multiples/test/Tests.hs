{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

-- base >= 4.8 re-exports Control.Applicative.(<$>).
import Control.Applicative -- This is only need for <$>,  if GHC <  7.10.
import Prelude             -- This trick avoids a warning if GHC >= 7.10.

import SumOfMultiples (sumOfMultiples)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "sum-of-multiples" $
          describe "sumOfMultiples" $ for_ cases test
  where
    test Case{..} = it description assertion
      where
        description = unwords [show factors, show limit]
        assertion   = expression `shouldBe` fromIntegral expected
        expression  = sumOfMultiples (fromIntegral <$> factors)
                                     (fromIntegral     limit  )

-- Test cases adapted from `exercism/x-common/sum-of-multiples.json` on 2016-07-27.

data Case = Case { factors  :: [Integer]
                 , limit    ::  Integer
                 , expected ::  Integer
                 }

cases :: [Case]
cases = [ Case { factors  = [3, 5]
               , limit    = 1
               , expected = 0
               }
        , Case { factors  = [3, 5]
               , limit    = 4
               , expected = 3
               }
        , Case { factors  = [3, 5]
               , limit    = 10
               , expected = 23
               }
        , Case { factors  = [3, 5]
               , limit    = 100
               , expected = 2318
               }
        , Case { factors  = [3, 5]
               , limit    = 1000
               , expected = 233168
               }
        , Case { factors  = [7, 13, 17]
               , limit    = 20
               , expected = 51
               }
        , Case { factors  = [4, 6]
               , limit    = 15
               , expected = 30
               }
        , Case { factors  = [5, 6, 8]
               , limit    = 150
               , expected = 4419
               }
        , Case { factors  = [5, 25]
               , limit    = 51
               , expected = 275
               }
        , Case { factors  = [43, 47]
               , limit    = 10000
               , expected = 2203160
               }
        , Case { factors  = [1]
               , limit    = 100
               , expected = 4950
               }
        , Case { factors  = []
               , limit    = 10000
               , expected = 0
               }
        ]
