import Foundation

class Player {
    var name: String
    var health: Int = 2
    
    init(name: String) {
        self.name = name
    }

    func rollDice(_ sides : Int) -> Int {
        return Int.random(in: 1...sides)
    }

    enum AttackResult {
        case SuccessAttack, PerfectAttack, FailAttack, DisasterAttack
    }
    
    func attack() -> AttackResult {
//        Thread.sleep(forTimeInterval: 2)
        print("\n        /| ________________")
        print("  O|===|* >________________\\ \(name)'s turn: press 'Enter' to roll your d20 for attack!")
        print("        \\|")
        _ = readLine()
        
        animations.printRollingDice()
        let attackRoll = rollDice(20)
        animations.printd20(result: attackRoll)
//        let attackRoll = 1
        Thread.sleep(forTimeInterval: 0.5)
        print("\(name) rolls a \(attackRoll) for attack!")

        if attackRoll > 10 && attackRoll != 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name) attacks successfully!")
            return .SuccessAttack
            
        } else if attackRoll == 20 {
            //            Thread.sleep(forTimeInterval: 1)
            print("\n\(name) Used their ULT, you cannot run!")
            return .PerfectAttack
            
        } else if attackRoll == 1{
            return .DisasterAttack
            
        } else {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name)'s attack failed.")
            return .FailAttack
        }
    }

    enum DefenseResult {
        case SuccessDefense, CounterDefense, FailDefense, DisasterDefense
    }
    
    func defend() -> DefenseResult {
//        Thread.sleep(forTimeInterval: 2)

        print(" _____ ")
        print("||    ||")
        print("||    || \(name)'s turn: Roll your d20 for defense!")
        print("\\\\    //")
        print(" \\\\__//")
        _ = readLine()
        animations.printRollingDice()
        let defendRoll = rollDice(20)
        animations.printd20(result: defendRoll)
        Thread.sleep(forTimeInterval: 0.5)
        print("\(name) rolls a \(defendRoll) for defense!")
        if defendRoll == 1 {
            disaster()
            return .DisasterDefense
            
        } else if defendRoll > 12 && defendRoll != 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name) defends successfully!")
            return .SuccessDefense
            
        } else if defendRoll == 20 {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name) gets a counter attack")
            return .CounterDefense
            
        } else {
//            Thread.sleep(forTimeInterval: 1)
            print("\n\(name)'s defense failed.")
            return .FailDefense
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
    
    func disaster() {
        var disaster = Disasters.allCases.randomElement()
        
        switch disaster {
            case .dragon:
            print("\n\(self.name) was eaten by a dragon, your journey ends here!")
            animations.printDust()
            case .troll:
            print("\(self.name) was smashed by a troll, farewell young warrior!")
            animations.printSmash()
            case .abyss:
            print("\(self.name) tripped and fell into an abyss, bye bye!")
            animations.printAbyss()
            case .hydra:
            print("\(self.name) was consumed by a hydra, its many heads fighting for the feast!")
            animations.printHydra()
            case .dust:
            print("\(self.name) was turned to dust by a powerful curse, their soul lost to the void!")
            animations.printDust()
            default:
            print("\(self.name) was dragged into a portal by a dark sorcery, their fate sealed in another dimension!")
            animations.printPortal()
        }
    }

    func damage() -> Int {
//        Thread.sleep(forTimeInterval: 2)
        print("\n\(name) rolls for damage!")
        _ = readLine()
        // D6.printRollingDice()
        let damageRoll = rollDice(6)
//        Thread.sleep(forTimeInterval: 1)
        print("\(name) deals \(damageRoll) damage!\n")
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
    
}
