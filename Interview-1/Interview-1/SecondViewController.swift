//
//  SecondViewController.swift
//  Interview-1
//
//  Created by mac on 04.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumberTF ()
    }
    
    private func updateNumberTF (){
        let playerNumber = numberTF.text ?? ""
        guessButton.isEnabled = !playerNumber.isEmpty
    }
    

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    
    @IBAction func guessButton(_ sender: UIButton) {
        let x = (numberTF.text! as NSString).integerValue
        guard x >= 0 && x <= 100 else { return }
        performSegue(withIdentifier: "computerTurn", sender: nil)
    }
    
    @IBAction func numberTFChanged(_ sender: UITextField) {
        updateNumberTF ()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ThirdViewController else { return }
        dvc.playerNumber = numberTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
