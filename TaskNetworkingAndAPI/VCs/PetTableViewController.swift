//
//  PetTableViewController.swift
//  TaskNetworkingAndAPI
//
//  Created by Saleh Bin Essa on 04/03/2024.
//

import Foundation
import UIKit


class PetTableViewController: UITableViewController {
   
    var pets: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchBooksData()
    }
    
     func fetchBooksData() {
        NetworkManager.shared.fetchBooks { fetchedBooks in
            DispatchQueue.main.async {
                self.pets = fetchedBooks ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row for visual feedback
        tableView.deselectRow(at: indexPath, animated: true)

        // Create an instance of DetailAccountViewController
        let detailVC = DetailPetViewController()

        // Pass the selected bank account to the detail view controller
        let selectedPet = pets[indexPath.row]
        detailVC.pet = selectedPet

        // Navigate to DetailAccountViewController
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
