Replacing common words in the bible with tech hype, especially “smart city” related terminology.



bibleEN.R 

Loads the raw text version of the bible, the substitution list and replaces the terms.
Then loads necessary bits for a latex layout, and outputs a latex file considering testaments and chapters in the bible as latex parts and chapters .  

	
biblesub.csv 

contains the list of substitutions. The order of the rows is sometimes important (e.g. replace “Jesus Christ” before “Jesus”). When adding substitutions be careful with words appearing as different word types (e.g. fear as a noun but also as a verb)

	
*.tex 

elements for the final latex layout created in R