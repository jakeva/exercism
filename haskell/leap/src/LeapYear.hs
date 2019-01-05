module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | year `isDivisibleBy` 100 = year `isDivisibleBy` 400
  | otherwise = year `isDivisibleBy` 4

isDivisibleBy :: Integer -> Integer -> Bool
isDivisibleBy n m = mod n m == 0
