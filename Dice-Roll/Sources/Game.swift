//
//  Game.swift
//  Dice-Roll
//
//  Created by aluno-111 on 08/04/25.
//

import Foundation
import os

class Game {
    lazy var terminal = Terminal()
    var isRunning = true

    public func start() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            while let self, self.isRunning {
                if let key = Terminal.getKeyPress() {
                    self.processInput(key)
                }
            }
        }

        // Execute the loop
        while isRunning {
            terminal.update()  // Update terminal canvas
            loop()  // Update game state
            draw()  // Update canvas
            terminal.render()  // Render canvas
            usleep(100_000)  // Sleep for 100ms
        }
    }
    
    // Process any inputs from user
    func processInput(_ key: String) {}

    // Update the game state
    func loop() {}

    // Update the canvas
    func draw() {}
}
