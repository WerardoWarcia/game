class Prize extends PIXI.Graphics
    color: "0x00ffcc"
    w: 20
    h: 20

    constructor: ()->
        super()
        @build()
    build:=>
        @beginFill(@color)
        @drawRect(0,0,@w,@h)
        @endFill()
        @x = 1700
        @y = 800
module.exports = Prize
