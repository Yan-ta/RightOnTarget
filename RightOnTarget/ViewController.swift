//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Ян Таше on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    var generator: NumberGenerator!
    
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var myButton: UIButton!
    @IBOutlet var labelNumber: UILabel!
    @IBOutlet var label50: UILabel!
    @IBOutlet var label01: UILabel!
    @IBOutlet var MessageLabel: UILabel!
        
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generator = NumberGenerator(minSV: 1, maxSV: 50)
        game = Game(rounds: 5, generator: generator)
        myButton.layer.cornerRadius = 10
        mySlider.minimumValue = 1
        mySlider.maximumValue = 50
        mySlider.value = 25
        updateLabelWithNewSecretValue(newText: String(game.currentSecretValue))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
        
    

    @IBAction func checkButton(_ sender: Any) {
        game.calculateScore(with: Int(mySlider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
            MessageLabel.text = "\(game.currentRound)-й раунд"
        } else {
            game.startNewRound()
            MessageLabel.text = "\(game.currentRound)-й раунд"
        }
        updateLabelWithNewSecretValue(newText: String(game.currentSecretValue))
    }
    
    private func updateLabelWithNewSecretValue(newText: String) {
        labelNumber.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
        title: "Игра окончена",
        message: "Вы заработали \(score) очков",
        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
}

