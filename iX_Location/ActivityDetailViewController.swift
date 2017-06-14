//
//  ActivityDetailViewController.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/7/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var activity: ActivityDto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = activity?.name
        descriptionLabel.text = activity?.description
        dateLabel.text = activity?.date
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

}
