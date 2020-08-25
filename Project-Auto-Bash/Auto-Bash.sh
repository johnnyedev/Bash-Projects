#!/bin/bash

# This asks what the user wants to name the bash script
# echo -n  "What do you want to name the bash script?"

# This reads the answer to the above question and savesa it as the variable $answer
# read answer

# This creates the file with the name that the user provided
# touch $answer.sh

# This changes the permissions on the created file to 644 so that it can be ran
# chmod 644 $answer.sh

# This adds line 1 bash prompt
# echo "#!/bin/bash" >> $answer.sh

# This messages the user that the script has completed.

# echo "Created $answer bash script!"



### Below is a one liner version of the script ###
echo -n "What do you want to name the bash script?" && read answer && touch $answer.sh && chmod 644 $answer.sh && echo "#!/bin/bash" >> $answer.sh && echo "Created $answer bash script!"
