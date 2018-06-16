//
//  ViewController.swift
//  mwCam
//
//  Created by Dynmk Studio on 6/16/18.
//  Copyright © 2018 Dynmk Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var imgVw: UIImageView!
    @IBOutlet var subjectField: UITextField!
    @IBOutlet var bodyField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func takePic(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgVw.contentMode = .scaleToFill
            imgVw.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        let defaults = `UserDefaults`.standard
        
        defaults.set(subjectField.text, forKey: "subjectField")
        defaults.set(bodyField.text, forKey: "bodyField")
        defaults.synchronize()
        
        print("sf=\(subjectField.text), bf=\(bodyField.text)")
    }
    
    @IBAction func clearBtn(_ sender: Any) {
//        if(subjectField.text == ""){
//            loadDefaults()
//            clearBtn.setTitle("Clear", forState: .Normal)
//        }
//        else {
//            subjectField.text = ""
//            bodyField.text = ""
//            clearBtn.setTitle("Load", forState: .Normal)
//        }
    }
    
    func loadDefaults() {
        let defaults = `UserDefaults`.standard
        subjectField.text = defaults.object(forKey: "subjectField") as? String
        bodyField.text = defaults.object(forKey: "bodyField") as? String
    }
    
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
        case subjectField:
            bodyField.becomeFirstResponder()
        default:
            bodyField.resignFirstResponder()
        }

        return true

    }

}

