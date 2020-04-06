import mysql.connector
import random

def parser(input_string):
    commands = ["move", "take", "pickup", "Inspect", "Use", "Talk", "Enter", "Buy", "Rest", "iventory", "show"]
    
    if len(input_string)>=1:
        action = input_string[0].lower()
    else:
        action = ""
    if len(input_string)>=2:
        target = input_string[len(input_string)-1].lower()
    else:
        target = ""
    print("action" , action)
    print('target', target)
    if action == "take" or "pickup":
        if target=="":
            print("what do you mean with that?")
    elif action == "talk" and target=="":
        print('Are you trying to talk with imagional frinds? Really, theres no one to talk with!')
    elif action == "inventory":
        inventory()
    if action == "move":
        ourGoal = checkMovementValidityAndMove(target)
    if action == "show":
        showDirections()
    else:
        print("what do you mean with that???")
        
    #Rest of the parser goes here
    return  


def inventory():
    print('under construcion')
    return

def showDirections():
    sql = "SELECT north,south,west,east, ID_room FROM gamemap, charracter WHERE curroom = charracter.ID_room"
    cur = db.cursor()
    cur.execute(sql)
    playerdirection = ""
    if cur.rowcount>=1:
        result = cur.fetchall()
        for row in result:
            playerdirs = row
            print(playerdirs)

#Runs the calculation for event happening
def pheckifiventiappens():
    print("CheckIfEventHappens")
    
    #First check if the square is a special one like metro or stockmann
    #Then do a percentage calculation and check if any event happens
    #Return the happening event (maybe by string or id)

#Method for checking the direction where the player wants to move
def checkMovementValidityAndMove(direction):
    cur = db.cursor()
    #Take player input and check if player can move there
    command = direction.split
    #Check if command [1] direction is found in the db and that it's available
    
    sql = "SELECT north, south, east, west, ID_room, curroom FROM gamemap, charracter WHERE charracter.ID_room = curroom"
    cur.execute(sql)
    playerdirection = ""
    if cur.rowcount>=1:
        print("Directions found")
        result = cur.fetchall()
        print("All directions are " + str(result))
        if direction == "north":
            playerdirection = result[0][0]
        if direction == "south":
            playerdirection = result[0][1]
            print(result[0][1])
        if direction == "east":
             playerdirection = result[0][2]
        if direction == "west":
            playerdirection = result[0][3]

    print(playerdirection)
    if playerdirection != 0:
        updatePlayerPos(playerdirection)
    elif playerdirection == 0:
        print("Movement not available")
    return playerdirection

#Pick up item
def pickupitem(itemFound):
    print("Pickup Item Under Construction")
    print('pickuop item: ', itemFound)
    return

def CheckForGameOver():
    print("CheckForGameOver")
    return False
    #If blood alcohol = 0
        #Game over is true
        #Return true
    #Else if warmth = 0
        #Game over is true
        #Return true
    #If both are over 0 return false, no game over


def updatePlayerPos(newLoc):
    cur = db.cursor()
    print("New loc " + str(newLoc))
    sql = "SELECT ID_room FROM charracter"
    cur.execute(sql)
    if cur.rowcount >=1:
        sql = "UPDATE charracter SET ID_room = '"+str(newLoc)+"';"
        cur.execute(sql)

#DB connection
db = mysql.connector.connect(host="127.0.0.1", user="root", passwd="root", db="spugequest", buffered=True)


# generate player location randomly
loc = 2
updatePlayerPos(loc)

action = ""
gameOver = False
#Print the initial message, commands
print("Start of a game")
#Start the game loop
while gameOver == False:
    
    input_string=input("what would you like to do?: ").split()
    print("")
    parser(input_string)
    
    #Run event calculating
    #Run the event that happens
    #Change items available in square etc (for example if bottle found)
    #Print out message for the player to know what happens/happened
        
    #Wait for player input & process it
        #If player moves before interacting with event
            #Move player to the next square
        #Else If player interacts with event
            #Run the consequences
        
    #Wait for movement command and process it
         
             

         
    #Load the square the player moves to
    #Run calculation for warmth and alcohol
    #If both are over 0 continue game, otherwise run game over
    gameOver = CheckForGameOver()
    if gameOver:
        gameOver = true
        #Loop breaks
        print("GameOver!!!")
        db.rollback()
    #Restart loop
    



