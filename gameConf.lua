  gameConfig = {
  screenWidth = 16,
  screenHeight = 32,
  spacing = 2,
  ballInitialLocationX = love.graphics.getWidth()/2 - 40,
  ballInitialLocationY = love.graphics.getHeight()/2,
  ballRadius = 10,
  ballVx = 200,
  ballVy = 350,
  paddleStartX = 360,
  paddleStartY = 560,
  paddleWidth = 100,
  paddleHeight = 20,
  startLevel = 1,
  strikesLeft = 4
}

wallPatterns =   {  [1] = {{0,0},{1,0},{2,0},{3,0},{6,0},{7,0},{8,0},{1,1},{2,1},{3,1},{3,3}},                    
                    [2] = {{0,0},{1,0},{2,0},{6,0},{7,0},{0,5},{1,1},{3,3},{1,4},{3,4},{5,5}}, 
                    [3] = {{0,0},{1,1},{2,1},{6,3},{7,3},{0,5},{1,1},{3,3},{1,4},{2,2},{3,4},{5,5}} 
                   }