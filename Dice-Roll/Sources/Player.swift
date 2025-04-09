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
        case Success, Perfect, Fail, Disaster
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
        } else if attackRoll == 1{
            return .Disaster
        } else {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name ?? "Player")'s attack failed.")
            return .Fail
        }
    }

    enum DefenseResult {
        case Success, Counter, Fail, Disaster
    }
    
    func defend() -> DefenseResult {
//        Thread.sleep(forTimeInterval: 2)
        print("\n\(name ?? "Player")'s turn: Roll your d20 for defense!")
        _ = readLine()

        let defendRoll = rollDice(20)
//        Thread.sleep(forTimeInterval: 1)
        print("\(name ?? "Player") rolls a \(defendRoll) for defense!")
        if defendRoll == 1 {
            disaster(name: name ?? "Player")
            return .Disaster
        }
        else if defendRoll > 12 && defendRoll != 20 {
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
    
    enum Disasters : String, CaseIterable {
        case dragon
        case troll
        case abyss
        case hydra
        case dust
        case portal
    }
    
    func disaster(name: String) {
        var disaster = Disasters.allCases.randomElement()
        
        switch disaster {
            case .dragon:
                print("\(name) was eaten by a dragon, your journey ends here!")
            case .troll:
                print("\(name) was smashed by a troll, farewell young warrior!")
            case .abyss:
                print("\(name) tripped and fell into an abyss, bye bye!")
            case .hydra:
                print("\(name) was consumed by a hydra, its many heads fighting for the feast!")
            case .dust:
                print("\(name) was turned to dust by a powerful curse, their soul lost to the void!")
            default:
                print("\(name) was dragged into a portal by a dark sorcery, their fate sealed in another dimension!")
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
