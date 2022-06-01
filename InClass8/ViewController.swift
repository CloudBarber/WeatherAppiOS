//
//  ViewController.swift
//  InClass8
//
//  Created by Evans, Jonathan on 3/22/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //var colors = ["Red","Blue","Green","Purple"]
    let cities = [
        "US":["Charlotte", "Chicago", "New York", "Miami", "San Francisco", "Baltimore", "Houston"],
        "UK":["London", "Bristol", "Cambridge", "Liverpool"],
        "AE":["Abu Dhabi", "Dubai", "Sharjah"],
        "JP":["Tokyo", "Kyoto", "Hashimoto", "Osaka"]
    ]
    
   
    
    var states = [String]()
    var state = "default"
    var city = "default"
    var weatherOutput: String?
    var cityInfo: City?
    var cityList = [City]()
    var selectedCountry = [City]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        states.append(contentsOf: cities.keys)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        //print("prepare for segue called !!")
        
        if segue.identifier == "toDisplay"{
            //print("going to the details page")
            
            let indexPath = self.tableView.indexPathForSelectedRow
            state = states[indexPath!.section]
            let citiesInState = cities[state]
            city = citiesInState![indexPath!.row]
            
            let destinationVC = segue.destination as! DisplayViewController
            destinationVC.cityName = city
            destinationVC.countryName = state
        }
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let state = states[section]
        return state
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let state = states[section]
        return (cities[state]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let state = states[indexPath.section]
        let citiesInState = cities[state]
        let city = citiesInState![indexPath.row]
        
        cell.textLabel?.text = city
        return cell
        
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return states.count
    }
    
}
