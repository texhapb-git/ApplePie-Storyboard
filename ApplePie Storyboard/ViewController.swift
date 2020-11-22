//
//  ViewController.swift
//  ApplePie Storyboard
//
//  Created by Максим Иванов on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var guessWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IB Actions
    

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

