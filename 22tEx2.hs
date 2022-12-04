-- This file is used to test your submission
-- it checks whether your submission will work with the automated testing script
-- but it does not provide many examples.
-- More testing examples will be provided on Blackboard
-- It needs to be pasted after your submission, which is what the script check_submission.sh does
-- before compiling and running

-- texting exercise 2

-- single cells

str1a_r = ((allWhite 1) == (blur (allWhite 1)))
str1b_r = ((allBlack 1) == (blur (allBlack 1)))

single_r = str1a_r && str1b_r

-- STRIPED

-- 4 cells

str2a_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(w 1)(w 1)(b 1)(b 1))
str2a_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(w 1)(w 1)(b 1)(b 1))
str2a_r = (str2a_o == (blur str2a_i))

-- 10 cells

str3_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(w 2)(w 2)(c(b 1)(w 1)(w 1)(b 1))(c(b 1)(w 1)(w 1)(b 1)))
str3_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(w 2)(w 2)(c(w 1)(w 1)(w 1)(w 1))(c(w 1)(w 1)(b 1)(b 1)))
str3_r = (str3_o == (blur str3_i))


-- 16 cells

str4_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(b 1)(w 1)(w 1)(b 1))(c(b 1)(w 1)(w 1)(b 1))(c(b 1)(w 1)(w 1)(b 1))(c(b 1)(w 1)(w 1)(b 1)))
str4_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(b 1)(b 1)(w 1)(b 1))(c(w 1)(w 1)(w 1)(b 1))(c(b 1)(w 1)(w 1)(w 1))(c(b 1)(w 1)(b 1)(b 1)))
str4_r = (str4_o == (blur str4_i))

--- large

str_mid_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(w 16)(w 16)(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))))(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))))(c(w 16)(w 16)(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))))(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(b 2)(b 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))))(w 32)(w 32))
str_mid_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(b 16)(b 16)(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))))(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(b 1)(w 1)(b 1)(w 1))))))(c(b 16)(b 16)(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(b 1)(w 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))))(c(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(c(b 2)(b 2)(b 2)(b 2))(c(b 2)(b 2)(b 2)(b 2))(w 4)(w 4))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))(c(w 4)(w 4)(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(c(w 1)(w 1)(b 1)(b 1))))))(b 32)(b 32))
str_mid_r = (str_mid_o == (blur str_mid_i))


--- NOT STRIPED

-- 4 cells

str2b_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(w 1)(b 1)(w 1)(b 1))
str2b_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(b 1)(w 1)(b 1)(w 1))
str2b_r = (str2b_o == (blur str2b_i))

-- a medium-sized example

