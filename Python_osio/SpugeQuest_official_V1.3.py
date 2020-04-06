import mysql.connector, random, time, sys, os

invalid_input = True
def start():
    
    def parser(input_string):
        commands = ["move", "exit", "quit", "help", "take", "pickup", "Inspect", "drink" "Use", "Talk", "Enter", "Buy", "Rest", "inventory", "show"]
        
        if len(input_string)>=1:
            action = input_string[0].lower()
        else:
            action = ""
        if len(input_string)>=2:
            target = input_string[len(input_string)-1].lower()
        else:
            target = ""
        if action == "inventory":
            inventory()
            inventory_coin()
            print('-'*155)
        elif action == "take" or action == "pickup":
            if target=="":
                print("You are not targetting enything!")
        elif action == "talk" and target=="":
            print('Are you trying to talk with imagionary frinds? Really, theres no one to talk with!')
        elif action == "move":
            ourGoal = checkMovementValidityAndMove(target)
        elif action == "show":
            showDirections()
        elif action == "use" or action == "drink":
            if target == "":
                print('')
        elif action == "Inspect":
            if target == "":
                print('and what are you trying to Inspect exacly? Cause theres nothing to Inspect.')        
        elif action == "help":
            HELP()
        elif action == "exit" or "quit":
            exitquit() 
        else:
            print("what do you mean with that?")
            
        #Rest of the parser goes here
        return  

    #pelihahmon nimi kysely        
    def name():
        print('The man thinks to him selfe "and what is even my name?". his head feels like, his been hit by a truck')
        print('')
        namex = str(input('Shouldnt we give a name to our new hero: '))
        cur = db.cursor()
        sql = "UPDATE charracter SET name = '"+str(namex)+"';"
        cur.execute(sql)
        print('and let our journey begin!')
        print('')
        return

    #EXIT and QUIT5
    def exitquit():
        print('exiting game')
        time.sleep(0.5)
        print('.')
        time.sleep(0.5)
        print('.')
        time.sleep(0.5)
        print('.')
        time.sleep(0.5)
        print('.')
        time.sleep(0.5)
        print('.')
        cur = db.cursor()
        sql = "UPDATE charracter SET warmth = 0;"
        cur.execute(sql)

    #inventory querry
    def inventory():
        cur = db.cursor()
        sql = "SELECT item_type.name from item_type, item, charracter\
        where item_type.ID_type = item.ID_type\
        and item.ID_charracter = charracter.ID;"
        cur.execute(sql)
        result = cur.fetchall()
        if cur.rowcount >0:
            for row in result:
                print('You have in your inventory.')
                print(*row, sep=', ')     
        else:
            print('You dont have eny items with you.')
            time.sleep(1)
            print('but.')
        return

    #inventory_coin querry
    def inventory_coin():
        cur = db.cursor()
        sql = "select count(*) from item_type, item, charracter \
        where item_type.ID_type = item.ID_type \
        and item.ID_charracter = charracter.ID \
        and item_type.ID_type = 5;"
        cur.execute(sql)
        result = cur.fetchall()
        if cur.rowcount >0:
            for row in result:
                print('you have ',row[0], 'coins.')    
        else:
            print('You dont have eny coins in your pockets')
        return


    #show directions
    def showDirections():
        sql = "SELECT north,south,east,west, ID_room FROM gamemap, charracter WHERE curroom = charracter.ID_room"
        cur = db.cursor()
        cur.execute(sql)
        playerdirection = ""
        if cur.rowcount>=1:
            result = cur.fetchall()
            if result[0][0] != 0:
                print("North")
            if result[0][1] != 0:
                print("South")
            if result[0][2] != 0:
                print("East")
            if result[0][3] != 0:
                print("West") 
            print('')       

    #Runs the calculation for event happening
    def pheckifiventiappens(currentLoc):
        #First check if the square is a special one like metro or stockmann
        cur = db.cursor()
        randNum = random.randint(0,100)
        if randNum > 98:
            # Vodka
            print("Vodka found!")
            time.sleep(2)
            print("you take a sip from the bottle. oh it IS STRONG!")
            time.sleep(1)
            print('You drink the bottle of vodka')
            
            time.sleep(2)
            sql = "INSERT INTO item (ID_type, ID_charracter) VALUES ('1', '1')"
            cur.execute(sql)
            update_alcohol_vodka()
        elif randNum > 90:
            # Kilju
            print("Kilju found!")
            time.sleep(2)
            print("You inspect it. It looks AND smells horrible!")
            time.sleep(1)
            print('You drink the bottle of kilju')
            
            time.sleep(2)
            sql = "INSERT INTO item (ID_type, ID_charracter) VALUES ('2', '1')"
            cur.execute(sql)
            update_alcohol_kilju()
        elif randNum > 80:
            # Beer
            print("Beer found!")
            time.sleep(2)
            print("It's good old dark bear brew! omnom!")
            time.sleep(1)
            print('You drink the bottle of beer')
            
            time.sleep(2)
            sql = "INSERT INTO item (ID_type, ID_charracter) VALUES ('3', '1')"
            cur.execute(sql)
            update_alcohol_beer()
        elif randNum > 50:
            # Coin
            print("You found a Coin!")
            time.sleep(1)
            print("uuuh.. shiny!!")
            time.sleep(1)
            sql = "INSERT INTO item (ID_type, ID_charracter) VALUES ('4', '1')"
            cur.execute(sql)    
        corridore()
        
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
            result = cur.fetchall()
            if direction == "north":
                playerdirection = result[0][0]
            if direction == "south":
                playerdirection = result[0][1]
            if direction == "east":
                 playerdirection = result[0][2]
            if direction == "west":
                playerdirection = result[0][3]

        if playerdirection != 0:
            warmth()
            print_warmth()
            alcohol()
            print_alcohol()
            updatePlayerPos(playerdirection)
            location_name()
        elif playerdirection == 0:
            print("The path is blocked. look for other way to continue your journey.")
        return playerdirection

    #Pick up item
    def pickupitem(itemFound):
        print("Pickup Item Under Construction")
        print('pickup item: ', itemFound)
        return

    #Check for gameOver
    def CheckForGameOver():
        #If blood alcohol = 0
        cur = db.cursor()
        sql = "SELECT alcohol FROM charracter;"
        cur.execute(sql)
        result = cur.fetchall()
        if cur.rowcount >=0:
            for row in result:
                if row[0] == 0:
                    return True
                
        #Else if warmth = 0
        cur = db.cursor()
        sql = "SELECT warmth FROM charracter;"
        cur.execute(sql)
        result = cur.fetchall()
        if cur.rowcount >=0:
            for row in result:
                if row[0] == 0:
                    return True
        #If both are over 0 return false, no game over

        return False

    #update charracter position
    def updatePlayerPos(newLoc):
        cur = db.cursor()
        sql = "SELECT ID_room FROM charracter"
        cur.execute(sql)
        if cur.rowcount >=1:
            sql = "UPDATE charracter SET ID_room = '"+str(newLoc)+"';"
            cur.execute(sql)
            #tulostetaan secret square    
            secret(newLoc)
            square_28(newLoc)
        pheckifiventiappens(newLoc)

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
        commands = "move", "exit", "quit", "help", "take", "pickup", "Inspect", "drink" "Use", "Talk", "Enter", "Buy", "Rest", "inventory", "show"
        print('-'*155)
        print('Vailable actions are: ')
        print (*commands[0:7], sep=', ')
        print (*commands[7:15], sep=', ')
        print('-'*155)
        print('')
        return

    #Tulostetaan warmth pelaajalle.
    def print_warmth():
        print(''*35)
        cur = db.cursor()
        sql = "SELECT warmth FROM charracter;"
        cur.execute(sql)
        result = cur.fetchall()
        if cur.rowcount >=0:
            print('charracter warmth: ')
            for row in result:
                print(row[0], '')
                print('*'*35)  
        else:
            print('höyy')
            print('-'*155)
        return

    #Vähennä charracterin ruumiinlämpöä 5:llä asteella.
    def warmth():
        cur = db.cursor()
        sql = "UPDATE charracter SET warmth = warmth - 10;"
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
                print(row[0], '')  
        else:
            print('höyy')
            print('*'*35)
        return


    #Vähennä charracterin ruumiinlämpöä 5:llä asteella.
    def alcohol():
        cur = db.cursor()
        sql = "UPDATE charracter SET alcohol = alcohol - 10;"
        cur.execute(sql)   
        return

    #rappukäytävä
    def corridore():
        x = random.randint(1,6)
        if x == 1:
            n = str(input('You see a corridor next to you. Would you like to go in and warm your frozen ol fingers? yes / no: '))
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
                    print('It looks like a warm place, but you are in a hurry to see more of the city ')
                    print('-'*155)
        else:
            print('-'*155)
        return

    #Pelihahmon veren alkoholin nousu eventti
    def update_alcohol_vodka():
        cur = db.cursor()
        sql = "UPDATE charracter SET alcohol = alcohol + 30;"
        cur.execute(sql)
        print('you can feel the alcohol flowing through your veins ')
        
        return


    def update_alcohol_kilju():
        cur = db.cursor()
        sql = "UPDATE charracter SET alcohol = alcohol + 25;"
        cur.execute(sql)
        print('you can feel the alcohol flowing through your veins ')
       
        return

    def update_alcohol_beer():
        cur = db.cursor()
        sql = "UPDATE charracter SET alcohol = alcohol + 20;"
        cur.execute(sql)
        print('you can feel the alcohol flowing through your veins ')

        return

    #Open path to secter square28 from square23 and back
    def secret(newLoc):
        if newLoc == 23 and coins >= 100:
            cur = db.cursor()
            sql = "UPDATE gamemap SET north = 28 WHERE curroom = 23;"
            cur.execute(sql)
            
            cur = db.cursor()
            sql = "UPDATE gamemap SET south = 23 WHERE curroom = 28;"
            cur.execute(sql)
            print('')
            print('< You see a small path going throug the bushes at north. wink wink >')
            print('')
            time.sleep(2)
        else:
            print('')
        return


    def square_28(newLoc):
        if newLoc == 28:
            print('youvv been in strage places, but this 1 is the 1 of a kind. there is a note hanging at the side of lamppost.')
            time.sleep(1)
            print('in the note it reads "NOW! ONLY 100COINS. ONES IN THE LIFE TIME TRIP TO THE CANARIAN ISLAND!')
            time.sleep(1)
            print('Do you want to have a nice week under the canarian sun?')
            x = (str(input('yes / no:  ')))
            if x == (str("yes")):
                print('NICE! YOU COMPLETED THE GAME!')
                cur = db.cursor()
                sql = "UPDATE charracter SET warmth = 0;"
                cur.execute(sql) 
                
            elif x == (str("no")):
                print('')
            else:
                print('')
                
    def story():
        gameOver = False
        x = str(input('skip story? Yes / no : '))
        if x == (str("no")):
            print('\n'*100)
            time.sleep(2)
            print('\n'*100)
            print('   Hi there!')
            time.sleep(5)
            print('\n'*100)
            print('   Are you alone?')
            time.sleep(3)
            print('\n'*100)
            print('   oh good...')
            time.sleep(5)
            print('\n'*100)
            print('   I have a story to tell')
            time.sleep(4)
            print('\n'*100)
            print('   and its a stange one.')
            time.sleep(2)
            print('\n'*100)
            print('   ok')
            time.sleep(5)
            print('\n'*100)
            print('   Hmm. Where should we start?')
            time.sleep(5)
            print('\n'*100)
            print('   It was a long, cold and dark night... darn, sounds awful doesnt it')
            time.sleep(6)
            print('\n'*100)
            print('   kröhöm... It was a cold and snowy winter in the northern capital. Small(ish) snowflakes fell down from the dark cloudy winter sky. ')
            time.sleep(10)
            print('\n'*100)
            print('   Its a chilly mornin..')
            time.sleep(6)
            print('\n'*100)
            print('   In a smelly, wet gutter, we find a grumpy man lying in a pool of snowy watery mess. ')
            time.sleep(6)
            print('\n'*100)
            print('   Cars and people are just passing him by, not sparing a look for this tragic character.')
            time.sleep(6)
            print('\n'*100)
            print('   The grumpy looking hobo wakes up to a dogs bark, lifting his dirty eyelids just a bit.')
            time.sleep(10)
            print('\n'*100)
            print('   The grumpy man sits up in a slight stupor')
            time.sleep(6)
            print('\n'*100)
            print('   "What is this. Where am i?" man mumbles to himself..')
            time.sleep(6)
            print('\n'*100)
            print('   The grumpy man stands up, takes few steps and begins to walk on a sidewalk towards.. well you decide.')
            time.sleep(10)
            print('')
        elif x == (str("yes")):
                time.sleep(2)
                print('')
        else:
            print('invalid input!')
            story()
        return

    #start logo
    def startlogo():
        # Clear console
        print("\n"*130)
        time.sleep(2)
        print('')
        print("     <-------------------      SpugeQuest       ------------------      SpugeQuest      ------------------       SpugeQuest       -------------------->")
        for i in range(1,20):
            print("")
            time.sleep(0.05)
        time.sleep(2)
        for i in range(1,22):
            print("")
            time.sleep(0.05)
        print("")
        print('')
        return

    #DB connection
    db = mysql.connector.connect(host="127.0.0.1", user="testuser", passwd="test1", db="spugequest", buffered=True)


    # generate player location randomly
    loc = random.randint(1,27)
    coins = 100
    #print start of a game "logo"
    startlogo()
    #print story
    story()
    #ask name of charracter 
    name()
    #tulostetaan updatePlayerPos
    updatePlayerPos(loc)
    coins = 100
    #tulostetaan location name
    location_name()
    action = ""
    gameOver = False
    #Print the initial message, commands
    #Start the game loop
    while gameOver == False:
        print("")
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
            gameOver = True
            #Loop breaks
            print("GameOver!!!")
            x = (str(input("Would you like to restart the game? yes / no : ")))
            restarted = sys.argv[0]
            if x == (str("yes")):
                db.rollback()
                start()
            elif x == (str("no")):
                db.rollback()
                print('blaa',)
                exit(0)
            else:
                cur = db.cursor()
                sql = "UPDATE charracter SET warmth = 0;"
                cur.execute(sql)
            db.rollback()
        #Restart loop
while invalid_input:            
    start()        



