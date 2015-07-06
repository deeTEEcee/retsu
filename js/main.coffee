game = new Phaser.Game(800, 600, Phaser.AUTO, 'retsu')



class Game
  preload: ->
    game.load.image('person', 'images/person.png')
    game.load.image('store', 'images/store.png'
  create: ->
    # display
    game.stage.backgroundColor = '#000000'
    game.add.text(90, 18, 'Line', { font: "bold 18px sans-serif", fill: "#fff", align: "center" })
    store = game.add.sprite( game.world.width/2, game.world.height - 10, 'store')
    # functionality
    players = self.createPlayers(10)
    myPlayer = aPlayerThatIsMe
    players.shift(myPlayer)
    gap = null # gap is the index for lining up, it doesn't exist
    lastAction = null
    score = 0
  update: ->
    player = player.closestTo(gap)
    nextPlayer = player.behind(player)

    # check if anyone from the front all the way to the end wants to move
    if player == myPlayer
      # what can i do
      lastAction = showMyOptionsAndPromptOneBeforeThingsHpapen #(move forward or stay still)
    else
      lastAction = player.action # some other player plays some action
    while lastAction
      player = nextPlayer
      nextPlayer = player.behind(nextPlayer)
      if player == myPlayer
        # what can i do
        lastAction = showMyOptionsAndPromptOneBeforeThingsHpapen #(move forward or stay still)
      else
        lastAction = player.action # some other player plays some action

    # if first person reached the store, then
    checkSomeoneReachedStore()
      # move myPlayer or to the back of the line
      # in the future, with multiple stores and deeper concepts, it would prompt you
    updateScore()

  createPlayers: (num) ->
    players = []
    x,y = storex+offset, storey+offset
    for i in num
      newPlayer = game.add.sprite(x,y,'person')
      players.shift(newPlayer)
      x += offset
      y += offset
    return players


game.state.add('Game', Game)
game.state.start('Game')




# var game = new Phaser.Game(800, 600, Phaser.AUTO, 'retsu-game');

# window.Utils = require('./utils');
# window.playerState = {
#     currentLevel: 'Game'
# }

# game.state.add('Boot', require('./states/boot'));
# game.state.add('Splash', require('./states/splash'));
# game.state.add('Preloader', require('./states/preloader'));
# game.state.add('Menu', require('./states/menu'));
# game.state.add('Game', require('./states/game'));

# game.state.start('Boot');
