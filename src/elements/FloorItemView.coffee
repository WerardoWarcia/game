class FloorItemView extends PIXI.Graphics
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
        @alpha = 0.5
        @type = @model.type
        #switch @type
        #    when 'wall'
        #        @container.walls.push @
        #    when 'floor'
        #        @container.floors.push @
        #        console.log 'new floor'
        #    when 'ceilings'
        #        @container.ceilings.push @
        #    when 'all'
        #        @container.ceilings.push @
        #        @container.floors.push @
        #        @container.walls.push @
        #
        #
        #    else 
        #        
        @endFill()

module.exports = FloorItemView
        
