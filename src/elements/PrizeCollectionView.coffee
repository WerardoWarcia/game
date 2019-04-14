Collection = require('./PrizeCollection')
ItemView = require('./PrizeItemView')

class PrizeCollectionView extends PIXI.Container
    collection: Collection
    constructor: (app) ->
        super()
        @app = app
        #@app.stage.addChild(@)
        @buildItemView()

    buildItemView:()=>
        for model in @collection
            new ItemView(model, @)

module.exports = PrizeCollectionView
        