//
//  MasterViewController.swift
//  CatalystDemo3
//
//  Created by Beta on 07/11/2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var dogs: [Dog] = []
    private var breeds: [Breed] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            assertionFailure("Error: no API key found")
            return
        }
//        let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=100&order=Desc&mime_types=jpg,png")!
        let url = URL(string: "https://api.thedogapi.com/v1/breeds")!
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                let string = String(data: responseData, encoding: String.Encoding.utf8)
                print(String(describing: string))
                do {
//                    let dogs = try JSONDecoder().decode([Dog].self, from: responseData)
//                    self.dogs = dogs
                    let breeds = try JSONDecoder().decode([Breed].self, from: responseData)
                    self.breeds = breeds
                    print(breeds)
                } catch let jsonError {
                    print(jsonError)
                }
            } else if let networkError = error {
                print(networkError)
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let breed = breeds[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = breed
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let breed = breeds[indexPath.row]
        cell.textLabel!.text = breed.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            breeds.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
