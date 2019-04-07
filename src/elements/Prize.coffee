class Prize extends PIXI.Graphics
    color: "0x00ff00"
    w: 20
    h: 20

    constructor: ()->
        super()

        @build()
    build:=>
        @begiinFill(@color)
        @drawRect(0,0,@w,@h)
        @endeFill
        @x = 800
        @y = 800
        module.exports = Prize
