module Acronym (abbreviate) where

abbreviate :: String -> String
abbreviate [] = ""
abbreviate (x:xs)
  | x == " " = "" : rest
  | otherwise = (x : head rest) : tail rest
  where
    rest = abbreviate xs
