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
        // Création d'un swipeGestureRecognizer vers le haut pour permettre de faire l'export et le partage d'images
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        swipeGesture.direction = .up
        self.view.addGestureRecognizer(swipeGesture)
     
    }
    
    @objc func swipedByUser(_ gesture:UISwipeGestureRecognizer){
        //export de la grille en prenant en compte que nous exportons la grille et que nous faisons appel à la fonction UIGraphicsBeginImageContext pour unir les images puis exporter UIGraphicsGetImageFromCurrentImageContext
        UIGraphicsBeginImageContextWithOptions(stackgrille.bounds.size, true, 0)
        stackgrille.drawHierarchy(in: stackgrille.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // L'image est d'abord stockée dans une variable "image"
        let items = [image]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        
        
        exportgrille()
        //Création de l'animation
        switch gesture .state {
        case .began, .changed:
             UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: { self.stackgrille.alpha = 0.0})
        case .ended, .cancelled:
             UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: { self.stackgrille.alpha = 1.0})
        default:
            break
        }
    }
    
        //export de la grille en prenant en compte que nous exportons la grille et que nous faisons appel à la fonction UIGraphicsBeginImageContext pour unir les images puis exporter UIGraphicsGetImageFromCurrentImageContext
        func exportgrille()  {
        UIGraphicsBeginImageContextWithOptions(stackgrille.bounds.size, true, 0)
        stackgrille.drawHierarchy(in: stackgrille.bounds, afterScreenUpdates: true)
         let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         // L'image est d'abord stockée dans une variable "image"
            let items = [image]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        // L'image est ensuite exportée  et partagée via la fonction UIActivityViewController
            
           
            
            
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
    // On fait pareil pour les 3 autres dernières images
    
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
    
    // Fonction qui permet de commencer à ajouter une image à la place des boutons en récupérant les photos dans la photothèque
    func addImage() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)
    }
    

    // permet de récupérer les photos et de les remplacer a la place des boutons
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            
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
    // Actions sur les bouttons qui permettent de changer la disposition des photos de l'application
    
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


