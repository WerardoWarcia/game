class Rect extends PIXI.Graphics
    color: '0x39ff14'
    w : 20
    h : 20
    speedX: 0
    speedY: 0
    type: null
    onGround: false
    alpha: 1
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
        if @app.collision(@, @app.floorContainer.children)
            @x = 250
            @y = 240
            @speedY = 0
            @speedX = 0
        if @app.enemieCollision(@, @app.enemieContainer.children)
            @x = 250
            @y = 240
            @speedY = 0
            @speedX = 0

module.exports = Rect