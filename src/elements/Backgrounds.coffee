class Backgrounds extends PIXI.Sprite.fromImage
    constructor: (img) ->
        super(img)
        console.log 
        @width = window.innerWidth
        @height = window.innerHeight
        
        
module.exports = Backgrounds