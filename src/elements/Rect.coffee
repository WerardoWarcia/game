class Rect extends PIXI.Graphics
    color: '0x39ff14'
    w : 20
    h : 20
    speedX: 0
    speedY: 0
    type: null
    onGround: false
    constructor: (app)->
        super()
        @app = app
        @build()
    build:=>
        @beginFill(@color)
        @drawRect(0,0,@w,@h)
        @endFill()
        @x= 250
        @y= 240
        @app.addAnimationNodes(@)
    animate:=>
        @x += @speedX
        @y += @speedY
        #@speedY += .9
        #wall = @app.collision(@, @app.floorContainer.walls)
        #floor = @app.collision(@, @app.floorContainer.floors)
        #
        #if wall && !floor
        #    if @x > wall.x
        #        @x = wall.x + wall.width
        #if @app.collision(@, @app.floorContainer.ceilings)
        #    console.log '¿cuál techo?'
        
        #if floor
        #    @speedY = 0
        #    @y = floor.y - @width
        
        if @app.collision(@, @app.floorContainer.children)
            @x = 250
            @y = 240
            @speedY = 0
            @speedX = 0
        if @app.collision(@, @app.enemieContainer.children)
            console.log 'un enemigo'
module.exports = Rect