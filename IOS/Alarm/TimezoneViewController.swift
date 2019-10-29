//
//  TimezoneViewController.swift
//  Alarm-ios-swift
//
//  Created by David Holtz on 9/25/19.
//  Copyright © 2019 LongGames. All rights reserved.
//

import Foundation
import UIKit

class TimezoneViewController: UITableViewController {
    
//    var weekdays: [Int]!
    
    var tzStr: String!
//    var abbr = "GMT"
    var cars = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cars = ["BMW","Audi","Volkswagen"]
        
        var timeZoneAbbreviations: [String:String] { return TimeZone.abbreviationDictionary }
        cars = Array(timeZoneAbbreviations.values)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        performSegue(withIdentifier: Id.timezoneUnwindIdentifier, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 2
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    // 3
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        var timeZoneAbbreviations: [String:String] { return TimeZone.abbreviationDictionary }
        let selected = cell.textLabel!.text!
        let filtered = timeZoneAbbreviations.filter { $0.value == selected }
        let dat = Array(filtered.keys)[0]
        tzStr = dat
        performSegue(withIdentifier: Id.timezoneUnwindIdentifier, sender: self)
    }
}
