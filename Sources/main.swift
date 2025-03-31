// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// faça um programa que simule o lançamento de um dado de 20 lados, eu tenho 2 jogadores, o jogo consiste em lançar primeiro o dado de ataque, se eu acertar o dado de ataque (valor 4 ou +) o meu oponente tem q lançar um dado de defesa, a defesa é bem sucedida se for 12 ou mais, se o oponente falhar, eu jogo um dado de dano, se a defesa do oponente for perfeita(20), ele tem direito a um contra ataque, e ele joga o dado de dano.
// o dado de dano é um dado de 6 lados, o ataque e defesa são dados de 20 lados
// o dado de ataque é o primeiro a ser jogado, se o ataque for bem sucedido, o oponente joga o dado de defesa, se a defesa for bem sucedida, o ataque falha e não tem dano, se a defesa falhar, o atacante joga o dado de dano e causa dano ao defensor
// o defensor tem direito a um contra ataque se a defesa for perfeita, e joga o dado de dano

var player1 = Player()
var player2 = Player()

print("Welcome to the Dice Game!")
print("Enter the names of the players:")

print("Player 1: ")
player1.setName()

print("Player 2: ")
player2.setName()

@MainActor
func playGame() {

    if player1.attack() {
        let defense = player2.defend()
        if defense == 0 {
            return
        }else if defense == 1 {
            player1.loseHealth(amount: player2.damage())
        }else {
            player2.loseHealth(amount: player1.damage())
        }
    }

    if player2.attack() {
        let defense = player1.defend()
        if defense == 0 {
            return
        }else if defense == 1 {
            player2.loseHealth(amount: player1.damage())
            
        }else {
            player1.loseHealth(amount: player2.damage())
        }
    }
    
    // if player1Attack >= 8 {
    //     print("\(player1.name ?? "Player 1")'s attack successful!")
    //     print("\(player2.name ?? "Player 2")'s turn: Roll your d20 for defense!")
    //     _ = readLine()
    //     let player2Defense = rollDice()
    //     print("\(player2.name ?? "Player 2")'s Defense: \(player2Defense)")

    //     if player2Defense >= 12  && player2Defense != 20 {
    //         print("\(player2.name ?? "Player 2") defended successfully!")
    //     } else {
    //         print("\(player2.name ?? "Player 2")'s defense failed!")
    //         print("\(player1.name ?? "Player 1") rolls for damage!")
    //         _ = readLine() 
    //         let player1Damage = rollDice()
    //         print("\(player1.name ?? "Player 1") deals \(player1Damage) damage to \(player2.name ?? "Player 2")")
    //         player2.loseHealth(amount: player1Damage)
    //         print("\(player2.name ?? "Player 2")'s health is now \(player2.health)")
    //     }
    //     if player2Defense == 20 {
    //         print("\(player2.name ?? "Player 2") gets a counter attack!")
    //         print("\(player2.name ?? "Player 2") rolls for damage!")
    //         _ = readLine() 
    //         let player2CounterAttack = rollDice()
    //         print("\(player2.name ?? "Player 2") counter attacks and deals \(player2CounterAttack) damage to \(player1.name ?? "Player 1")")
    //         player1.loseHealth(amount: player2CounterAttack)
    //         print("\(player1.name ?? "Player 1")'s health is now \(player1.health)")
    //     }
    // } else {
    //     print("\(player1.name ?? "Player 1")'s attack failed!")
    // }

    // print("\(player2.name ?? "Player 2")'s turn: Roll your d20 for attack!")
    // _ = readLine() 
    // let player2Attack = rollDice()
    // print("\(player2.name ?? "Player 2")'s Attack: \(player2Attack)")

    // if player2Attack >= 8 {
    //     print("\(player2.name ?? "Player 2")'s attack successful!")
    //     print("\(player1.name ?? "Player 1")'s turn: Roll your d20 for defense!")
    //     _ = readLine() 
    //     let player1Defense = rollDice()
    //     print("\(player1.name ?? "Player 1")'s Defense: \(player1Defense)")

    //     if player1Defense >= 12 && player1Defense != 20 {
    //         print("\(player1.name ?? "Player 1") defended successfully!")
    //     } else {
    //         print("\(player1.name ?? "Player 1")'s defense failed!")
    //         print("\(player2.name ?? "Player 2") rolls for damage!")
    //         _ = readLine() 
    //         let player2Damage = rollDice()
    //         print("\(player2.name ?? "Player 2") deals \(player2Damage) damage to \(player1.name ?? "Player 1")")
    //         player1.loseHealth(amount: player2Damage)
    //         print("\(player1.name ?? "Player 1")'s health is now \(player1.health)")
    //     }
    //     if player1Defense == 20 {
    //         print("\(player1.name ?? "Player 1") gets a counter attack!")
    //         print("\(player1.name ?? "Player 1") rolls for damage!")
    //         _ = readLine() 
    //         let player1CounterAttack = rollDice()
    //         print("\(player1.name ?? "Player 1") counter attacks and deals \(player1CounterAttack) damage to \(player2.name ?? "Player 2")")
    //         player2.loseHealth(amount: player1CounterAttack)
    //         print("\(player2.name ?? "Player 2")'s health is now \(player2.health)")
    //     }
    // } else {
    //     print("\(player2.name ?? "Player 2")'s attack failed!")
    // }

}

for round in 1...5 {
    print("\n//----------------ROUND \(round)----------------//\n")
    playGame()
    player1.status()
    player2.status()
    if player1.health <= 0 {
        print("\(player1.name ?? "Player 1") has been defeated!")
        break
    } else if player2.health <= 0 {
        print("\(player2.name ?? "Player 2") has been defeated!")
        break
    }
    if round == 5 {
        print("Game Over! No more rounds left.")
    }
    print("//---------------------------------------//")
}
