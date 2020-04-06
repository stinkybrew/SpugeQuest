import mysql.connector
import random

def parser(input_string):
    commands = ["Move", "take", "pickup", "Inspect", "Use", "Talk", "Enter", "Buy", "Rest", "iventory"]
    
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
        else:
            pickupitem(target)
    elif action == "talk" and target=="":
        print('Are you trying to talk with imagional frinds? Really, theres no one to talk with!')
    elif action == "inventory":
        inventory()
    else:
        print("what do you mean with that???")
        
    #Rest of the parser goes here
    return  


def inventory():
    print('under construcion')
    return


#Runs the calculation for event happening
def pheckifiventiappens():
    print("CheckIfEventHappens")
    
    #First check if the square is a special one like metro or stockmann
    #Then do a percentage calculation and check if any event happens
    #Return the happening event (maybe by string or id)

#Fetches the new square for player to move into, needs the square ID
def getnewsquare(sqrID):
    print("GetNewSquare")
    #Load the new square 

#Method for checking the direction where the player wants to move
def checkMovementValidityAndMove(direction):
    #Take player input and check if player can move there
    command = direction.split
    #Check if command [1] direction is found in the db and that it's available
    #If direction is valid return true
    #Else if direction is not valid return false

#Pick up item
def pickupitem(itemFound):
    print("Pickup Item Under Construction")
    print('pickuop item: ', itemFound)
    return

def CheckForGameOver():
    print("CheckForGameOver")
    #If blood alcohol = 0
        #Game over is true
        #Return true
    #Else if warmth = 0
        #Game over is true
        #Return true
    #If both are over 0 return false, no game over




#DB connection
db = mysql.connector.connect(host="127.0.0.1", user="user", passwd="pword", db="dbname", buffered=True)


# generate player location randomly
loc = random.randint(1,27)

action = ""
gameOver = False
#Print the initial message, commands

#Start the game loop
while gameOver == False:
    print("Start of a game")
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
    while canMove == false:
        inputDir = input("Where do you want to move next?")
        canMove = CheckMovementValidityAndMove(inputDir)
            
        if canMove == true:
            #Move player
            canMove = true
            break
        elif canMove == false:
            #Inform the player that the direction is wrong
            canMove = false
         
             

         
    #Load the square the player moves to
    #Run calculation for warmth and alcohol
    #If both are over 0 continue game, otherwise run game over
    gameOver = CheckForGameOver()
    if gameOver:
        gameOver = true
        #Loop breaks
        print("GameOver!!!")
    #Restart loop
    db.rollback()



