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
    @IBOutlet weak var firstPicture: UIButton!
    @IBOutlet weak var secondPicture: UIButton!
    @IBOutlet weak var thirdPicture: UIButton!
    @IBOutlet weak var fourthPicture: UIButton!
    @IBOutlet weak var toswipe: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Actions

    
    @IBAction func firstButton() {
      firstButtonctivated()
       
        
    }
    
    
    @IBAction func secondButton() {
         secondButtonactivated()
    }
    @IBAction func ThirdButton() {
        thirdButtonactivated()
    }
    
    // Functions
    
    //first button
    private func firstButtonctivated() {
        //Modiyfing background picture first picture
        //FirstPicture.setBackgroundImage(UIImage(named: "bigrectangle"), for: .normal)
        //Hidding second picture
        secondPicture.isHidden = true
        
    }
    //Second button
    private func secondButtonactivated()
    {
        fourthPicture.isHidden = true
        
    }
    
    
    //Third button
    
    private func thirdButtonactivated()
    {
        firstPicture.isHidden = false
        secondPicture.isHidden = false
        thirdPicture.isHidden = false
        fourthPicture.isHidden = false
        
    }
  
}

