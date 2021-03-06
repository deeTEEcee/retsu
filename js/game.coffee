# Player = require('./player')
OFFSET =
  X: 10,
  Y: 10

PLAYER =
  LENGTH: 30,
  HEIGHT: 40
  MAX_NUMBER: 6

PLAYER_ACTIONS =
  MOVE: "move"

STORE =
  LENGTH: 50,
  HEIGHT: 27
  SCORE: 100


class Game
  preload: ->
    # test = new Player
    # test.sayHello()
    @game.load.image('me', 'images/me.png')
    @game.load.image('person', 'images/person.png')
    @game.load.image('store', 'images/store.png')

    # whoosh sound for self moving up
    # punch sound for self being moved back
  create: ->
    # keyboard setup
    @input.keyboard.addCallbacks(@, @keyboardHandler, null, null)
    @awaitUserInput = false
    @userAction = null
    # display
    @game.stage.backgroundColor = '#000000'
    @game.add.text(90, 18, 'Line', { font: "bold 18px sans-serif", fill: "#fff", align: "center" })
    @scoreText = @game.add.text(500, 500, 'Score: 0', { font: "bold 18px sans-serif", fill: "#fff", align: "center" })
    @score = 0
    @store = @game.add.sprite(@game.world.width/2 - STORE.LENGTH, 0, 'store')
    # variable/objects setup
    @personInStore = null
    @firstPosition =
      x: @store.x + OFFSET.X
      y: @store.y + STORE.HEIGHT + OFFSET.Y
    # @lastPosition =
      # x: @firstPosition.x
      # y: @firstPosition.y + (PLAYER.HEIGHT + 5) * (PLAYER.MAX_NUMBER - 1)
    # functionality
    @line = @createPlayers(PLAYER.MAX_NUMBER)
    @me = @game.add.sprite(@firstPosition.x,@firstPosition.y + (PLAYER.HEIGHT + 5) * @line.length, 'me')
    @line.push(@me)
    # lastPlayer = @players[@players.length - 1]
    # @me = @game.add.sprite(lastPlayer.x,lastPlayer.y + PLAYER.HEIGHT + 5,'me')
    # myPlayer = aPlayerThatIsMe
    # players.shift(myPlayer)
    gap = null # gap is the index for lining up, it doesn't exist
    lastAction = null
    score = 0
    @game.time.events.loop(Phaser.Timer.SECOND / 4, @updateTurn, @)
    # console.log(@line.map((i) ->
    #   if i instanceof PIXI.DisplayObject
    #     return "i: " + i.children[0].text + "position: " + i.y
    #   else
    #     return i
    # ))

  updateTurn: ->
    ## TODO: this is only so while during testing we can have a delay to see what's going on
    ## TODO: if not bot, give extra points
    ## TODO: bot movements have to be random
    ##### check status but dont cause movement changes
    # make a decision for those who can move
    movable = null
    for i in [1..@line.length-1]
      movable = i if @line[i - 1] == null
    console.log(movable)

    #### move those who can move
    if movable
      player = @line[movable]
      if player == @me
        # ask for user input
        @awaitUserInput = true
        if !@userAction
          return
        else
          @line[movable - 1] = player
          @movedPerson = @line[movable - 1]
          @movedPerson.y = @firstPosition.y + (movable - 1) * (PLAYER.HEIGHT + 5)
          if movable == @line.length - 1
            @line.pop()
          else
            @line[movable] = null
      else
        @line[movable - 1] = player
        @movedPerson = @line[movable - 1]
        @movedPerson.y = @firstPosition.y + (movable - 1) * (PLAYER.HEIGHT + 5)
        if movable == @line.length - 1
          @line.pop()
        else
          @line[movable] = null
    else
      lastPerson = @personInStore
      @personInStore = @line[0]
      @personInStore.visible = false
      @line[0] = null
      if lastPerson
        if lastPerson == @me
          console.log('me')
          @score += STORE.SCORE
          @scoreText.text = 'Score: ' + @score
        # @line.push(@personInStore)
        # @personInStore.visible = true
        # @personInStore.y = @firstPosition.y + (@line.length - 1) * (PLAYER.HEIGHT + 5)
        @line.push(lastPerson)
        lastPerson.y = @firstPosition.y + (@line.length - 1) * (PLAYER.HEIGHT + 5)
        lastPerson.visible = true

    @userAction = null
    # console.log(@line.map((i) ->
    #   if i instanceof PIXI.DisplayObject
    #     return "i: " + i.children[0].text + "position: " + i.y
    #   else
    #     return i
    # ))

    # console.log(@line.map((i) ->
    #   if i instanceof PIXI.DisplayObject
    #     return "i: " + i.children[0].text + "position: " + i.y
    #   else
    #     return i
    # ))
  # update: ->
    # if @counter % 5 == 0
    #   console.log('run this shit')
    #   # make a decision for those who can move
    #   movable = []
    #   for i in [0..@line.length-1]
    #     if i==0 && !@playerInStore
    #       movable.push(i)
    #     else
    #       movable.push(i) if @line[i+1] == null

    #   # move those who can move
    #   for i in movable
    #     if i==0
    #       @playerInStore = @line[0]
    #       @line[0] = null
    #     @line[i - 1] = @line[i]

      # update new positions
      # for player, index in @line
        # console.log('p: ' +player+' i:'+ index)

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
  keyboardHandler: ->
    code = @input.keyboard.event.keyCode
    switch code
      when Phaser.Keyboard.P
        if @game.paused
          console.log('Game Unpaused')
          @game.paused = false
        else
          console.log('Game Paused')
          @game.paused = true
      when Phaser.Keyboard.UP
        if @awaitUserInput
          @userAction = PLAYER_ACTIONS.MOVE
          @awaitUserInput = false

  createPlayers: (num) ->
    players = []
    for i in [0...num]
      newPlayer = @game.add.sprite(@firstPosition.x,@firstPosition.y + (PLAYER.HEIGHT + 5) * i,'person')
      newPlayer.addChild(@game.add.text(0,0, i, {fontSize: '20px'}))
      players.push(newPlayer)
    return players

module.exports = Game
