// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

var player1 = Player()
var player2 = Player()

print("🎲Welcome to the DiceRoll Game!🎲")
print("Enter the names of the players:")

print("Player 1: ")
player1.setName()

print("Player 2: ")
player2.setName()

@MainActor
func playGame() {
    
    let player1Attack = player1.attack()
    switch player1Attack {
    case .Success:
        let defense = player2.defend()
        if defense == .Success {
            return
        }else if defense == .Counter {
            player1.loseHealth(amount: player2.damage())
//            print(!(player2.isPlayerAlive()))
            if !(player1.isPlayerAlive()) {
//                Thread.sleep(forTimeInterval: 2)
                if let name = (player1.name){
                    print("\(name) was eaten by a dragon, your journey ends here!")
                    return
                }
            }
            player1.status()
        }else {
            player2.loseHealth(amount: player1.damage())
//            print(!(player1.isPlayerAlive()))
            if !(player2.isPlayerAlive()) {
//                Thread.sleep(forTimeInterval: 2)
                if let name = (player2.name){
                    print("\(name) was smashed by a troll, farewell young warrior!")
                    return
                }
            }
            player2.status()
        }
    case .Perfect:
        player2.loseHealth(amount: player1.damage())
        if !(player2.isPlayerAlive()) {
//            Thread.sleep(forTimeInterval: 2)
            if let name = (player2.name){
                print("\(name) tripped and fell into an abyss, bye bye!")
                return
            }        }
        player2.status()
    default: break
    }

    let player2Attack = player2.attack()
    switch player2Attack{
    case .Success:
            let defense = player1.defend()
            if defense == .Success {
                return
            }else if defense == .Counter {
                player2.loseHealth(amount: player1.damage())
//                print(!(player2.isPlayerAlive()))
                if !(player2.isPlayerAlive()) {
//                    Thread.sleep(forTimeInterval: 2)
                    if let name = (player2.name){
                        print("\(name) was consumed by a hydra, its many heads fighting for the feast!")
                        return
                    }
                    return
                }
                player2.status()
            }else {
                player1.loseHealth(amount: player2.damage())
//                print(!(player1.isPlayerAlive()))
                if !(player1.isPlayerAlive()) {
//                    Thread.sleep(forTimeInterval: 2)
                    if let name = (player1.name){
                        print("\(name) (name) was turned to dust by a powerful curse, their soul lost to the void!")
                        return
                    }
                }
                player1.status()
            }
    case .Perfect:
        player1.loseHealth(amount: player2.damage())
        if !(player1.isPlayerAlive()) {
//            Thread.sleep(forTimeInterval: 2)
            if let name = (player1.name){
                print("\(name) was dragged into a portal by a dark sorcery, their fate sealed in another dimension!")
                return
            }
        }
        player1.status()
    default: break
        }
}

for round in 1...5 {
//    Thread.sleep(forTimeInterval: 2)
    print("\n//----------------ROUND \(round)----------------//")
    playGame()
    player1.status()
    player2.status()
    if player1.health == 0 || player2.health == 0{
        print("\nGame Over!")
        break
    } else if round == 5 {
        print("\nNo more rounds left.")
        break
    }
}

//Thread.sleep(forTimeInterval: 2)
print("\n//----------------GAME OVER----------------//\n")
