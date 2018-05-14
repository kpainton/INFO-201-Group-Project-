# Project Proposal

## Project Description
We’ll be working with the *_Global Shark Attack dataset_* collected by the Shark Research Institute. The Shark Research Institute is a scientific research organization founded in 1991 in Princeton, New Jersey. It was created to sponsor and conduct research on sharks ensuring and bringing awareness to their conservation.  This dataset aims to explore the significance of interactions between sharks and humans in comparison to the wide variety of dangers we are exposed to in our daily lives. Humans are not a prey to sharks, this dataset aims to give a better understanding of interactions between humans and sharks to minimize the risk of being injured by a shark and focusing on the importance of conserving all shark species. The dataset’s objective is to illustrate the actual threat that sharks present to humans, to convey the message that these creatures are not at all aggressive towards humans but our ignorance and belief in stereotypes have made us think otherwise.

The target audience of this dataset are _medical personnel_, _shark behaviourists_, _lifesavers_ and the _media_. The media would be a primary target audience to focus on. Researchers who gather this data conduct personal interviews with medical personnel, victims and witnesses to obtain a first-hand account of this incident. A forensic analysis is then conducted on the incident and reported accurately to the media to ensure that the stereotype of sharks naturally attacking humans being can one day be broken and inform the world that sharks are not as dangerous as the general population thinks.

Some specific questions we aim to answer
*1)* When do shark incidents usually occur?
*2)* Areas with the most incidents?
*3)* How fatal are the injuries?
*4)* Which are the deadliest sharks?

## Technical Description

  We will start out final project by downloading the shark attack data file (a .csv file) and placing this information into it's own directory.  By using the `read.csv` function, we will easily be able to store the information into our analysis files and work with/create our own `data frames`.  In order to have clean analysis, we will need to place values into empty cells and reformat our information, as many of the entries don't have matching names but very similar ones.  From there, we can condense the data into smaller data frames to make it easier to work with the information and pass this data set to different functions that we will create.  Additionally, we plan to add lat/long values to each row in order to have each attack's location marked as a point on a map.  Some of the major libraries that we plan on using are `plotly` (create interactive maps/graphs), `ggplot2` (create some scatter plots), and possibly `lubridate` (manipulate dates/time). 

  One of the biggest challenges that we anticipate is altering the data to have consistent information.  As stated above, many of the cells have similar information and finding a way to consolidate and group this data might be difficult.  Another challenge for this project will be building helpful and relevant charts that will have viewers be mindful of shark attacks but not be overwhelmed by the data.  We don't want our viewers to be completely afraid of swimming in popular beaches, but rather consider this data by presenting it in an *interactive* way.  One last challenge that we anticipate is how we will want to represent this information on a *map*.  With many of the locations representing land masses, we will need to find a way to "move" the location on the map from the land to the local beach where the attack took place or simply mark the nearest beach.  While these are relevant and difficult challenges, we believe that this data (after some adjustments) can be presented in a way that will effectively educate our viewers.
