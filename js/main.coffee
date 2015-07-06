game = new Phaser.Game(800, 600, Phaser.AUTO, 'retsu')

class Game
  preload: ->
    game.load.image('person', 'images/person.png')
  create: ->
    game.stage.backgroundColor = '#000000'
    game.add.text(90, 18, 'Retsu', { font: "bold 18px sans-serif", fill: "#fff", align: "center" })
  update: ->
    5+5+5

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
