#!/usr/bin./env bash
# this bash script calculates the number of files in the current directory
# then repeatedly asks the user to guess the number of files until the
# user guesses the correct number of files
# created:10/5/21
# author: R Wolf
function evaluate_guess() {
    if [[ $is_this_a_good_guess -eq "no" ]]
    then
        let guess_evaluation_result="no";
    else
        let guess_evaluation_result="yes";
    fi
}
# the count of files is created by first calling 'ls -p' which creates
# a simple list of files with a slash '/' appended to the name if it is
# a directory.  This simple list is piped to grep which picks out lines 
# which do not have a slash. Finally, wc counts the number of remaining lines
# which turns out to be the number of files in the current directory 
count_of_files=$(ls -p | grep -v / | wc -l)
let is_this_a_good_guess="no"
let guess_evaluation_result="no"
evaluate_guess
while [[ $guess_evaluation_result -eq "no" ]]
do
    echo "how many files do you guess are in the current directory?"
    read present_guess
    if [[ $count_of_files -eq $present_guess ]]
    then
	let is_this_a_good_guess="yes"
	echo "Congratulations! You guessed the right number!"
	exit
    else
# The 2nd bullet requirement "user should be advised their guess was either too low or too high". The following echo statement does exactly that. The requirement was not to specificaly tell the user their guess was too low or specifically tell the user that their guess was too high.
	echo "Your guess was either too low or too high. I won't tell you which."
	evaluate_guess
    fi
done
