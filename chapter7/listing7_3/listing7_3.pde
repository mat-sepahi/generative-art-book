Cell[][] _cellArray;     // two dimensional array of cells
int _cellSize = 10;      // size of each cell
int _numX, _numY;        // dimensions of grid
int gameMode = 0; 
int _width = 0;
int cleanRow = 0;
int cleanWidth = 4;
int maxColumn = 20;


void setup() { 
  size(1200, 800);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  println(_numX);
  //restart();
  frameRate(20);
  startup();
} 

void keyPressed() {
  gameMode = key - '0';
  println(gameMode);
}

void addRowBellow(){ 
  for(int y = 0; y < _numY; y++)
    for (int x = 0; x < _numX; x++)
      _cellArray[x][y].state = _cellArray[x][y].neighbours[3].state;
  for (int i = 0; i < _numX; i++){
    _cellArray[i][_numY-1].state = true;
  }
}

void startup(){
  _cellArray = new Cell[_numX][_numY];  
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {  
      Cell newCell = new Cell(x, y, false);  
      _cellArray[x][y] = newCell;     
    }        
  }          

  
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {  
      
      int above = y-1;    
      int below = y+1;    
      int left = x-1;      
      int right = x+1;      

      if (above < 0) { above = _numY-1; }  
      if (below == _numY) { below = 0; }  
      if (left < 0) { left = _numX-1; }  
      if (right == _numX) { right = 0; }  

     _cellArray[x][y].addNeighbour(_cellArray[left][above]);  
     _cellArray[x][y].addNeighbour(_cellArray[left][y]);    
     _cellArray[x][y].addNeighbour(_cellArray[left][below]);  
     _cellArray[x][y].addNeighbour(_cellArray[x][below]);  
     _cellArray[x][y].addNeighbour(_cellArray[right][below]);  
     _cellArray[x][y].addNeighbour(_cellArray[right][y]);  
     _cellArray[x][y].addNeighbour(_cellArray[right][above]);  
     _cellArray[x][y].addNeighbour(_cellArray[x][above]);    
    }
  }
    
}

void randomstart() {
  _cellArray = new Cell[_numX][_numY];	
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {	
      Cell newCell = new Cell(x, y, true);	
      _cellArray[x][y] = newCell;	   
    }				
  }					
  
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {	
      
      int above = y-1;		
      int below = y+1;		
      int left = x-1;			
      int right = x+1;			

      if (above < 0) { above = _numY-1; }	
      if (below == _numY) { below = 0; }	
      if (left < 0) { left = _numX-1; }	
      if (right == _numX) { right = 0; }	

     _cellArray[x][y].addNeighbour(_cellArray[left][above]);	
     _cellArray[x][y].addNeighbour(_cellArray[left][y]);		
     _cellArray[x][y].addNeighbour(_cellArray[left][below]);	
     _cellArray[x][y].addNeighbour(_cellArray[x][below]);	
     _cellArray[x][y].addNeighbour(_cellArray[right][below]);	
     _cellArray[x][y].addNeighbour(_cellArray[right][y]);	
     _cellArray[x][y].addNeighbour(_cellArray[right][above]);	
     _cellArray[x][y].addNeighbour(_cellArray[x][above]);		
    }
  }
}

void draw() {
  background(200);
  
  switch(gameMode){
    case 2:
      gameMode = 9;
      shiftRandom();
      break;
    case 4:
     gameMode = 9;
     addObject();
     break;
    case 0:
      gameMode = 9;
      addLine();
      break;
  }		
  			
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
       _cellArray[x][y].calcNextState();
    }
  }
  						
  translate(_cellSize/2, _cellSize/2);  	
						
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
     _cellArray[x][y].drawMe();
    }
  }
}


void addLine(){
  int lineX = round(random(_numX-2));
    for (int y = 0; y < _numY; y++){
    _cellArray[lineX][y].state = !_cellArray[lineX][y].state;
    _cellArray[lineX +1][y].state = !_cellArray[lineX +1][y].state;
  }
}

void addObject(){
  int centX = round(random(_numX));
  int centY = round(random(_numY));
  
  int radius = round(random(20)) + 5;
  for(int x = centX; x < radius + centX &&  x < _numX; x++)
    for (int y = centY; y < radius + centY & y < _numY; y++)
      if (random(4) <= 3)
        _cellArray[x][y].state = !_cellArray[x][y].state;
}

void shiftRandom(){
  int row = round(random(_numY));
  int magnitude = round(random(100)) - 50;
  println(magnitude);

  for ( int i = 0; i <= abs(magnitude) && magnitude != 0; i++)
    for (int j = row; j <= row+abs(magnitude) && j < _numY; j++) 
      if (magnitude > 0)
        for(int x = 0; x < _numX; x++)
            _cellArray[x][j].state = _cellArray[x][j].neighbours[5].state;
      else
        for(int x = _numX-1; x >= 0; x--)
            _cellArray[x][j].state = _cellArray[x][j].neighbours[1].state;
}

void mousePressed() {
  //restart();
  addRowBellow();
}

//================================= object

class Cell {
  float x, y;
  float ex, why;
  boolean state;  // on or off
  boolean nextState;  
  Cell[] neighbours;
  
  Cell(float ex, float why, boolean random) {
    this.ex = ex;
    this.why = why;
    x = ex * _cellSize;
    y = why * _cellSize;
    if (random){
      if (random(2) > 1)
        nextState = true;
      else
        nextState = false; 
    }
    else{
      nextState = false;
    }
    state = nextState;
    neighbours = new Cell[0];
  }
  
  void addNeighbour(Cell cell) {
    neighbours = (Cell[])append(neighbours, cell); 
  }
  
  void calcNextState() {
    
    switch (gameMode){
      case 0:
        nextState = state;
        //gameMode  =1;
        return;
      case 1:
        waveColumn();
        //if (_width > _numY*3 / 5){
        //  _width = 0;
          //gameMode = 2;
        //  return;
        //}
        return;
      case 3:
        randomClean();
        if (cleanRow == 2*_numY - 2)
          return;
        break;
      default:
        break;
    }
    concensus();
        
  }
  
  void concensus(){
    int liveCount = 0;
     if (state) { liveCount++; }     
     for (int i=0; i < neighbours.length; i++) {
       if (neighbours[i].state == true) {
         liveCount++;
       }
     }
       
     if (liveCount <= 4) {    
       nextState = false; 
     } else if (liveCount > 4) {
       nextState = true;
     }
        
     if ((liveCount == 4) || (liveCount == 5)) {  
       nextState = !nextState;
     } 
  }
  
  void randomClean(){
     float count = random(cleanWidth);
     Cell node = this;
     if (state && !neighbours[1].state && neighbours[5].state){
       for(float i = count; i >= 0; i--){
         node.nextState = false;
         node = node.neighbours[5];
       }
       cleanRow++;
     }
     else if (state && !neighbours[5].state && neighbours[1].state){
       for(float i = count; i >= 0; i--){
         node.nextState = false;
         node = node.neighbours[1];
       }
       cleanRow++;
     }
     
  }
  
  void waveColumn(){
    if (_width > maxColumn){
      _width = 0;
      gameMode = 9;
      return;
    }
    if (!state && (neighbours[1].state || neighbours[5].state))
      nextState = true;
    if (ex == 0 && why == 0){
      _width ++;
    }
  }


  
  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == true) {
      fill(0);
    } else {
      fill(255);
    }
    ellipse(x, y, _cellSize, _cellSize);
  }
  
}
