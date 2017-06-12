//
//  ActivityLogTableViewController.swift
//  iX_Location
//
//  Created by Emily Koagedal on 6/6/17.
//  Copyright © 2017 Emily Koagedal. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class ActivityLogTableViewController: UITableViewController, AddActivityDelegate {

    var activities: [Activity] = []

    func didSaveActivity(activity: Activity) {
        activities.append(activity)
        self.tableView.reloadData()
    }
    
    
    func didCancelActivity() {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       /*
        let activity1 = Activity()
        activity1?.name = "First"
        activity1?.description = "First Activity"
        activities.append(activity1!)
        
        let activity2 = Activity()
        activity2?.name = "Second"
        activity2?.description = "Second Activity"
        activities.append(activity2!)
        
        let response = JSON as! NSDictionary
        
        for (key, value) in response {
            let activity = Activity()
            if let actDictionary = value as? [String: AnyObject]{
                activity?.name = actDictionary ["name"] as! String
                activity?.description = actDictionary ["description"] as! String
                if let geoPointDictionary =
            }
        }
*/
        Alamofire.request("https://ixlocation-5fe61.firebaseio.com/activities.json").responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                /*
                let response = JSON as! NSDictionary
                
                for (key, value) in response {
                    let activity = Activity()
                    
                    if let actDictionary = value as? [String : AnyObject] {
                        activity?.name = actDictionary["name"] as! String
                        activity?.description = actDictionary["description"] as! String
                        
                        if let geoPointDictionary = actDictionary["location"] as? [String: AnyObject] {
                            let location = GeoPoint()
                            location.lat = geoPointDictionary["lat"] as? Double
                            location.lng = geoPointDictionary["lng"] as? Double
                            activity?.location = location
                            
                     //       let annotation = MKPointAnnotation()
                      //      annotation.coordinate = CLLocationCoordinate2DMake((activity?.location?.lat!)!, (activity?.location?.lng!)!);
                      //      annotation.title = activity?.name
                            //self.map.addAnnotation(annotation)
                        }
                    }
                    
                    self.activities.append(activity!)
                }
                self.tableView.reloadData()
                */
            }
        }
    }
 
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddActivity", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = activities[indexPath.row].name
        cell.detailTextLabel?.text = activities[indexPath.row].description
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "navToActivityDetail"{
            let activityDetailViewController = segue.destination as! ActivityDetailViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell)
            
            activityDetailViewController.activity = activities[(indexPath?.row)!]
    }
        if segue.identifier == "addActivity" {
            //let navigationViewController = segue.destination as! UINavigationController
            
            let addActivityViewController = segue.destination as! AddActivityViewController //navigationViewController.topViewController as! AddActivityViewController
            
            //addActivityViewController.activityTableViewController = self
            addActivityViewController.delegate = self
        }
        
}
}
