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

    if player1.attack() {
        let defense = player2.defend()
        if defense == .Success {
            return
        }else if defense == .Counter {
            player1.loseHealth(amount: player2.damage())
        }else {
            player2.loseHealth(amount: player1.damage())
        }
    }

    if player2.attack() {
        let defense = player1.defend()
        if defense == .Success {
            return
        }else if defense == .Counter {
            player2.loseHealth(amount: player1.damage())
            
        }else {
            player1.loseHealth(amount: player2.damage())
        }
    }

}

for round in 1...5 {
    Thread.sleep(forTimeInterval: 2)
    print("\n//----------------ROUND \(round)----------------//\n")
    playGame()
    player1.status()
    player2.status()
    if player1.health <= 0 {
        Thread.sleep(forTimeInterval: 1)
        print("\(player1.name ?? "Player 1") has been defeated!")
        break
    } else if player2.health <= 0 {
        Thread.sleep(forTimeInterval: 1)
        print("\(player2.name ?? "Player 2") has been defeated!")
        break
    }
    if round == 5 {
        print("Game Over! No more rounds left.")
    }
}
