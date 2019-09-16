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
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var toswipe: UILabel!
    @IBOutlet weak var stackgrille: UIView!
    var tagselected:Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Creation of a swipeGestureRecognizer with top direction to put in action to export and share the pictures
        //Declaration of the method of the swipeGesture recognizer
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        //Giving the directon of the Swipe Gesture
        swipeGesture.direction = .up
        //Implementing the method of the Swipe Gesture Recognizer
        self.view.addGestureRecognizer(swipeGesture)
        
    }
    
    //----------------------------------Function to Swipe and export the grid --------------------------------------------------------------
    
    
    @objc func swipedByUser(_ gesture:UISwipeGestureRecognizer){
        //putting in a constance the position value of the grid
        let yposition_min = stackgrille.frame.minY
        //Implementation of the translation
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX:0, y: -800)
        UIView.animate(withDuration: 3, animations: {
            self.stackgrille.transform = translationTransform
        }, completion: nil)
        
        //Creates a bitmap-based graphics context with the specified options.
        UIGraphicsBeginImageContextWithOptions(stackgrille.bounds.size, true, 0)
        stackgrille.drawHierarchy(in: stackgrille.bounds, afterScreenUpdates: true)
        
        //Returns an image based on the contents of the current bitmap-based graphics context.
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let items = [image]
        
        //Starting UIAcitivyViewController
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        ac.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
        var translationTransform: CGAffineTransform
        
        //stackgrille is coming back after to its inital position
        translationTransform = CGAffineTransform(translationX:0, y: yposition_min)
        UIView.animate(withDuration: 3, animations: {
        self.stackgrille.transform = translationTransform
        }, completion: nil)
  
        }
        self.present(ac, animated: true)
   
    }
    
//---------------------------------------------Replacing images to a button-----------------------------------------------------------------

//Factorisating the code
  func factorisation(sender:UIButton){// We receive the parameter "sender" that has been sent from function firstpictchosen
        tagselected = sender.tag// We storage the id of the clicked button
        addImage()
    }

//Action to choose pict
    
    @IBAction func firstpictchosen(_ sender: Any) {// We receive the clicked button as parameter : sender
        let sent = sender as! UIButton// We are are going to convert this parameter through a button
        factorisation(sender: sent)// We are going to pass the button to the method "factorisation" which is goig to pick up the tag
    }
// We make the same thing for the 3 other pictures
    
    @IBAction func secondpictchosen(_ sender: Any) {
        let sent = sender as! UIButton
        factorisation(sender: sent)
    }
    
    @IBAction func thirdpictchosen(_ sender: Any) {
        let sent = sender as! UIButton
        factorisation(sender: sent)
    }
    
    @IBAction func thourthpictchosen(_ sender: Any) {
        let sent = sender as! UIButton
        factorisation(sender: sent)
    }
    
    //  Function to replace image instead of button
    func addImage() {
        let image = UIImagePickerController()
        image.delegate = self //implementing delegate function
        image.sourceType = .photoLibrary // chosing the sourcing with Photolibrary
        image.allowsEditing = true
        self.present(image, animated: true)
    }
    
    // MARK: - Swift updated
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
    
    
    
    // Able to take the pictures and to replace it instead of button
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image =  info[.originalImage] as? UIImage {
            switch tagselected {
            case 1:
                firstButton.setImage(image, for: .normal)
            case 2:
                secondButton.setImage(image, for: .normal)
            case 3:
                thirdButton.setImage(image, for: .normal)
            case 4:
                fourthButton.setImage(image, for: .normal)
                break
            default:
                print("OK")
            }
            
        }
        
    }
    
//------------------------------------------Changing disposition of the app view & appaerance of the view ------------------------------------------------
    //Action for bottom app
    // Actions to change the view of the app with the buttons
    
    @IBAction func firstPosition() {
        firstButtonactivated()
    }
    
    
    @IBAction func secondPosition() {
        secondButtonactivated()
    }
    
    
    @IBAction func thirdPosition() {
        thirdButtonactivated()
    }

//---------------------------------------------Parametring disposition of the app thanks to the property "is hidden"-------------------------------
    func firstButtonactivated () {
        firstButton.isHidden = false
        secondButton.isHidden = true
        thirdButton.isHidden = false
        fourthButton.isHidden = false
        
    }
    
    func secondButtonactivated()
    {
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = true
    }
    
    func thirdButtonactivated(){
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
    }
    
}


