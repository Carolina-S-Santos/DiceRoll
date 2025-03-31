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
        print("\(name ?? "Player")'s turn: Roll your d20 for attack!")
        _ = readLine()

        let attackRoll = rollDice()
        print("\(name ?? "Player") rolls a \(attackRoll) for attack!")

        if attackRoll > 10 {
            print("\(name ?? "Player") attacks successfully!")
            return true
        } else {
            print("\(name ?? "Player")'s attack failed.")
            return false
        }
    }

    func defend() -> Int {
        print("\(name ?? "Player")'s turn: Roll your d20 for defense!")
        _ = readLine()

        let defendRoll = rollDice()
        print("\(name ?? "Player") rolls a \(defendRoll) for defense!")

        if defendRoll > 12 && defendRoll != 20 {
            print("\(name ?? "Player") defends successfully!")
            return 0
        } else if defendRoll == 20 {
            print("\(name ?? "Player") gets a counter attack")
            return 1
        } else {
            print("\(name ?? "Player")'s defense failed.")
            return -1
        }
    }

    func damage() -> Int {
        print("\(name ?? "Player") rolls for damage!")
        _ = readLine()

        let damageRoll = rollDice()
        print("\(name ?? "Player") deals \(damageRoll) damage!")
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
            print("Player: \(playerName), Health: \(health) HP")
        } else {
            print("Player name is not set, Health: \(health) HP")
        }
    }

}
