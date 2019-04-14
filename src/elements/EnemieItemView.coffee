class EnemieItemView extends PIXI.Graphics
    constructor: (model, container, app) ->
        super()
        @app = app
        @model = model
        @container = container
        @container.addChild(@)
        @flag = false
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