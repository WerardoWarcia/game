class Floor extends PIXI.Graphics

    constructor:(x, y, c, w, h) ->
        super()
        @x = x
        @y = y
        @c = c
        @w = w
        @h = h
        @build()

    build:=>
        @beginFill(@c)
        @drawRect(0, 0, @w, @h)
        @endFill()
        @x = @x
        @y = @y

module.exports = Floor