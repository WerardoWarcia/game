class EnemieItemView extends PIXI.Graphics
    constructor: (model, container) ->
        super()
        @model = model
        @container = container
        @container.addChild(@)
        @build()
    build:()=>
        @beginFill(@model.color)
        @drawRect(0, 0, @model.w, @model.h)
        @x = @model.x
        @y = @model.y
        @alpha = 1
        @type = @model.type        
        @endFill()
    

module.exports = EnemieItemView