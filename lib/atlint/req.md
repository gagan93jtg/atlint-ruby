======Requirement====

Initial size  = 3
4 direction movement 
5 step movement increases size by 1
game over when
  hitting own body
hitting the wall doesn't end the game
we're starting from top left
size of board = square of size 10x10

interface SnakeGame {
    moveSnake(snakeDirection);
    isGameOver();
}



Entities

1. Snake (int positions[], int size, int current_growth)
2. Board (int size, int matrix[][])
3. Game  (bool running) 
4. Runner (Starting point of the app)
