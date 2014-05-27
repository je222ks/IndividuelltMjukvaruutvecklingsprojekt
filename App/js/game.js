"use strict";

var Background = function () {
    var canvas = document.getElementById("gamecont");
    var ctx = canvas.getContext("2d");
    var cols = 30;
    var rows = 20;
    var tileSize = 20;
    
    var tileSheet = new Image();
    tileSheet.src = "../img/tiles.png";
    
    // sets the canvas properly
    canvas.width = tileSize*cols;
    canvas.height = tileSize*rows;
    
    // playfield and item-collision arrays
    var playField = [];
    var items = [];
    // stores "movements"
    var keyReads = [];
    
    // tiles
    var playerTile = [2, 3];
    var groundTile = 0;
    var treeTile = 1;
    var questionTile = 4;
    var transparentTile = 5;
    

    // max limits
    var treeMax = 100;
    var playerMax = 1;
    var questionMax = 5;
    
    createPlayField();
    renderMap();
    renderPlayer();
    
    function createPlayField () {   
        var treeCount = 0;
        var playerCount = 0;
        var questionCount = 0;
        var groundCount = 0;
        
        // fill bg-array with "sand"
        for (var r = 0; r < 20; r++){
            var tempRow = [];
            for (var c = 0; c < 30; c++){
                tempRow.push(groundTile)
            }
            
            playField.push(tempRow);
        }
        console.log(playField);
        
        // fills an array to keep track of the items, making sure nothing collides on top of one another.
        for (r = 0; r < 20; r++){
            var tempItemRow = [];
            for (c = 0; c < 30; c++){
                tempRow.push(0);
            }
            items.push(tempRow);
        }
        
        // places trees
        var randomRow;
        var randomCol; 
        for (var t = 0; t < treeMax; t++){
            var treeLocFound = false;
            while(!treeLocFound){
                randomRow = (Math.random()*20) | 0; // according to this article http://blog.sklambert.com/create-a-canvas-tileset-background/#disqus_thread, the "or" operation is faster then using math.floor here, and therefor im using it.
                randomCol = (Math.random()*30) | 0;
                if (playField[randomRow][randomCol]===groundTile){
                    playField[randomRow][randomCol] = treeTile;
                    treeLocFound = true;
                }
            }
        }
        
        // places the player
        var playerLocFound = false;
        while(!playerLocFound){
            randomRow = (Math.random()*20) | 0;
            randomCol = (Math.random()*30) | 0;
            if (playField[randomRow][randomCol]===groundTile && items[randomRow][randomCol]===0){
                playerLocFound = true;
                // sets some attributes for the player object
                Player.colPos = randomCol;
                Player.rowPos = randomRow;
                Player.x = Player.colPos*20;
                Player.y = Player.rowPos*20; 
                
                // temporary since the seperate method wont render it...
                playField[randomRow][randomCol] = playerTile[1];
                // occupies the position in the item-arrray
                items[randomRow][randomCol] = 1;
            }
            
        }
        
        // places the question triggers
        for (var i = 0; i < questionMax; i++){
            var questionLocFound = false;
            while(!questionLocFound){
                randomRow = (Math.random()*20) | 0; 
                randomCol = (Math.random()*30) | 0;
                if (playField[randomRow][randomCol]===groundTile && items[randomRow][randomCol]===0){
                    playField[randomRow][randomCol] = questionTile;
                    questionLocFound = true;
                }
            }
        }
        
    };  
    
    function renderMap () {
        var tilesetImage = new Image();
        tilesetImage.src = "../img/tiles.png";
        tilesetImage.onload = drawImage;
        var tileSize = 20;       // The size of a tile (20×20)
        var rowTileCount = 20;   // The number of tiles in a row 
        var colTileCount = 30;   // The number of tiles in a column
        var imageNumTiles = 5;  // The number of tiles per row in the tileset image
        function drawImage () {
           for (var r = 0; r < rowTileCount; r++) {
              for (var c = 0; c < colTileCount; c++) {
                 var tile = playField[ r ][ c ];
                 var tileRow = (tile / imageNumTiles) | 0;
                 var tileCol = (tile % imageNumTiles) | 0;
                  
                  // renders ground in the background in case its something with a transparent bg
                  if (playField[ r ][ c ] != groundTile){
                      ctx.drawImage(tilesetImage, 0, 0, 20, 20, c * 20, r * 20, 20, 20);
                  }
                  
                 ctx.drawImage(tilesetImage, (tileCol * tileSize), (tileRow * tileSize), tileSize, tileSize, (c * tileSize), (r * tileSize), tileSize, tileSize); 
              }; 
           };
        };
    }; 
    
/*    function renderPlayer () {
        var tilesetImage = new Image();
        tilesetImage.src = "../img/tiles.png";
        tilesetImage.onload = drawImage;
        
        function drawImage () {

            
            var sourceX = (playerTile[Player.currentTile] % 5) | 0;
            var sourceY = (playerTile[Player.currentTile] / 5) | 0;
            
            ctx.fillStyle = "#00ff00"
            ctx.fillRect(sourceX, sourceY, 20, 20);
        }
    }*/

    // reads the keys pressed, arrows or wasd
    function readMovement () {
        if (keyReads[38]==true || keyReads[87]==true){
            // up
            if (verifyMovement(-1, 0, Player)){
                confirmMovement();
            }
        } else if (keyReads[40]==true || keyReads[83]==true){
            // down
            if (verifyMovement(1, 0, Player)){
                confirmMovement();
            }
        } else if (keyReads[37]==true || keyReads[65]==true){
            // left
            if (verifyMovement(0, -1, Player)){
                confirmMovement();
            }
        } else if (keyReads[39]==true || keyReads[68]==true){
            // right
            if (verifyMovement(0, 1, Player)){
                confirmMovement();
            }
        }
    };
    
    function verifyMovement (incRow, incCol, obj) {
        
    };
    
    function confirmMovement () {
        
    };
    
};
          
window.onload = Background;