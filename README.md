# Shark Attacks - Final Project

Here you can find our final project on shark attacks from group BB3: https://kpainton.shinyapps.io/Shark-Attacks-INFO201-FINAL-Group-BB-3/.  The website is best viewed when the browser is in full screen. 

## Project Description
We’ll be working with the *_Global Shark Attack dataset_* collected by the Shark Research Institute. The Shark Research Institute is a scientific research organization founded in 1991 in Princeton, New Jersey. It was created to sponsor and conduct research on sharks ensuring and bringing awareness to their conservation. This dataset aims to explore the significance of interactions between sharks and humans in comparison to the wide variety of dangers we are exposed to in our daily lives. Humans are not a prey to sharks, this dataset aims to give a better understanding of interactions between humans and sharks to minimize the risk of being injured by a shark and focusing on the importance of conserving all shark species. The dataset’s objective is to illustrate the actual threat that sharks present to humans, to convey the message that these creatures are not at all aggressive towards humans but our ignorance and belief in stereotypes have made us think otherwise.

Those who may be interested in using this dataset would vary from _medical personnel_, _shark behaviorists_, _divers_, _lifesavers_ to the _media_. The media would be a major target audience to focus on. Researchers who gather this data conducted personal interviews with medical personnel, victims and witnesses to obtain a first-hand account of this incident. After forensic analysis is conducted on the incident, it can then be reported accurately through the media to answer the public's question of whether the stereotype of sharks naturally attacking humans is true or merely a misconception. If proven a false stereotype, the media can inform the world (their target audience) that sharks are not as dangerous as the general population thinks.

Here is a list of specific questions we aim to answer through our project:

*1)* When do shark incidents usually occur?

*2)* Where are the areas most prone to shark attacks?

*3)* How fatal are most of the injuries and on average?

*4)* Which are the deadliest sharks?

*5)* What is the likelihood of unprovoked sharks attacking humans?

*6)* What type of situation or activity incites shark attack the most?

*7)* Is there a certain time of day when the incidents tend to occur?

*8)* Is there a certain season or month of the year when the incidents tend to occur?





## Technical Description

  We will start out final project by downloading the shark attack data file (a .csv file) and placing this information into it's own directory.  By using the `read.csv` function, we will easily be able to store the information into our analysis files and work with/create our own `data frames`.  In order to have clean analysis, we will need to place values into empty cells and reformat our information, as many of the entries don't have matching names but very similar ones.  From there, we can condense the data into smaller data frames to make it easier to work with the information and pass this data set to different functions that we will create.  Additionally, we plan to add lat/long values to each row in order to have each attack's location marked as a point on a map.  Some of the major libraries that we plan on using are `plotly` (create interactive maps/graphs), `ggplot2` (create some scatter plots), and possibly `lubridate` (manipulate dates/time).

  One of the biggest challenges that we anticipate is altering the data to have consistent information.  As stated above, many of the cells have similar information and finding a way to consolidate and group this data might be difficult.  Another challenge for this project will be building helpful and relevant charts that will have viewers be mindful of shark attacks but not be overwhelmed by the data.  We don't want our viewers to be completely afraid of swimming in popular beaches, but rather consider this data by presenting it in an *interactive* way.  One last challenge that we anticipate is how we will want to represent this information on a *map*.  With many of the locations representing land masses, we will need to find a way to "move" the location on the map from the land to the local beach where the attack took place or simply mark the nearest beach.  While these are relevant and difficult challenges, we believe that this data (after some adjustments) can be presented in a way that will effectively educate our viewers.
