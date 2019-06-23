//
//  ViewController.swift
//  Instagrid
//
//  Created by Michael Aidan on 25/05/2019.
//  Copyright © 2019 Michael Aidan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
    //Outlets
    @IBOutlet weak var firstPicture: UIButton!
    @IBOutlet weak var secondPicture: UIButton!
    @IBOutlet weak var thirdPicture: UIButton!
    @IBOutlet weak var fourthPicture: UIButton!
    @IBOutlet weak var toswipe: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
     let imagepicker = UIImagePickerController()
    
       //Action to choose pict
    
    @IBAction func firstpictchosen(_sender: Any) {
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = true
        present(imagepicker, animated: true,completion: nil)

    }
    
    
@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
    
        print(image)
    }
    
 //Action for bottom app
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
        firstPicture.isHidden = false
        secondPicture.isHidden = true
        thirdPicture.isHidden = false
        fourthPicture.isHidden = false
        
    }
    //Second button
    private func secondButtonactivated()
    {
        firstPicture.isHidden = false
        secondPicture.isHidden = false
        thirdPicture.isHidden = false
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


