// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ColorizeSwift


//let game = Game()
//game.start()

var game = DiceGame()

func setName() -> String {
    guard let typedName = readLine() else {
        return ""
    }
    return typedName
}


print("🎲Welcome to the DiceRoll Game!🎲".yellow().backgroundColor(.aquamarine1))
print("Enter the names of the players:")
print("Player 1: ")
//let namePlayer1 =
var player1 = Player(name: setName())

print("Player 2: ")
var player2 = Player(name: setName())

for round in 1...5 {
//    Thread.sleep(forTimeInterval: 2)
    if round == 1 {
        
    }
    
    print("\n//----------------ROUND \(round)----------------//")
    game.playGame()
    if !player1.isPlayerAlive() || !player2.isPlayerAlive() {
        break
    }
    else if round == 5 {
        print("\nNo more rounds left.")
        break
    }
}

//Thread.sleep(forTimeInterval: 2)
print("\n .--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--.")
print("/ .. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\")
print("\\ \\/\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ \\/ /")
print(" \\/ /`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'\\/ /")
print(" / /\\                                                            / /\\")
print("/ /\\ \\   ____    _    __  __ _____    _____     _______ ____    / /\\ \\")
print("\\ \\/ /  / ___|  / \\  |  \\/  | ____|  / _ \\ \\   / / ____|  _ \\   \\ \\/ /")
print(" \\/ /  | |  _  / _ \\ | |\\/| |  _|   | | | \\ \\ / /|  _| | |_) |   \\/ /")
print(" / /\\  | |_| |/ ___ \\| |  | | |___  | |_| |\\ V / | |___|  _ <    / /\\")
print("/ /\\ \\  \\____/_/   \\_\\_|  |_|_____|  \\___/  \\_/  |_____|_| \\_\\  / /\\ \\")
print("\\ \\/ /                                                          \\ \\/ /")
print(" \\/ /                                                            \\/ /")
print(" / /\\.--..--..--..--..--..--..--..--..--..--..--..--..--..--..--./ /\\")
print("/ /\\ \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\.. \\/\\ \\")
print("\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `'\\ `' /")
print(" `--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--' ")





