class PrizeItemView extends PIXI.Graphics
    constructor: (model, container) ->
        super()
        @model = model
        @alpha = 1
        @container = container
        @container.addChild(@)
        @build()
    build:()=>
        @beginFill(@model.color)
        @drawRect(0, 0, @model.w, @model.h)
        @x = @model.x
        @y = @model.y
        @endFill()

module.exports = PrizeItemView
