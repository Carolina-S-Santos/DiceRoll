import Foundation

class Player {
    var name: String?
    var health: Int = 100

    init() {
    }

    func setName() {
        if let typedName = readLine() {
            name = typedName
        } else {
            print("Invalid name.")
        }
    }

    func rollDice() -> Int {
        return Int.random(in: 1...20)
    }

    func attack() -> Bool {
        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player")'s turn: Roll your d20 for attack!")
        _ = readLine()

        let attackRoll = rollDice()
        Thread.sleep(forTimeInterval: 1)
        print("\n\(name ?? "Player") rolls a \(attackRoll) for attack!")

        if attackRoll > 10 {
            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") attacks successfully!")
            return true
        } else {
            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player")'s attack failed.")
            return false
        }
    }

    enum DefenseResult {
        case Success, Counter, Fail
    }
    
    func defend() -> DefenseResult {
        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player")'s turn: Roll your d20 for defense!")
        _ = readLine()

        let defendRoll = rollDice()
        Thread.sleep(forTimeInterval: 1)
        print("\n\(name ?? "Player") rolls a \(defendRoll) for defense!")

        if defendRoll > 12 && defendRoll != 20 {
            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") defends successfully!")
            return .Success
        } else if defendRoll == 20 {
            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") gets a counter attack")
            return .Counter
        } else {
            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player")'s defense failed.")
            return .Fail
        }
    }

    func damage() -> Int {
        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player") rolls for damage!")
        _ = readLine()

        let damageRoll = rollDice()
        Thread.sleep(forTimeInterval: 1)
        print("\n\(name ?? "Player") deals \(damageRoll) damage!")
        return damageRoll
    }

    func loseHealth(amount: Int) {
        health -= amount
        if health < 0 {
            health = 0
        }
    }
    func status() {
        if let playerName = name {
            Thread.sleep(forTimeInterval: 2)
            print("\nPlayer: \(playerName), Health: \(health) HP")
        } else {
            Thread.sleep(forTimeInterval: 2)
            print("\nPlayer name is not set, Health: \(health) HP")
        }
    }

}
