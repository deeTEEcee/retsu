Player = require('./player')
OFFSET =
  X: 10,
  Y: 10

PLAYER =
  LENGTH: 30,
  HEIGHT: 40


STORE =
  LENGTH: 50,
  HEIGHT: 27

class Game
  preload: ->
    test = new Player
    test.sayHello()
    @game.load.image('me', 'images/me.png')
    @game.load.image('person', 'images/person.png')
    @game.load.image('store', 'images/store.png')

    # whoosh sound for self moving up
    # punch sound for self being moved back
  create: ->
    # display
    @game.stage.backgroundColor = '#000000'
    @game.add.text(90, 18, 'Line', { font: "bold 18px sans-serif", fill: "#fff", align: "center" })
    @store = @game.add.sprite(@game.world.width/2 - STORE.LENGTH, 0, 'store')
    # functionality
    @players = @createPlayers(6)
    lastPlayer = @players[@players.length-1]
    @me = @game.add.sprite(lastPlayer.x,lastPlayer.y + PLAYER.HEIGHT + 5,'me')
    # myPlayer = aPlayerThatIsMe
    # players.shift(myPlayer)
    gap = null # gap is the index for lining up, it doesn't exist
    lastAction = null
    score = 0
  update: ->
    # player = player.closestTo(gap)
    # nextPlayer = player.behind(player)

    # # check if anyone from the front all the way to the end wants to move
    # if player == myPlayer
    #   # what can i do
    #   lastAction = showMyOptionsAndPromptOneBeforeThingsHpapen #(move forward or stay still)
    # else
    #   lastAction = player.action # some other player plays some action
    # while lastAction
    #   player = nextPlayer
    #   nextPlayer = player.behind(nextPlayer)
    #   if player == myPlayer
    #     # what can i do
    #     lastAction = showMyOptionsAndPromptOneBeforeThingsHpapen #(move forward or stay still)
    #   else
    #     lastAction = player.action # some other player plays some action

    # # if first person reached the store, then
    # checkSomeoneReachedStore()
    #   # move myPlayer or to the back of the line
    #   # in the future, with multiple stores and deeper concepts, it would prompt you
    # updateScore()

  createPlayers: (num) ->
    x = @store.x+OFFSET.X
    y = @store.y+STORE.HEIGHT+OFFSET.Y
    players = []
    for i in [0..num]
      newPlayer = @game.add.sprite(x,y,'person')
      players.push(newPlayer)
      y += PLAYER.HEIGHT + 5
    return players

module.exports = Game
