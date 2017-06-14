//
//  AddActivityViewController.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/5/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import UIKit
import Alamofire
//import Realm

class AddActivityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func CancelButton(_ sender: Any) {
        delegate?.didCancelActivity()
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        
        let act = Activity()
        act?.name = nameTextField.text!
        act?.description = DescriptionTextView.text
       

        newActivity?.name = nameTextField.text!
        newActivity?.description = DescriptionTextView.text
       //newActivity?.date = DateTextField.text!

        self.delegate?.didSaveActivity(activity: self.newActivity!)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        DescriptionTextView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set image to display the selected image.
        imageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }    /*
        let params = newActivity?.toJSON()
        
    
        Alamofire.request("https://ixlocation-5fe61.firebaseio.com/activities.json", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            //print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            switch response.result {
            case .success(_):
                self.delegate?.didSaveActivity(activity: self.newActivity!)
                self.dismiss(animated: true, completion: nil)
            case .failure: break
                // Failure... handle error
            }
            
        }
        
        
        self.delegate?.didSaveActivity(activity: self.newActivity!)
        self.dismiss(animated: true, completion: nil)
    }
 
    */


}

