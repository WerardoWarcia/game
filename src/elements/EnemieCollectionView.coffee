Collection = require('./EnemieCollection')
ItemView = require('./EnemieItemView')

class EnemieCollectionView extends PIXI.Container
    collection: Collection

    constructor: (app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemView()

    buildItemView:()=>
        for model in @collection
            new ItemView(model, @)
        
        #for n in @children
        #    console.log n



module.exports = EnemieCollectionView