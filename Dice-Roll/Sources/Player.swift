import Foundation


class Player {
    var name: String?
    var health: Int = 2
    

    init() {
    }

    func setName() {
        if let typedName = readLine() {
            name = typedName
        } else {
            print("Invalid name.")
        }
    }

    func rollDice(_ sides : Int) -> Int {
        return Int.random(in: 1...sides)
    }

    enum AttackResult {
        case Success, Perfect, Fail
    }
    
    func attack() -> AttackResult {
//        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player")'s turn: Roll your d20 for attack!")
        _ = readLine()

        let attackRoll = rollDice(20)
//        let attackRoll = 20
//        Thread.sleep(forTimeInterval: 1)
        print("\(name ?? "Player") rolls a \(attackRoll) for attack!")

        if attackRoll > 10 && attackRoll != 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") attacks successfully!")
            return .Success
            
        } else if attackRoll == 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") Used their ULT, you cannot run!")
            return .Perfect
        } else {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player")'s attack failed.")
            return .Fail
        }
    }

    enum DefenseResult {
        case Success, Counter, Fail
    }
    
    func defend() -> DefenseResult {
//        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player")'s turn: Roll your d20 for defense!")
        _ = readLine()

        let defendRoll = rollDice(20)
//        Thread.sleep(forTimeInterval: 1)
        print("\(name ?? "Player") rolls a \(defendRoll) for defense!")

        if defendRoll > 12 && defendRoll != 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") defends successfully!")
            return .Success
        } else if defendRoll == 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player") gets a counter attack")
            return .Counter
        } else {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player")'s defense failed.")
            return .Fail
        }
    }

    func damage() -> Int {
//        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player") rolls for damage!")
        _ = readLine()

        let damageRoll = rollDice(6)
//        Thread.sleep(forTimeInterval: 1)
        print("\(name ?? "Player") deals \(damageRoll) damage!\n")
        return damageRoll
    }

    func loseHealth(amount: Int) {
        self.health -= amount
        if self.health < 0 {
            self.health = 0
        }
    }
    
    func isPlayerAlive() -> Bool{
        if self.health == 0 {
            return false
        }
        return true
    }
    
    func status() {
        if let playerName = name {
//            Thread.sleep(forTimeInterval: 2)
            print("\nPlayer: \(playerName), Health: \(health) HP")
        } else {
//            Thread.sleep(forTimeInterval: 2)
            print("\nPlayer name is not set, Health: \(health) HP")
        }
    }

}
