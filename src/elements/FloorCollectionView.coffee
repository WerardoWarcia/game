Collection = require('./FloorCollection')
ItemView = require('./FloorItemView')

class FloorCollectionView extends PIXI.Container
    collection: Collection
    walls:[]
    floors:[]
    ceilings:[]
    constructor: (app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemView()

    buildItemView:()=>
        for model in @collection
            new ItemView(model, @)
        console.log @floors
module.exports = FloorCollectionView