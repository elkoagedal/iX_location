//
//  AddActivityViewController.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/5/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import UIKit

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
        newActivity?.name = nameTextField.text!
        newActivity?.description = DescriptionTextView.text
        
        delegate?.didSaveActivity(activity: newActivity!)
        dismiss(animated: true, completion: nil)
    }
    
    
}
