//
//  DiceGame.swift
//  Dice-Roll
//
//  Created by aluno-111 on 08/04/25.
//
import Foundation
import ColorizeSwift

enum Direction {
    case up, down, left, right
}

class DiceGame : Game {
    var width: Int { terminal.canvasWidth }
    var height: Int { terminal.canvasHeight }
    var direction: Direction = .right
    
    override func draw() {
        // Borders
        for x in 0..<width {
            terminal.draw(x: x, y: 0, symbol: "─")
            terminal.draw(x: x, y: height - 1, symbol: "─")
        }
        for y in 0..<height {
            terminal.draw(x: 0, y: y, symbol: "│")
            terminal.draw(x: width - 1, y: y, symbol: "│")
        }
        terminal.draw(x: 0, y: 0, symbol: "┌")
        terminal.draw(x: width - 1, y: 0, symbol: "┐")
        terminal.draw(x: 0, y: height - 1, symbol: "└")
        terminal.draw(x: width - 1, y: height - 1, symbol: "┘")

    }
    
    // Process any inputs from user
    override func processInput(_ key: String) {
        switch key {
                case "w": if direction != .down { direction = .up }
                case "s": if direction != .up { direction = .down }
                case "a": if direction != .right { direction = .left }
                case "d": if direction != .left { direction = .right }
                case "q": isRunning = false
                default: break
                }
        print(key)
        }

    func playGame() {
        
        var player1 = Player()
        var player2 = Player()

        print("🎲Welcome to the DiceRoll Game!🎲".yellow().backgroundColor(.aquamarine1))
        print("Enter the names of the players:")
        
        print("Player 1: ")
        player1.setName()

        print("Player 2: ")
        player2.setName()
        
        let player1Attack = player1.attack()
        
        switch player1Attack {
            case .Success:
                let defense = player2.defend()
//            let defense = .Success
            
                if defense == .Success {
                    
                } else if defense == .Counter {
                    player1.loseHealth(amount: player2.damage())
                    
                    if !(player1.isPlayerAlive()) {
                        //                Thread.sleep(forTimeInterval: 2)
                        if let name = (player1.name){
                            print("\(name)")
                            return
                        }
                    }
                    
                    player1.status()
                    
                } else if defense == .Disaster {
                    return
                    
                } else {
                    player2.loseHealth(amount: player1.damage())
        
                    if !(player2.isPlayerAlive()) {
        //                Thread.sleep(forTimeInterval: 2)
                        if let name = (player2.name){
                            print("\(name)")
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
                    print("\(name)")
                    return
                }
            }
                
            player2.status()
                
            case .Disaster:
                player1.health = 0
                return
                
            default:
                break
        }

        let player2Attack = player2.attack()
        
        switch player2Attack{
            case .Success:
                    let defense = player1.defend()
            
                    if defense == .Success {
                        return
                        
                    } else if defense == .Counter {
                        player2.loseHealth(amount: player1.damage())
        
                        if !(player2.isPlayerAlive()) {
        //                    Thread.sleep(forTimeInterval: 2)
                            if let name = (player2.name){
                                print("\(name) ")
                                return
                            }
                            
                            return
                        }
                        
                    player2.status()
                        
                    } else if defense == .Disaster{
                        return
                        
                    } else {
                        player1.loseHealth(amount: player2.damage())
        
                        if !(player1.isPlayerAlive()) {
        //                    Thread.sleep(forTimeInterval: 2)
                            if let name = (player1.name){
                                print("\(name) ")
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
                        print("\(name) ")
                        return
                    }
                }
            
                player1.status()
                
            case .Disaster:
                player2.health = 0
                return
            
            default:
                break
        }
        
        player1.status()
        player2.status()
        
        if player1.health == 0 || player2.health == 0{
            print("\nGame Over!")
            return
        }
    }
}
