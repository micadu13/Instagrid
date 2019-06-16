//
//  ViewController.swift
//  Instagrid
//
//  Created by Michael Aidan on 25/05/2019.
//  Copyright © 2019 Michael Aidan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
 
    //Outlets
    @IBOutlet weak var firstPicture: UIButton!
    @IBOutlet weak var secondPicture: UIButton!
    @IBOutlet weak var thirdPicture: UIButton!
    @IBOutlet weak var fourthPicture: UIButton!
    @IBOutlet weak var toswipe: UILabel!
    
    var firstpictchosen:ImagePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.firstpictchosen = ImagePicker(presentationController: self, delegate: self as ImagePickerDelegate)
    }
    
    
       //Action to choose pict
    
    @IBAction func showImagePickerfirstpict(_ sender: Any) {
        self.firstpictchosen.present(from: sender as! UIView)
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

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}

open class ImagePicker: NSObject {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    public func present(from sourceView: UIView) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        
        self.delegate?.didSelect(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {
    
}

extension ViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.firstPicture.image = image
}
}

