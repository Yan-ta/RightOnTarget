//
//  Game.swift
//  RightOnTarget
//
//  Created by Ян Таше on 23.03.2022.
//
protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Флаг
    var isGameEnded: Bool { get }
    // Метод, который начинает новую игру
    func restartGame()
    // Метод, который начинает новый раунд
    func startNewRound()
    // Подсчет очков
    func calculateScore(with value: Int)
}

protocol Generator {
    var minSecretValue: Int { get }
    var maxSecretValue: Int { get }
    func getNewSecretValue() -> Int
}

class NumberGenerator: Generator {
    var minSecretValue: Int
    var maxSecretValue: Int
    
    init?(minSV: Int, maxSV: Int) {
        guard minSV <= maxSV else {
            return nil
        }
        minSecretValue = minSV
        maxSecretValue = maxSV
    }
    
    func getNewSecretValue() -> Int {
        return (minSecretValue...maxSecretValue).randomElement()!
    }
}

class Game: GameProtocol {
    var generator: NumberGenerator
    var score: Int = 0
    var currentSecretValue: Int = 0
    private var lastRound: Int
    var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(rounds: Int, generator: NumberGenerator) {
        self.generator = generator
        lastRound = rounds
        currentSecretValue = generator.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = generator.getNewSecretValue()
        currentRound += 1
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
        score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
          score += 50 - currentSecretValue + value
        } else {
          score += 50
        }
    }
}
