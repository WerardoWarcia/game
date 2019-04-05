Adventurerdata = require('../assets/adventurer.json')
Adventurerimage = require('../assets/adventurer.png')
app = require('../App.coffee')

class Hero
    x:300
    y:330
    idle:null
    run:null
    jump:null
    app:null
    scale: 4
    animationSpeed: 0.1
    speedX:0
    speedY:0

    constructor: (app) ->
        @app = app
        PIXI.loader.add(Adventurerdata).load(@build)
    build: ()=>
        frames = []
        for i in [0...4] by 1
            frames.push(PIXI.Texture.fromFrame("adventurer-idle-2-0#{i}.png"))
        @idle = new PIXI.extras.AnimatedSprite(frames)
        @idle.scale.x = @scale
        @idle.scale.y = @scale
        @idle.x = @x
        @idle.y = @y
        @idle.animationSpeed = @animationSpeed
        @idle.play()
        #console.log @idle.transform.pivot._x, @idle.transform.pivot._y
        @idle.transform.pivot._x =25
        @idle.transform.pivot._y =25
        @width = @idle.width
        @height = @idle.height

        
        frames = []
        for i in [0...5] by 1
            frames.push(PIXI.Texture.fromFrame("adventurer-run-0#{i}.png"))
        @run = new PIXI.extras.AnimatedSprite(frames)
        @run.scale.x = @scale
        @run.scale.y = @scale
        @run.x = @x
        @run.y = @y
        @run.animationSpeed = @animationSpeed
        @run.play()
        @run.alpha = 0
        player = new PIXI.Graphics
        player.beginFill('red')
        player.drawRect(0,0, @idle.width, @idle.height)
        @run.transform.pivot._x =25
        @run.transform.pivot._y =25
        player.x = @idle.x
        player.y = @idle.y
        @app.addAnimationNodes(@)
        #console.log player.width
        #@app.stage.addChild(player)

        frames = []
        for i in [0...4] by 1
            frames.push(PIXI.Texture.fromFrame("adventurer-jump-0#{i}.png"))
        @jump = new PIXI.extras.AnimatedSprite(frames)
        @jump.scale.x = @scale
        @jump.scale.y = @scale
        @jump.alpha = 0
        @jump.x = @x
        @jump.y = @y
        @jump.loop = false
        @jump.animationSpeed = @animationSpeed
        #@jump.play()
        @jump.transform.pivot._x =25
        @jump.transform.pivot._y =25
        @app.addAnimationNodes(@)

        @app.stage.addChild(@idle)
        @app.stage.addChild(@run)
        @app.stage.addChild(@jump)

 

    animate: ()=>
        @app.collision(@, @app.floorContainer.children)
        @run.x += @speedX
        #@idle.rotation += .1
        #@run.rotation += .1
        @idle.x = @run.x

        


module.exports = Hero
        