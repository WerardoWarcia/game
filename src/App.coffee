Rect = require('./elements/Rect')
Stage = require('./data/stage')
Backgrounds = require('./elements/Backgrounds')
img = require('./assets/backgroun.png')
Hero = require('./elements/Hero')
FloorContainer = require('./elements/FloorCollectionView')
EnemieContainer = require('./elements/EnemieCollectionView')
PrizeContainer = require('./elements/PrizeCollectionView')
WinScreen = require('./elements/WinScreen')
win = require('./assets/youwin.png')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  floors: []
  enemies:[]
  prizes: []
  myStage: Stage
  hero: null
  #prize: null
  floor:null
  rect:null

  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener 'keypress', @OnKeyPress
    @preload()
  
  preload: =>
    PIXI.loader.add(img).load(@build)

  OnKeyPress: (evt)=>
      if evt.key == 's'
        @hero.speedY = 1
      if evt.key == 'w'
        @hero.speedY = -1
      if evt.key == 'd'
        @hero.speedX = 2
      if @bg.x == 20000  
      else 
        null 
      if evt.key == 'a'
        @hero.speedX = -2
        
  build:=>
    @floorContainer = new FloorContainer(@)
    @enemieContainer = new EnemieContainer(@)
    @prizeContainer = new PrizeContainer(@)
    @hero = new Rect @
    @bg = new Backgrounds(img)
    @win = new WinScreen(win)
    @stage.addChild( @floorContainer, @enemieContainer, @hero, @prizeContainer, @win)
    @addAnimationNodes(@enemieContainer)
    @animate()

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

  enemieCollision: (obj1, arr)->
      for n in arr
        if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x)
          if (obj1.y < n.y + n.height && obj1.y + obj1.height  > n.y)
            console.log 'otro gato xd'
            return n
      return false
      
  enemieToWallCollision: (enem, walls)->
    for n in enem
      for e in walls
        if (n.x < e.x + e.width && n.x + n.width > e.x)
          if (n.y < e.y + e.height && n.y + n.height  > e.y)
            if e.type is "ceiling"
              n.flag = true
            if e.type is "floor"
              n.flag = false
    return false
    
  prizeCollision:(obj1, arr)=>
    for n in arr
        if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x)
          if (obj1.y < n.y + n.height && obj1.y + obj1.height  > n.y)
            if n.alpha == 1
              obj1.score = obj1.score + 1
              n.alpha = 0
            console.log obj1.score
            if obj1.score == 7
              @win.alpha = 1
    for n in arr
      if obj1.muerto == true
        location.reload(true)


  animate:=>
    @ticker.add ()=>
      for n in @enemieContainer.children
        if !n.flag 
          n.y -= 3
          #n.x -= 3
        else
          n.y += 3
          #n.x += 3
      @enemieToWallCollision(@enemieContainer.children, @floorContainer.children)
      for n in @animationNodes
        n.animate?()
    null

module.exports = App
