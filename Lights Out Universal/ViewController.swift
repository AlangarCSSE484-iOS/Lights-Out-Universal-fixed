//
//  ViewController.swift
//  Lights Out Universal
//
//  Created by CSSE Department on 3/15/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameBoardButtons: [UIButton]!
    
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    var game = LinearLightsOutGame(numLights: 13)
    var onLight = #imageLiteral(resourceName: "light_on")
    var offLight = #imageLiteral(resourceName: "light_off")
    
    @IBAction func pressedNewGame(_ sender: Any) {
        print("You pressed new game!")
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        //updateView()
        
    }
    
    @IBAction func gameButtonPressed(_ sender: Any) {
        let gameBoardButtons = sender as! UIButton
        print(gameBoardButtons.tag)
        game.pressedLightAtIndex(gameBoardButtons.tag)
        updateView()
    }
    
    
    func updateView() {
        for i in 0..<13 {
            let button = gameBoardButtons[i]
            if (game.lightStates[i]){
                button.setImage(onLight, for: UIControlState.normal)
            } else {
                button.setImage(offLight, for: UIControlState.normal)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

