//
//  ViewController.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/5/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit
import os.log

class FurnitureViewController: UIViewController,UITextFieldDelegate,
    UIImagePickerControllerDelegate,  UINavigationControllerDelegate{
    //MARK: Properties
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var sizeField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    var fur: Furniture?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
        if let fur = fur{
            navigationItem.title = fur.name
            nameField.text = fur.name
            photoImageView.image = fur.photo
            sizeField.text = String(fur.fursize)
        
            
        }
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddFurMode = presentingViewController is UINavigationController
        if isPresentingInAddFurMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
            
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameField.text ?? ""
        let photo = photoImageView.image
        let fursize = Int(sizeField.text ?? "")
        let type = "Sofa"
        
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        fur = Furniture(name: name, photo: photo, fursize: fursize!,type : type)
    }

    //MARK: Actions
  
  
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }

    @IBAction func addButton(_ sender: UIButton) {
    }
    
  }

