//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var notStartedArr:[(String, Date)] = []
    var inProgressArr:[(String, Date)] = []
    var completedArr:[(String, Date)] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sortButton: UIButton!

    @IBAction func sortInfo(_ sender: UIButton) {
        if sender.titleLabel?.text == "Sort descending" {
            changeDirection(isAcsending: false)
            sortButton.setTitle("Sort ascending", for: .normal)
        } else {
            changeDirection(isAcsending: true)
            sortButton.setTitle("Sort descending", for: .normal)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return notStartedArr.count
        case 1:
            return inProgressArr.count
        case 2:
            return completedArr.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = notStartedArr[indexPath.row].0
            cell.detailTextLabel?.text = notStartedArr[indexPath.row].1.description(with: Locale(identifier:"en"))
        } else if indexPath.section == 1 {
            cell.textLabel?.text = inProgressArr[indexPath.row].0
            cell.detailTextLabel?.text = inProgressArr[indexPath.row].1.description(with: Locale(identifier:"en"))
        }else {
            cell.textLabel?.text = completedArr[indexPath.row].0
            cell.detailTextLabel?.text = completedArr[indexPath.row].1.description(with: Locale(identifier:"en"))
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Task.Status.notStarted.rawValue
        case 1:
            return Task.Status.inProgress.rawValue
        case 2:
            return Task.Status.completed.rawValue
        default:
            return "should not print"
        }
    }
    
    func changeDirection(isAcsending: Bool) {
        notStartedArr = sort(isAscending: isAcsending, array: notStartedArr)
        inProgressArr = sort(isAscending: isAcsending, array: inProgressArr)
        completedArr = sort(isAscending: isAcsending, array: completedArr)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
        notStartedArr = sort(isAscending: true, array: notStartedInfo())
        inProgressArr = sort(isAscending: true, array: inProgressInfo())
        completedArr = sort(isAscending: true, array: completedInfo())
        // Do any additional setup after loading the view.
    }
    
   


}

