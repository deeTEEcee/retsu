LATEST UPDATE:
State in Store: have to be in the store for a little whiel
State A: Delay State (spot ahead has opened up but we will set a delay to allow the player to be ready)
State B: Responsive State (players behind can yell at lower your score)
State C: Danger State (player directly behind has the option to kick you back, which does not lower your score but gives you a strike. you get a max of "N" strikes before you are kicked out of the line altogether. The player who has the option to kick suffers a percentage of the yelling in the back)

 This becomes more of a pressure game along with casual parts now. After the person moves to the next open spot, we have state A. After state A's delay seconds occur, during state B, the next person has "X" seconds to respond while his score gets lowered. If "X" seconds passes and he does not respond right away, we enter into state C, where he can get punished further by being kicked backed several positions (depending on the size of the )

This leaves room open for the following:
- ways to adjust the score
- motivation for everyone to be more active while playing
- problem is people may be too active so we need a way to make people.. get lazy in the game, or should we just assume they'll be lazy sometimes.. that mighit be good enough
- we can give options to increase how strong the "kicks can be"
- passing grandmas along the line? always an option to further delay the person in front.. so many ideas!


TODO
* for now, make a list of AI players along with you for single player (10, then 100, then 1000 along with how to fix the display, see next part)
* for now, we'll generate all the players but we later need to implement being able to scroll up and down with cameras

Notes
* think of where to store data and/or what to use as a server (meteor.js, others?)
* camera angles and good views? for now, make a single straight line up the middle like in this one. in fact, reference this one and the other games on the site, i like their graphics: http://www.ferryhalim.com/orisinal/g3/carrot.htm
* concept of multiple stores
* concept of cash shop

Dev/Deploy
- using http-server by node.js to develop locally

Phaser Issues
- onDownCallback detects arrow keys but onPress does not...
