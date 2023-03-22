import random as rnd

#At the moment the rules of the game are quite simple, all players play a card, the "peccatore" is the one who rule and
#the objective is to play a card which value is lesser than the peccatore's one. The peccatore loses only if one or more players
#play the same card. If a player plays a card which value is higher than peccatore's one he gains 0 points, if the value is lesser the
#player gains "value of the card" points. Every player can play a card once a game. The game finish after 11 turns (every turn they play a card)
#Later i will add card's special effect as method to call when the card is played (so the card is instanced) but at the moment 
#the only thing i want to ask about is the "value check"


########## CLASSES #####################    
class Player:
    player_deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] #every element correspond to a card
    player_drafted = []
    player_points = 0
    delta_points = 0 #the points calculated during the turn go here and at the end of the turn player_points += delta point and reset delta_points to zero

    def __init__(self, name) -> None:
        self.name = name
            
    def play_a_card(self):
        #to simulate games every player play a random card
        played_card = rnd.choice(self.player_deck)
        self.player_deck.remove(played_card)
        self.player_drafted.append(played_card)
        return played_card
    
    def gain_points(self):
        self.player_points += self.delta_points
        self.delta_points = 0

class Card():
    def __init__(self) -> None:
        pass

    def peccato(self, peccatore, player1, player2):
        pass

class Satana(Card):
    value = 1
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Uomo(Card):
    value = 2
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Invidia(Card):
    value = 3
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Gola(Card):
    value = 4
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Avarizia(Card):
    value = 5
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Accidia(Card):
    value = 6
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Lussuria(Card):
    value = 7
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Ira(Card):
    value = 8
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Superbia(Card):
    value = 9
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Dio(Card):
    value = 10
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass
class Superuomo(Card):
    value = 11
    def __init__(self) -> None:
        pass
        #self.peccato(peccatore)

    def peccato(self, peccatore, player1, player2):
        pass


########## CONTROL FUNCTIONS ###########
def print_points(peccatore: Player, player1: Player, player2: Player):
    print("---------------------------------")
    print("Peccatore has " + str(peccatore.player_points) + " points")
    print("Player1 has " + str(player1.player_points) + " points")
    print("PLayer2 has " + str(player2.player_points) + " points")
    # print("---------------------------------")

def print_cards(card_0: Card, card_1: Card, card_2: Card):

    print("---------------------------------")
    print("Peccatore played " + str(card_0))
    print("Player1 played " + str(card_1))
    print("Player2 played " + str(card_2))
    # print("---------------------------------")

def print_decks(player: Player):
    print(str(player.player_deck))



########## GAME FUNCTIONS #############

def _delta_setter(peccatore: Player, player1: Player, player2: Player, peccatore_card: Card, player1_card: Card, player2_card: Card):
    #function that check the falue and set all the deltas
    peccatore_is_winning = True

    #player1 and peccatore play the same card
    if player1_card.value == peccatore_card.value:
        player1.delta_points = player1_card.value
        peccatore_is_winning = False
        print("player 1 = peccatore")

    #player2 and peccatore play the same card
    if player2_card.value == peccatore_card.value:
        player2.delta_points = player2_card.value
        peccatore_is_winning = False
        print("player 2 = peccatore")
 
    #player1 plays smaller card than peccatore
    if player1_card.value < peccatore_card.value:
        player1.delta_points = player1_card.value
        print("player 1 < peccatore")
    
    #player2 plays smaller card than
    if player2_card.value < peccatore_card.value:
        player2.delta_points = player2_card.value
        print("player 2 < peccatore")
    
    if peccatore_is_winning == True:
        peccatore.delta_points = peccatore_card.value

def _point_changer(peccatore: Player, player1: Player, player2: Player):
    peccatore.gain_points()
    player1.gain_points()
    player2.gain_points()

def card_chooser(number):
    #function that choose the card to play after 
    real_card = Card
    match number:
        case 1:
            real_card = Satana
        case 2:
            real_card = Uomo
        case 3:
            real_card = Invidia
        case 4:
            real_card = Gola
        case 5:
            real_card = Avarizia
        case 6:
            real_card = Accidia
        case 7:
            real_card = Lussuria
        case 8:
            real_card = Ira
        case 9:
            real_card = Superbia
        case 10:
            real_card = Dio
        case 11:
            real_card = Superuomo
    return real_card

def play_cards(player: Player):
    return card_chooser(player.play_a_card())

def play_a_turn(peccatore: Player, player1: Player, player2: Player):
    #instances of the cards played
    peccatore_card = play_cards(peccatore) 
    player1_card = play_cards(player1)
    player2_card = play_cards(player2)

    print_cards(peccatore_card, player1_card, player2_card)
    _delta_setter(peccatore, player1, player2, peccatore_card, player1_card, player2_card)
    _point_changer(peccatore, player1, player2)
    peccatore.delta_points = 0
    player1.delta_points = 0
    player2.delta_points = 0
    print_points(peccatore, player1, player2)

##########INSTANCES#####################    
peccatore = Player("peccatore")
Gianni = Player("Gianni")
Pippo = Player("Pippo")


#simulation of some turns
play_a_turn(peccatore, Gianni, Pippo)
print_decks(peccatore)
print_decks(Gianni)
print_decks(Pippo)
play_a_turn(peccatore, Gianni, Pippo)
print_decks(peccatore)
print_decks(Gianni)
print_decks(Pippo)