mid_i = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(c(b 2)(b 2)(c(b 1)(b 1)(w 1)(b 1))(b 2))(c(c(b 1)(b 1)(w 1)(b 1))(c(b 1)(b 1)(w 1)(w 1))(w 2)(w 2))(c(c(w 1)(b 1)(w 1)(b 1))(c(b 1)(w 1)(b 1)(w 1))(w 2)(w 2))(c(b 2)(w 2)(w 2)(c(b 1)(w 1)(w 1)(b 1))))(c(c(c(b 1)(b 1)(w 1)(w 1))(c(b 1)(b 1)(b 1)(w 1))(w 2)(w 2))(c(b 2)(b 2)(b 2)(c(b 1)(b 1)(b 1)(w 1)))(c(c(w 1)(w 1)(w 1)(b 1))(b 2)(c(w 1)(b 1)(b 1)(w 1))(w 2))(c(c(w 1)(w 1)(b 1)(w 1))(c(b 1)(b 1)(w 1)(w 1))(w 2)(w 2)))(c(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(w 2))(c(w 2)(c(w 1)(b 1)(b 1)(w 1))(c(w 1)(b 1)(b 1)(w 1))(w 2))(c(w 2)(c(w 1)(b 1)(b 1)(w 1))(b 2)(c(b 1)(w 1)(b 1)(b 1)))(c(w 2)(b 2)(b 2)(c(w 1)(b 1)(b 1)(b 1))))(c(c(c(b 1)(w 1)(w 1)(b 1))(w 2)(w 2)(c(b 1)(w 1)(w 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(w 1)(b 1))(c(w 1)(w 1)(b 1)(w 1)))(c(c(w 1)(b 1)(b 1)(w 1))(c(b 1)(w 1)(w 1)(b 1))(b 2)(b 2))(c(c(b 1)(w 1)(b 1)(b 1))(w 2)(c(b 1)(w 1)(b 1)(b 1))(b 2))))
mid_o = let
  c = clockwise
  w = allWhite
  b = allBlack in
   (c(c(c(b 2)(b 2)(c(b 1)(b 1)(w 1)(b 1))(b 2))(c(c(b 1)(b 1)(w 1)(b 1))(c(b 1)(b 1)(w 1)(w 1))(w 2)(w 2))(c(c(w 1)(w 1)(w 1)(w 1))(c(w 1)(w 1)(w 1)(w 1))(w 2)(w 2))(c(b 2)(w 2)(w 2)(c(b 1)(w 1)(w 1)(b 1))))(c(c(c(b 1)(b 1)(w 1)(w 1))(c(b 1)(b 1)(b 1)(w 1))(b 2)(w 2))(c(b 2)(b 2)(b 2)(c(b 1)(b 1)(b 1)(w 1)))(c(c(w 1)(w 1)(w 1)(w 1))(w 2)(c(w 1)(b 1)(b 1)(w 1))(w 2))(c(c(w 1)(w 1)(w 1)(w 1))(c(w 1)(w 1)(w 1)(w 1))(w 2)(w 2)))(c(c(w 2)(w 2)(c(w 1)(w 1)(b 1)(b 1))(w 2))(c(w 2)(c(w 1)(b 1)(b 1)(w 1))(c(w 1)(b 1)(b 1)(w 1))(w 2))(c(w 2)(c(w 1)(b 1)(b 1)(w 1))(b 2)(c(b 1)(b 1)(b 1)(b 1)))(c(w 2)(b 2)(b 2)(c(b 1)(b 1)(b 1)(b 1))))(c(c(c(b 1)(w 1)(w 1)(b 1))(w 2)(w 2)(c(b 1)(w 1)(w 1)(b 1)))(c(w 2)(w 2)(c(w 1)(w 1)(w 1)(b 1))(c(w 1)(w 1)(b 1)(w 1)))(c(c(w 1)(b 1)(b 1)(w 1))(c(b 1)(w 1)(w 1)(b 1))(b 2)(b 2))(c(c(b 1)(w 1)(b 1)(b 1))(w 2)(c(b 1)(b 1)(b 1)(b 1))(b 2))))
mid_r = (mid_o == (blur mid_i))



main =     mainS
        >> putStrLn(if single_r  then "Joe: Single cell check for ex2 passed!" else "ERROR: Single cell check for ex2 FAILED!")
        >> putStrLn(if str2a_r then "Joe: 4 cell striped check for ex2 passed!" else "ERROR: 4 cell striped check for ex2 FAILED!")
        >> putStrLn(if str3_r then "Joe: 10 cell striped  check for ex2 passed!" else "ERROR: 10 cell striped check for ex2 FAILED!")
        >> putStrLn(if str4_r then "Joe: 16 cell striped check for ex2 passed!" else "ERROR: 16 cell striped check for ex2 FAILED!")
        >> putStrLn(if str_mid_r then "Joe: big striped check for ex2 passed!" else "ERROR: big striped check for ex2 FAILED!")
        >> putStrLn(if str2b_r then "Joe: 4 cell not striped check for ex2 passed!" else "ERROR: 4 cell not striped check for ex2 FAILED!")
        >> putStrLn(if mid_r then "Joe: medium size not striped check for ex2 passed!" else "ERROR: medium size not striped check for ex2 FAILED!")
        >> mainE
--
