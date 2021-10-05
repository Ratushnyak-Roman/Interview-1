//
//  FourthViewController.swift
//  Interview-1
//
//  Created by mac on 04.10.2021.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumberTF()
        
    }
    
    private func updateNumberTF() {
        let playerNumber = numberTF.text ?? ""
        
        guessButton.isEnabled = !playerNumber.isEmpty
    }

    var round = 1
    var number = Int.random(in: 0...100)
    var computerRounds = 0

    
    @IBOutlet weak var rounds: UILabel!
    @IBOutlet weak var numberIs: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var numberTF: UITextField!
    
    
    @IBAction func numberTFChanged(_ sender: UITextField) {
        updateNumberTF ()
    }
    
    @IBAction func guessButton(_ sender: UIButton) {
        if numberIs.text != "Number is =" {
            comparison()
            rounds.text = "Round № \(round)"
        } else {
            performSegue(withIdentifier: "endGame", sender: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func comparison () {
        let playerNumber = (numberTF.text! as NSString).integerValue
        let x = true
        switch x {
        case playerNumber < number:
            numberIs.text = "Number is >"
            round += 1
        case playerNumber > number:
            numberIs.text = "Number is <"
            round += 1
        case playerNumber == number:
            numberIs.text = "Number is ="
            guessButton.setTitle("Result", for: .normal)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? FifthViewController else { return }
        dvc.playerRounds = round
        dvc.computerRounds = computerRounds
    }
    
}
