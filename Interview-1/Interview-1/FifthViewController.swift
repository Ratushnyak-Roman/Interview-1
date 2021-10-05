//
//  FifthViewController.swift
//  Interview-1
//
//  Created by mac on 04.10.2021.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult.text = computerRounds < playerRounds ?  "You Lose" :  computerRounds > playerRounds ? "You Win" : "It's a draw"
    }
    
    var computerRounds = 0
    var playerRounds = 0

    @IBOutlet weak var gameResult: UILabel!
    
}
