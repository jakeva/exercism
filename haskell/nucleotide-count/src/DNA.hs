module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = "string"
