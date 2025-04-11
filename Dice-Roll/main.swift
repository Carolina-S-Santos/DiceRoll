// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ColorizeSwift

extension String {
    func centralized() -> String {
        let terminalWidth = ProcessInfo.processInfo.environment["COLUMNS"].flatMap(Int.init) ?? 120
        
        let spaces = max((terminalWidth - self.count)/3, 0)
        let lines = self.split(separator: "\n", omittingEmptySubsequences: false)
        let padding = String(repeating: " ", count: spaces)
        
        return lines.map { line in
            let lineStr = String(line)
            return padding + lineStr
        }.joined(separator: "\n")        }
}


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

animations.printTitle()
var answer = "n"
//repeat {
    
    print("\n\n\nEnter the names of the players:\n")
    print("Player 1: ")
    
    var player1 = Player(name: setName())
    
    print("\nPlayer 2: ")
    var player2 = Player(name: setName())
//    initialSong.pause()
    for round in 1...5 {
        //    Thread.sleep(forTimeInterval: 2)
        
        print("\n//----------------ROUND \(round)----------------//".centralized())
        game.playGame()
        if !player1.isPlayerAlive() || !player2.isPlayerAlive() {
            if !player1.isPlayerAlive() {
                animations.whoWins(winner: player2.name, loser: player1.name)
            } else {
                animations.whoWins(winner: player1.name, loser: player2.name)
            }
            
            
            break
        }
        else if round == 5 {
            print("\nNo more rounds left.")
            break
        }
    }
    
    //Thread.sleep(forTimeInterval: 2)
    animations.printGameOver()
//    print("\n\n Would you like to play again?")
    guard let answer = readLine() else {
        fatalError()
    }
//} while answer.lowercased() == "y"
