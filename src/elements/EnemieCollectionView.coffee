Collection = require('./EnemieCollection')
ItemView = require('./EnemieItemView')

class EnemieCollectionView extends PIXI.Container
    collection: Collection
    enemies:[]
    constructor: (app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemView()

    buildItemView:()=>
        for model in @collection
            new ItemView(model, @)
        console.log @enemies
module.exports = EnemieCollectionView