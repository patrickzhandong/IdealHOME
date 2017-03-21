//
//  CommentTableViewController.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/18/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit
import os.log

class CommentTableViewController: UITableViewController {
    //MARK: Properties
    var comments = [Comment]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadSampleComments()
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
        return comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "CommentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommentTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let comment = comments[indexPath.row]
        
        cell.titleLabel.text = comment.title
        cell.photoImageView.image = comment.photo
        cell.usernameLabel.text = comment.username

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
       super.prepare(for: segue, sender: sender)
        guard let commentDetailViewController = segue.destination as? CommentDetailViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedCommentCell = sender as? CommentTableViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedCommentCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedComment = comments[indexPath.row]
        commentDetailViewController.comment = selectedComment
    }
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CommunityViewController, let comment = sourceViewController.comment {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: comments.count, section: 0)
            
            comments.append(comment)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    //MARK: Private Methods
    private func loadSampleComments() {
        
        let photo1 = UIImage(named: "sofa")
        let photo2 = UIImage(named: "bed")
        let photo3 = UIImage(named: "coach")
        
        guard let comm1 = Comment(title: "Good Sofa", photo: photo1,comment:"Very good sofa", username:"user1" ) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let comm2 = Comment(title: "Fair Bed", photo: photo2, comment:"fair bed",username:"user2") else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let comm3 = Comment(title: "Bad coach", photo: photo3, comment:"It broke on the first day.",username:"user3") else {
            fatalError("Unable to instantiate meal2")
        }
        
        comments += [comm1, comm2, comm3]
    }

}
