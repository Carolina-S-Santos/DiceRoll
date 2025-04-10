// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ColorizeSwift

extension String {
    func centralized() -> String {
        let terminalWidth = ProcessInfo.processInfo.environment["COLUMNS"].flatMap(Int.init) ?? 120
        
        let spaces = max((terminalWidth - self.count)/2, 0)
        let lines = self.split(separator: "\n", omittingEmptySubsequences: false)
        let padding = String(repeating: " ", count: spaces)
        
        return lines.map { line in
            let lineStr = String(line)
            return padding + lineStr
        }.joined(separator: "\n")        }
}


//let game = Game()
//game.start()

var initialSong = AudioPlayer()
initialSong.play(song: "/Users/aluno-111/Desktop/DiceRoll/Dice-Roll/Music/woods-of-imagination.mp3")
var game = DiceGame()
var animations = Prints()

func setName() -> String {
    guard let typedName = readLine() else {
        return ""
    }
    return typedName
}

// fazer
animations.printTitle()
//animations.printSlay()
//animations.printDragon()
//animations.printSmash()
//animations.printGameOver()
//animations.printRollingDice()

//animations.printHydra()
// printar welcome
//print("🎲Welcome to the DiceRoll Game!🎲")
//animations.printDragon()
print("Enter the names of the players:".centralized())
print("Player 1: ".centralized())

var player1 = Player(name: setName())

print("Player 2: ".centralized())
var player2 = Player(name: setName())
initialSong.pause()
for round in 1...5 {
//    Thread.sleep(forTimeInterval: 2)
    
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
animations.printGameOver()





