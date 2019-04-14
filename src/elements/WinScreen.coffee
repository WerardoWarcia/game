class WinScreen extends PIXI.Sprite.fromImage
    constructor: (img) ->
        super(img) 
        @width = window.innerWidth
        @height = window.innerHeight
        @alpha = 0
        
        
module.exports = WinScreen