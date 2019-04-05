Rect = require('./elements/Rect')
Stage = require('./data/stage')
Backgrounds = require('./elements/Backgrounds')
img = require('./assets/backgroun.png')
Hero = require('./elements/Hero')
FloorContainer = require('./elements/FloorCollectionView')
EnemieContainer = require('./elements/EnemieCollectionView')
#Floor = require('./elements/Floor')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  floors: []
  enemies:[]
  myStage: Stage
  hero: null
  floor:null
  rect:null

  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener 'keypress', @OnKeyPress
    window.addEventListener 'keyup', @OnKeyUp
   
    
    @preload()
  
  preload: =>
    PIXI.loader.add(img).load(@build)

  OnKeyUp: (evt)=>
    null

    

  OnKeyPress: (evt)=>
      if evt.key == 's'
        @hero.speedY = 1
      if evt.key == 'w'
        @hero.speedY = -1
      if evt.key == 'd'
        @hero.speedX = 1
      if @bg.x == 20000  
      else 
        null 
      if evt.key == 'a'
        @hero.speedX = -1
        
  build:=>
    @floorContainer = new FloorContainer(@)
    @enemieContainer = new EnemieContainer(@)
    @hero = new Rect @
    @bg = new Backgrounds(img)
    @stage.addChild(@bg, @floorContainer, @enemieContainer)
    @animate()
    @stage.addChild(@hero)
    

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  collision: (obj1, arr)->
    for n in arr
      if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x)
        if (obj1.y < n.y + n.height && obj1.y + obj1.height  > n.y)
          console.log 'choqué'
          return n
    return false
          
  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()
    null

module.exports = App
