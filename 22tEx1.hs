-- This file is used to test your submission
-- it checks whether your submission will work with the automated testing script
-- but it does not provide many examples.
-- More testing examples will be provided on Blackboard
-- It needs to be pasted after your submission, which is what the script check_submission.sh does
-- before compiling and running

-- testing exercise 1

t1a = clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1) == anticlockwise (allBlack 1) (allWhite 1) (allWhite 1) (allBlack 1)

t1b = clockwise (allBlack 2) (anticlockwise (allBlack 1) (allWhite 1) (allWhite 1) (allBlack 1)) (allWhite 2) (allWhite 2) == anticlockwise (allBlack 2) (allWhite 2) (allWhite 2) (clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1))

t1c = clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1) /= anticlockwise (allWhite 1) (allWhite 1) (allWhite 1) (allBlack 1)

mainS = putStrLn("Joe: Tests running...")
        >> putStrLn(if t1a then "Joe: Simple check for ex 1 passed!" else "ERROR: Simple check for ex1 FAILED!")
        >> putStrLn(if t1c then "Joe: Inequality check for ex 1 passed!" else "ERROR: Inequality check for ex1 FAILED!")
        >> putStrLn(if t1b then "Joe: Larger check for ex 1 passed!" else "ERROR: Larger check for ex1 FAILED!")

--

mainE = putStrLn("Joe: **************************************************************************************************")
        >> putStrLn("Joe: If any tests above FAILED your submission is not correct")
        >> putStrLn("Joe: If all tests above passed then your submission is in the correct format but...")
        >> putStrLn("Joe: ...it may not be correct: this script does NOT test thoroughly!")
--
