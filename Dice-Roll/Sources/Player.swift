import Foundation

class Player {
    var name: String
    var health: Int = 10
    
    init(name: String) {
        self.name = name
    }

    func rollDice(_ sides : Int) -> Int {
        let numbers = [2, 6, 5, 14, 20]
        return numbers.randomElement()!
        //        return Int.random(in:1...sides)
    }

    enum AttackResult {
        case SuccessAttack, PerfectAttack, FailAttack, DisasterAttack
    }
    
    func attack() -> AttackResult {
        print("\n        /| ________________")
        print("  O|===|* >________________\\ \(name)'s turn: press 'Enter' to roll your d20 for attack!")
        print("        \\|")
        _ = readLine()
        
        animations.printRollingDice()
        let attackRoll = rollDice(20)
        
        animations.printd20(result: attackRoll)
        Thread.sleep(forTimeInterval: 0.5)
        print("\(name) rolls a \(attackRoll) for attack!")

        if attackRoll > 10 && attackRoll != 20 {
            print("\n\(name) attacks successfully!")
            return .SuccessAttack
            
        } else if attackRoll == 20 {
            print("\n\(name) Used their ULT, you cannot run!\n\n")
            animations.printUlt()

            return .PerfectAttack
            
        } else if attackRoll == 1{
            return .DisasterAttack
            
        } else {
            print("\n\(name)'s attack failed.")
            return .FailAttack
        }
    }

    enum DefenseResult {
        case SuccessDefense, CounterDefense, FailDefense, DisasterDefense
    }
    
    func defend() -> DefenseResult {

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
            print("\n\(name) defends successfully!")
            return .SuccessDefense
            
        } else if defendRoll == 20 {
            print("\n\(name) gets a counter attack")
            return .CounterDefense
            
        } else {
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
            print("\n\n\n\(self.name) was eaten by a dragon, your journey ends here!".uppercased().centralized())
            animations.printDragon()
            case .troll:
            print("\n\n\n\(self.name) was smashed by a troll, farewell young warrior!".uppercased().centralized())
            animations.printSmash()
            case .abyss:
            print("\n\n\n\(self.name) tripped and fell into an abyss, bye bye!".uppercased().centralized())
            animations.printAbyss()
            case .hydra:
            print("\n\n\n\(self.name) was consumed by a hydra, its many heads fighting for the feast!".uppercased().centralized())
            animations.printHydra()
            case .dust:
            print("\n\n\n\(self.name) was turned to dust by a powerful curse, their soul lost to the void!".uppercased().centralized())
            animations.printDust()
            default:
            print("\n\n\n\(self.name) was dragged into a portal by a dark sorcery, their fate sealed in another dimension!".uppercased().centralized())
            animations.printPortal()
        }
    }

    func damage() -> Int {
        Thread.sleep(forTimeInterval: 0.5)
        print("\n\(name) rolls for damage!\n")
        _ = readLine()
        let damageRoll = rollDice(6)
        animations.printRollingD6()
        animations.printd6(result: damageRoll)
        Thread.sleep(forTimeInterval: 0.6)
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
