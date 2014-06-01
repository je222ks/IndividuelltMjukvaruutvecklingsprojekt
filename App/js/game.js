"use strict";

var Game = function () {    
    var canvas = document.getElementById("gamecont");
    var ctx = canvas.getContext("2d");
    var cols = 30;
    var rows = 20;
    var tileSize = 20;
    
    var tileSheet;
    
    // loading assets
    var loadingCount = 0;
    var itemsLeftToLoad = 1;
    
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
    
    // screens 
    var screenStart = false;
    
    
    // puts the app in various states
/*    var gameStateInit = 0;
    var gameStateAwaitLoad = 10;
    var gameStateTitle = 20;
    var gameStateNew = 30;
    var gameStateAwaitMove = 40;
    var gameStateAnimateMove = 50;
    var gameStateEvaluateMove = 60;*/
    
    var GameStates = {
        Init : 0,
        AwaitLoad : 10,
        Title : 20,
        New : 30,
        AwaitMove : 40,
        AnimateMove : 50,
        EvaluateMove : 60
    };
    
    var currentGameState = 0;
    var currentGameStateFunc = null;
    
    
    function runGame () {
        currentGameStateFunc();
    };
    
    
    function switchGameState (state) {
        currentGameState = state;
        switch(currentGameState) {
            case GameStates.Init :
                currentGameStateFunc = initState;
                break;
            case GameStates.AwaitLoad :
                currentGameStateFunc = awaitLoadState;
                break;
            case GameStates.Title :
                currentGameStateFunc = titleState;
                break;
            case GameStates.New :
                currentGameStateFunc = newGame;
                break;
            case GameStates.AwaitMove :
                currentGameStateFunc = readMovement;
                break;
            case GameStates.AnimateMove :
                currentGameStateFunc = animatePlayer;
                break;
            case GameStates.EvaluateMove :
                currentGameStateFunc = verifyMovement;
                break;
        }
    };
    
    
    // calls functions for testing purposes.
    /*createPlayField();
    renderMap();
    renderPlayer();
    readMovement();*/
    
    function awaitLoadState () {
        // just lets the switch-function call this function as the loading occurs. in other words, its empty.
    };
    
    function initState () {
        tileSheet = new Image();
        tileSheet.src = "../img/tiles.png";
        tileSheet.onload = itemLoad;
        
        switchGameState(GameStates.AwaitLoad);
    };
        
    function itemLoad () {
        loadingCount++;
        if (loadingCount >= itemsLeftToLoad) {
            switchGameState(GameStates.Title);
        }
    };
    
    function titleState () {
        if (screenStart !== true){
            fillBg();
            setTitleText();
            ctx.fillText ("Country Quiz", 250, 150);
            ctx.fillText ("Press space to start", 240, 200);
            
            screenStart = true;
        } else {
            // awaits the space click to start the game
            if (keyReads[32] === true){
                switchGameState(GameStates.New);
                screenStart = false;
            }
        };
    };
    
    function newGame () {
        console.log("sdfgsdffs");
        var playField = [];
        var items = [];
        createPlayField();
        renderPlayField();
        
        switchGameState(GameStates.AwaitMove);
    };
    
    
    
    
    function fillBg () {
        // fills the bg for title screen etc.
        ctx.fillStyle = "rgb(214, 193, 32)";
        ctx.fillRect(0, 0, 600, 400);
    };
    
    function setTitleText () {
        ctx.fillStyle = "#cddba0";
        ctx.font = "20px Arial";
        ctx.textBaseline = "top";
    };
    
    function renderPlayField () {
        fillBg();
        renderMap();
        renderPlayer();
    };
    
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
//                playField[randomRow][randomCol] = playerTile[1];
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
                      ctx.drawImage(tileSheet, 0, 0, 20, 20, c * 20, r * 20, 20, 20);
                  }
                  
                 ctx.drawImage(tileSheet, (tileCol * tileSize), (tileRow * tileSize), tileSize, tileSize, (c * tileSize), (r * tileSize), tileSize, tileSize); 
              }; 
           };
        };
    }; 
    
    function renderPlayer () {
        var tilesetImage = new Image();
        tilesetImage.src = "../img/tiles.png";
        tilesetImage.onload = drawImage;
        
        ctx.save();
        
        ctx.setTransform(1,0,0,1,0,0);
        ctx.translate(Player.colPos+10, Player.rowPos+10);
        
        function drawImage () {
            var sourceX = Math.floor(playerTile[Player.currentTile] % 5) * 20;
            var sourceY = Math.floor(playerTile[Player.currentTile] / 5) * 20;
            
            ctx.drawImage(tilesetImage, sourceX, sourceY, 20, 20, Player.colPos * 20, Player.rowPos * 20, 20, 20); 
        };
        
        ctx.restore();
    };

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
        obj.nextRowPos = obj.rowPos + incRow;
        obj.nextColPos = obj.colPos + incCol;
        
        // "sets borders"
        if (obj.nextColPos >= 0 && obj.nextColPos < 30 && obj.nextRowPos >= 0 && obj.nextRowPos < 20){
            obj.deltaX = incCol;
            obj.deltaY = incRow;
            
            // add "rotation" at least to some degree, 0 and 180 minimum for movement to the right and left.
            
            return true;
        } else {
            obj.nextColPos = obj.colPos;
            obj.nextRowPos = obj.rowPos;
            
            return false;
        };
    };
    
    function confirmMovement () {
        Player.destinationX = Player.nextColPos * 20;
        Player.destinationY = Player.nextRowPos * 20;
        switchGameState(GameStates.AnimateMove);
    };
    
    function animatePlayer () {
        Player.x += Player.deltaX*Player.speed;
        Player.y += Player.deltaY*Player.speed;
        Player.currentTile++;
        
        if (Player.currentTile === playerTile.length){
            Player.currentTile = 0;
        }
        
        renderMap();
        
        if (Player.x===Player.destinationX && Player.y===Player.destinationY){
            switchGameState(GameStates.AwaitMove);
        }
    };
    
    
    document.body.onkeydown = function (e) {
        e = e?e:window.event;
        keyReads[e.keyCode] = true;
    };
    
    document.body.onkeyup = function(e) {
        e = e?e:window.event;
        keyReads[e.keyCode] = false;
    };
    
    
    
    // launch
    switchGameState(GameStates.Init);
    var frameRate = 30;
    var intervalTime = 1000/frameRate;
    setInterval(runGame, intervalTime);
};

window.onload = Game;