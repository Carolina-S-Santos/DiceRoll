//
//  DiceGame.swift
//  Dice-Roll
//
//  Created by aluno-111 on 08/04/25.
//
import Foundation
import ColorizeSwift

class DiceGame {

    func playGame() {
        
        let player1Attack = player1.attack()
        
        switch player1Attack {
            case .SuccessAttack:
                let defense = player2.defend()
            
                if defense == .CounterDefense {
                    player1.loseHealth(amount: player2.damage())
                    
                    if !(player1.isPlayerAlive()) {
                        //                Thread.sleep(forTimeInterval: 2)
                        animations.printSlay()
//                        animations.whoWins(winner: player2.name, loser: player1.name)
                        return
                        
                    }
                    
                    animations.status(player1: player1, player2: player2)
                    
                } else if defense == .DisasterDefense {
                    player1.health = 0
                    return
                    
                } else if defense == .FailDefense {
                    player2.loseHealth(amount: player1.damage())
        
                    if !(player2.isPlayerAlive()) {
                        animations.printSlay()
                        return
                    }
                    
                    animations.status(player1: player1, player2: player2)
                }
            case .PerfectAttack:
                player2.loseHealth(amount: player1.damage())
            
            if !(player2.isPlayerAlive()) {
                animations.printSlay()
                return
            }
                
            animations.status(player1: player1, player2: player2)
            
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
                            animations.printSlay()
                            return
                        }
                        
                         animations.status(player1: player1, player2: player2)
                         
                    } else if defense == .DisasterDefense{
                        player1.health = 0
                        return
                        
                    } else if defense == .FailDefense {
                        player1.loseHealth(amount: player2.damage())
        
                        if !(player1.isPlayerAlive()) {
                            animations.printSlay()
                            return
                        }
                        
                        animations.status(player1: player1, player2: player2)
                    }
            case .PerfectAttack:
                player1.loseHealth(amount: player2.damage())
            
                if !(player1.isPlayerAlive()) {
                    animations.printSlay()
                        return
                    
                }
            
            animations.status(player1: player1, player2: player2)
            
            case .DisasterAttack:
                player2.health = 0
                player2.disaster()
                return
            
            default:
                break
        }
        
    }
}
