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
    
//    override func draw() {
//        // Borders
//        for x in 0..<width {
//            terminal.draw(x: x, y: 0, symbol: "─")
//            terminal.draw(x: x, y: height - 1, symbol: "─")
//        }
//        for y in 0..<height {
//            terminal.draw(x: 0, y: y, symbol: "│")
//            terminal.draw(x: width - 1, y: y, symbol: "│")
//        }
//        terminal.draw(x: 0, y: 0, symbol: "┌")
//        terminal.draw(x: width - 1, y: 0, symbol: "┐")
//        terminal.draw(x: 0, y: height - 1, symbol: "└")
//        terminal.draw(x: width - 1, y: height - 1, symbol: "┘")
//
//    }
    
    // Process any inputs from user
    override func processInput(_ key: String){
        //        key
        for char in key {
            terminal.draw(x: width - 1, y: height - 1, symbol: char)
        }
    }
    
    func playGame() {
        
        let player1Attack = player1.attack()
        
        switch player1Attack {
            case .SuccessAttack:
                let defense = player2.defend()
            
                if defense == .CounterDefense {
                    player1.loseHealth(amount: player2.damage())
                    
                    if !(player1.isPlayerAlive()) {
                        //                Thread.sleep(forTimeInterval: 2)
                        print("\(player1.name) is dead") //MELHORAR
                        return
                        
                    }
                    
                    player1.status()
                    
                } else if defense == .DisasterDefense {
                    return
                    
                } else if defense == .FailDefense {
                    player2.loseHealth(amount: player1.damage())
        
                    if !(player2.isPlayerAlive()) {
        //                Thread.sleep(forTimeInterval: 2)
                        print("\(player2.name)")
                        return
                    }
                    
                    player2.status()
                }
            case .PerfectAttack:
                player2.loseHealth(amount: player1.damage())
            
            if !(player2.isPlayerAlive()) {
                //            Thread.sleep(forTimeInterval: 2)
                print("\(player2.name)")
                return
            }
                
            player2.status()
                
            case .DisasterAttack:
                player1.health = 0
            
                player1.disaster()
                return
                
            default:
                break
        }

        let player2Attack = player2.attack()
        
        switch player2Attack{
            case .SuccessAttack:
                    let defense = player1.defend()
                        
                     if defense == .CounterDefense {
                        player2.loseHealth(amount: player1.damage())
        
                        if !(player2.isPlayerAlive()) {
        //                    Thread.sleep(forTimeInterval: 2)
                            print("\(player2.name) is dead")
                            return
                        }
                        
                     player2.status()
                        
                    } else if defense == .DisasterDefense{
                        player1.health = 0
                        player1.disaster()
                        //print de morte
                        return
                        
                    } else if defense == .FailDefense {
                        player1.loseHealth(amount: player2.damage())
        
                        if !(player1.isPlayerAlive()) {
        //                    Thread.sleep(forTimeInterval: 2)
                            print("\(player1.name) morreu")
                            return
                        }
                        
                        player1.status()
                    }
            case .PerfectAttack:
                player1.loseHealth(amount: player2.damage())
            
                if !(player1.isPlayerAlive()) {
        //            Thread.sleep(forTimeInterval: 2)
                    print("\(player1.name) morreu")
                        return
                    
                }
            
                player1.status()
                
            case .DisasterAttack:
                player2.health = 0
                player2.disaster()
                //print de morte
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
