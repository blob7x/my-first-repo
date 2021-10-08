README.md: guessinggame.sh
	touch README.md
	echo "A Bash Shell Based Guessing Game" >>README.md
	date >>README.md
	cat guessinggame.sh | wc -l >> README.md
	
