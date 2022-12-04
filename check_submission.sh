#!/bin/bash

if [ -f submission.hs ]; then
    if grep -q "^main=" submission.hs ; then
   echo "Warning: submission.hs contains a definition of main"
   echo "Warning: attempting to recover..."
   echo "Warning: this may make the following test results misleading!"
   grep -vw "^main=" submission.hs > check_submission_temp_file.hs
  else
   if grep -q "^main " submission.hs ; then
    echo "Warning: submission.hs contains a definition of main"
    echo "Warning: attempting to recover..."
    echo "Warning: this make make the following test results misleading!"
    grep -vw "^main " submission.hs > check_submission_temp_file.hs
   else
    cat submission.hs > check_submission_temp_file.hs
   fi
  fi


  if grep -q "^blur" submission.hs; then
    cat 22tEx1.hs >> check_submission_temp_file.hs
    cat 22tEx2.hs >> check_submission_temp_file.hs
    ghc -v0 check_submission_temp_file.hs
    ./check_submission_temp_file
    rm check_submission_temp_file
   else
    echo "Warning: No implementation of blur detected, checking Ex 1 only."
    cat 22tEx1.hs >> check_submission_temp_file.hs
    echo "main = mainS >> mainE" >> check_submission_temp_file.hs
    ghc -v0 check_submission_temp_file.hs
    ./check_submission_temp_file
    rm check_submission_temp_file
  fi

  echo "Joe: If any line above does not begin with 'Joe:' there is a problem with your submission."
  echo "Joe: Make sure you have added all the files you need to, and committed."
  echo "Joe: If your submission is ready to be marked, make sure it is tagged correctly."
  echo "Joe: Here are the files currently added (not necessarily committed!):"

  git ls-files

else
  echo "ERROR: The file submission.hs does not exist!"
  echo "ERROR: Check your filenames!"
fi

