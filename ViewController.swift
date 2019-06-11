//
//  ViewController.swift
//  Instagrid
//
//  Created by Michael Aidan on 25/05/2019.
//  Copyright © 2019 Michael Aidan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var FirstPicture: UIButton!
    @IBOutlet weak var SecondPicture: UIButton!
    @IBOutlet weak var ThirdPicture: UIButton!
    @IBOutlet weak var FourthPicture: UIButton!
    @IBOutlet weak var toswipe: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Actions

    
    @IBAction func FirstButton() {
       firstbuttonactivated()
       
        
    }
    
    @IBAction func SecondButton(_ sender: Any) {
    }
    
    @IBAction func ThirdButton(_ sender: Any) {
    }
    
    // Functions
    
    //first button
    private func firstbuttonactivated() {
        //Modiyfing background picture first picture
        //FirstPicture.setBackgroundImage(UIImage(named: "bigrectangle"), for: .normal)
        //Hidding second picture
        SecondPicture.isHidden = true
        
    }
    //Second button
    
    //Third button
    
  
}

