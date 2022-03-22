//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Ян Таше on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var myButton: UIButton!
    @IBOutlet var labelNumber: UILabel!
    @IBOutlet var label50: UILabel!
    @IBOutlet var label01: UILabel!
    @IBOutlet var MessageLabel: UILabel!
    
    private var number: Int = 0
    private var round: Int = 1
    private var points: Int = 0
    private var numberFromSlider: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = 10
        mySlider.minimumValue = 1
        mySlider.maximumValue = 50
        mySlider.value = 25
        number = Int.random(in: 1...50)
    }
        
    func countPointsForRound(usersNumber: Int) {
        var pointsForRound: Int = 0
        if number == usersNumber {
            pointsForRound = 50 }
        else if number > usersNumber {
            pointsForRound = 50 - number + usersNumber
            
        } else {
            pointsForRound = 50 - usersNumber + number
        }
        points += pointsForRound
    }

    @IBAction func checkButton(_ sender: Any) {
        switch round {
        case 1:
            countPointsForRound(usersNumber: numberFromSlider)
            MessageLabel.text = "\(round)-й раунд, Ваш счет - \(points) "
            round += 1
        case 2:
            number = Int.random(in: 1...50)
            countPointsForRound(usersNumber: numberFromSlider)
            labelNumber.text = String(numberFromSlider)
            MessageLabel.text = "\(round)-й раунд, Ваш счет - \(points) "
            round += 1
        case 3:
            number = Int.random(in: 1...50)
            countPointsForRound(usersNumber: numberFromSlider)
            MessageLabel.text = "\(round)-й раунд, Ваш счет - \(points) "
            round += 1
        case 4:
            number = Int.random(in: 1...50)
            countPointsForRound(usersNumber: numberFromSlider)
            MessageLabel.text = "\(round)-й раунд, Ваш счет - \(points) "
            round += 1
        case 5:
            number = Int.random(in: 1...50)
            countPointsForRound(usersNumber: numberFromSlider)
            MessageLabel.text = "\(round)-й раунд, итог игры - \(points) "
            round = 1
            points = 0
            
        default: break
            
        }
        
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        numberFromSlider = Int(mySlider.value)
        labelNumber.text = String(numberFromSlider)
    }
}

