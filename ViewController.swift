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
    @IBOutlet weak var toSwipe: UILabel!
    @IBOutlet weak var stackGrille: UIView!
    var tagselected:Int?
    var swipeGesture: UISwipeGestureRecognizer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Creation of a swipeGestureRecognizer with top direction to put in action to export and share the pictures
        //Declaration of the method of the swipeGesture recognizer
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        //Giving the directon of the Swipe Gesture
        //swipeGesture.direction = .up
        if UIDevice.current.orientation.isLandscape {
            swipeGesture.direction = .left
        }
        else{
            swipeGesture.direction = .up
        }
        //Implementing the method of the Swipe Gesture Recognizer
        self.view.addGestureRecognizer(swipeGesture)
        self.swipeGesture = swipeGesture
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            swipeGesture?.direction = .left
        } else {
            print("Portrait")
            swipeGesture?.direction = .up
        }
    }
    
    //----------------------------------Function to Swipe and export the grid --------------------------------------------------------------
    
    // Adapt disposition of the orientation
    
    
    
    @objc func swipedByUser(_ gesture:UISwipeGestureRecognizer)
    {
        //Swipe according disposition
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let items = [image]
        
        if UIDevice.current.orientation.isLandscape {
            animateGridHorizontally(-800)
            
            creationBitMap()
            let ac1 = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
            ac1.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                self.animateGridHorizontally(0)
            }
            present(ac1, animated: true)
            
        }
            
        else {
            animateGridVertically(-800)
            creationBitMap()
            //Starting UIAcitivyViewController
            let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
            ac.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                self.animateGridVertically(0)
            }
            
            present(ac, animated: true)
        }
        
    }
    
   
    func animateGridVertically(_ position: CGFloat) {
        var translationTransform: CGAffineTransform
        
        //stackGrille is coming back after to its inital position
        translationTransform = CGAffineTransform(translationX:0, y: position)
        UIView.animate(withDuration: 3, animations: {
            self.stackGrille.transform = translationTransform
        }, completion: nil)
        
    }
    
    
    func animateGridHorizontally(_ position : CGFloat){
        var translationTransform: CGAffineTransform
        
        //stackGrille is coming back after to its inital position
        translationTransform = CGAffineTransform(translationX:position, y:0 )
        UIView.animate(withDuration: 3, animations: {
            self.stackGrille.transform = translationTransform
        }, completion: nil)
    }
    
    func creationBitMap(){
        UIGraphicsBeginImageContextWithOptions(stackGrille.bounds.size, true, 0)
        stackGrille.drawHierarchy(in: stackGrille.bounds, afterScreenUpdates: true)
    }
    
    
    //---------------------------------------------Replacing images to a button-----------------------------------------------------------------
    
    //Factorisating the code
    func prepareForImagePicker(sender:UIButton){// We receive the parameter "sender" that has been sent from function firstPictChosen
        tagselected = sender.tag// We storage the id of the clicked button
        addImage()
    }
    
    //Action to choose pict
    
    @IBAction func firstPictChosen(_ sender: Any) {// We receive the clicked button as parameter : sender
        let sent = sender as! UIButton// We are are going to convert this parameter through a button
        prepareForImagePicker(sender: sent)// We are going to pass the button to the method "factorisation" which is goig to pick up the tag
    }
    // We make the same thing for the 3 other pictures
    
    @IBAction func secondPictChosen(_ sender: Any) {
        let sent = sender as! UIButton
        prepareForImagePicker(sender: sent)
    }
    
    @IBAction func thirdPictChosen(_ sender: Any) {
        let sent = sender as! UIButton
        prepareForImagePicker(sender: sent)
    }
    
    @IBAction func thourthPictChosen(_ sender: Any) {
        let sent = sender as! UIButton
        prepareForImagePicker(sender: sent)
    }
    
    //  Function to replace image instead of button
    func addImage() {
        let image = UIImagePickerController()
        image.delegate = self //implementing delegate function
        image.sourceType = .photoLibrary // chosing the sourcing with Photolibrary
        image.allowsEditing = true
        self.present(image, animated: true)
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
        firstButtonActivated()
    }
    
    
    @IBAction func secondPosition() {
        secondButtonActivated()
    }
    
    
    @IBAction func thirdPosition() {
        thirdButtonActivated()
    }
    
    //---------------------------------------------Parametring disposition of the app thanks to the property "is hidden"-------------------------------
    func firstButtonActivated () {
        firstButton.isHidden = false
        secondButton.isHidden = true
        thirdButton.isHidden = false
        fourthButton.isHidden = false
        
    }
    
    func secondButtonActivated()
    {
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = true
    }
    
    func thirdButtonActivated(){
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
    }
    
}


