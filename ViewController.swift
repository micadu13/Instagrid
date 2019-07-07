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
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        swipeGesture.direction = .up
        self.view.addGestureRecognizer(swipeGesture)
        
        
        
    }
    
    @objc func swipedByUser(_ gesture:UISwipeGestureRecognizer){
        
    }
    
    func exportgrille(){
        //implementer la detection du swipe
        // 1 Instancier le swipe ou gesture recognizer
        // 2 Configurer le gesture recognizer
        // 3 Associer le swipe à la grille
        // 4 Exporter
    }
    
    func share(){
        //5  Proposer de partager
    }
    
    @IBAction func swipeimage(_ sender: UISwipeGestureRecognizer) {
    }
    
    func factorisation(sender:UIButton){// On reçoit le paramètre sender qui a été envoyé depuis la fonction firstpictchosen
        tagselected = sender.tag// On stocke l'identifiant du bouton cliqué
        addImage()
    }
    
    
    
       //Action to choose pict
    
    @IBAction func firstpictchosen(_ sender: Any) {//On reçoit le boutton clické en tant que paramètre : sender
        let sent = sender as! UIButton// On va convertir ce paramètre vers un bouton
        factorisation(sender: sent)// On va passer ce boutton à la méthode factorisation qui va l'utiliser pour récupérer le tag
        
    }
    
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
    
    
    func addImage() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            //firstButton.setImage(image, for: .normal)
            
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
    
    
    

    //Action for bottom app
    
    @IBAction func firstPosition() {
        firstButtonactivated()
    }
    
    
    @IBAction func secondPosition() {
        secondButtonactivated()
    }
    
    
    @IBAction func thirdPosition() {
        thirdButtonactivated()
    }

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


