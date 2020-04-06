import mysql.connector
import random
import time


def parser(input_string):
    commands = ["move", "help", "take", "pickup", "Inspect", "Use", "Talk", "Enter", "Buy", "Rest", "iventory", "show"]
    
    if len(input_string)>=1:
        action = input_string[0].lower()
    else:
        action = ""
    if len(input_string)>=2:
        target = input_string[len(input_string)-1].lower()
    else:
        target = ""
    print("action was: " , action)
    print('target is: ', target)
    if action == "take" or "pickup":
        if target=="":
            print("You are not targetting enything!")
    elif action == "talk" and target=="":
        print('Are you trying to talk with imagional frinds? Really, theres no one to talk with!')
    if action == "move":
        ourGoal = checkMovementValidityAndMove(target)
    if action == "show":
        showDirections()
    if action == "help":
        HELP()
    if action == "inventory":
        inventory()
    else:
        print("what do you mean with that???")
        
    #Rest of the parser goes here
    return  


#inventory kysely
def inventory():
    print('lol')
    cur = db.cursor()
    sql = "SELECT item.ID_type, item_type.name from item_type, item, charracter\
    where item_type.ID_type = item.ID_type\
    and item.ID_charracter = charracter.ID;"
    cur.execute(sql)
    print('lol2')
    result = cur.fetchall()
    if cur.rowcount >=0:
        for row in result:
            print(row[1])
            print('-'*155)
    else:
        print('You dont have eny items with ya.')
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
        warmth()
        print_warmth()
        alcohol()
        print_alcohol()
        location_name()
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


#update charracter position
def updatePlayerPos(newLoc):
    cur = db.cursor()
    print("New loc " + str(newLoc))
    sql = "SELECT ID_room FROM charracter"
    cur.execute(sql)
    if cur.rowcount >=1:
        sql = "UPDATE charracter SET ID_room = '"+str(newLoc)+"';"
        cur.execute(sql)
        #tulostetaan secter square    
        secret()    
    return

#print location default_text
def location_name():
    print('-'*155)
    cur = db.cursor()
    sql = "SELECT default_text\
    FROM room,charracter\
    WHERE charracter.ID_room = room.ID_room;"
    cur.execute(sql)
    result = cur.fetchall()
    if cur.rowcount >=0:
        for row in result:
            print(row[0])
    else:
        print('')
#HELP!!
def HELP():
    commands = ["move", "help", "take", "pickup", "Inspect", "Use", "Talk", "Enter", "Buy", "Rest", "iventory", "show"]
    print('-'*155)
    print('Vailable actions are: ')
    print (*commands[0:6], sep=', ')
    print (*commands[6:12], sep=', ')
    print('-'*155)
    print('')
    return

#Tulostetaan warmth pelaajalle.
def print_warmth():
    print('-'*155)
    cur = db.cursor()
    sql = "SELECT warmth FROM charracter;"
    cur.execute(sql)
    result = cur.fetchall()
    if cur.rowcount >=0:
        print('charracter warmth: ')
        for row in result:
            print(row[0])
            print('-'*155)  
    else:
        print('höyy')
        print('-'*155)
    return

#Vähennä charracterin ruumiinlämpöä 5:llä asteella.
def warmth():
    cur = db.cursor()
    sql = "UPDATE charracter SET warmth = warmth - 5;"
    cur.execute(sql)           
    return


def print_alcohol():
    cur = db.cursor()
    #Tulostetaan warmth pelaajalle.
    sql = "SELECT alcohol FROM charracter;"
    cur.execute(sql)
    result = cur.fetchall()
    if cur.rowcount >=0:
        print('charracter blood alcohol: ')
        for row in result:
            print(row[0])  
    else:
        print('höyy')
        print('-'*155)
    return


#Vähennä charracterin ruumiinlämpöä 5:llä asteella.
def alcohol():
    cur = db.cursor()
    sql = "UPDATE charracter SET alcohol = alcohol - 5;"
    cur.execute(sql)   
    return

#rappukäytävä
def corridore():
    x = random.randint(1,5)
    if x == 1:
        n = str(input('You see a corrodore next to you. Would you like to go in and warm your frozen fingers? '))
        if n == str("yes"):
            cur = db.cursor()
            sql = "UPDATE charracter SET warmth = warmth + 20;"
            cur.execute(sql)
            time.sleep(1)
            print('z')
            time.sleep(1)
            print('Z')
            time.sleep(1)
            print('z')
            time.sleep(1.)
            print('Z')
            time.sleep(1)
            print('z')
            print('')
            print('ahh... you feel much warmer now ')
        elif n == str('no'):
                print('*'*3)
                print('It looks warmy place, but you are in a hurry to see more in this cold city ')
                print('-'*155)
    else:
        print('-'*155)
    return

#Pelihahmon veren alkoholin nousu eventti
def update_alcohol():
    cur = db.cursor()
    sql = "UPDATE charracter SET alcohol = alcohol + 20;"
    cur.execute(sql)
    result = cur.fetchall()
    if cur.rowcount >0:
        print('you can feel the alcohol flow through your veins ')
        for row in result:
            print(row[0])
    else:
        print('')
    return



#Open path to secter square28 from square23 and back
def secret():
    print('ITs A SECTER! testi!')
    if loc == 23 and coins >= 100:
        cur = db.cursor()
        sql = "UPDATE gamemap SET north = 28\
        WHERE curroom = 23\
        UPDATE gamemap SET south = 23\
        WHERE curroom = 28;"
        cur.execute(sql)
        print('ITs A SECTER!')
    else:
        print('')
    return

#DB connection
db = mysql.connector.connect(host="127.0.0.1", user="testuser", passwd="test1", db="spugequest", buffered=True)


# generate player location randomly
loc = random.randint(1,27)
loc = 24
coins = 100
#tulostetaan updatePlayerPos
updatePlayerPos(loc)


action = ""
gameOver = False
#Print the initial message, commands
print("Start of a game")
#tulostetaan location name
location_name()
print('')
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
    



