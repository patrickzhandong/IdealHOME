//
//  FurnitureTableViewController.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/11/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit
import os.log

class FurnitureTableViewController: UITableViewController {
    //MARK: Properties
    var furnitures = [Furniture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let savedFurs = loadFurs() {
            furnitures += savedFurs
        }
        else {
            // Load the sample data.
            loadSampleFurnitures()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return furnitures.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FurnitureTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FurnitureTableViewCell

        let fur = furnitures[indexPath.row]
        cell?.nameLabel.text = fur.name
        cell?.photoImageView.image = fur.photo
        cell?.furSize.text = String(fur.fursize)
        return cell!
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
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
            case "AddItem":
                os_log("Adding a new fur.", log: OSLog.default, type: .debug)
            
            case "showDetail":
                guard let furDetailViewController = segue.destination as? FurnitureViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
                guard let selectedFurCell = sender as? FurnitureTableViewCell else {
                    fatalError("Unexpected sender: \(sender)")
                }
            
                guard let indexPath = tableView.indexPath(for: selectedFurCell) else {
                    fatalError("The selected cell is not being displayed by the table")
                }
            
                let selectedFur = furnitures[indexPath.row]
                furDetailViewController.fur = selectedFur
            
            default:
                fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    //MARK: Actions
    @IBAction func unwindToFurList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FurnitureViewController, let fur = sourceViewController.fur {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                furnitures[selectedIndexPath.row] = fur
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
            // Add a new meal.
                let newIndexPath = IndexPath(row: furnitures.count, section: 0)
            
                furnitures.append(fur)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveFurs()
        }
    }
    //MARK: Private Methods
    
    private func loadSampleFurnitures() {
        let photo1 = UIImage(named: "bed")
        let photo2 = UIImage(named: "chair")
        let photo3 = UIImage(named: "coach")
        guard let fur1 = Furniture(name: "bed", photo: photo1, fursize: 4)
        else {
            fatalError("Unable to instantiate fur1")
        }
        
        guard let fur2 = Furniture(name: "chair", photo: photo2, fursize: 5) else {
            fatalError("Unable to instantiate fur2")
        }
        
        guard let fur3 = Furniture(name: "coach", photo: photo3, fursize: 3) else {
            fatalError("Unable to instantiate fur3")
        }
        furnitures += [fur1,fur2,fur3]
        
        
    }
    private func saveFurs() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(furnitures, toFile: Furniture.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Furnitures successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save Furnitures...", log: OSLog.default, type: .error)
        }
        
        
    }
    private func loadFurs() -> [Furniture]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Furniture.ArchiveURL.path) as? [Furniture]
    }
    
}
