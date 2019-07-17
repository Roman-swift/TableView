//
//  AddTaskTableViewController.swift
//  lection_ tableView_1.07
//
//  Created by Роман Родителев on 7/8/19.
//  Copyright © 2019 Роман Родителев. All rights reserved.
//

import UIKit
import Foundation

class AddTaskTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var activity: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    @IBOutlet weak var addressTask: UITextField!
    
    var addPicture = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        titleTask.delegate = self
        descriptionTask.delegate = self
        addressTask.delegate = self
        self.addPicture.delegate = self
        addDateLabel()
    }
    
    private func checkSaveOrNot()  {
        if titleTask.hasText && descriptionTask.hasText {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    private func addDateLabel() {
        let editDate = DateFormatter()
        
        editDate.dateStyle = DateFormatter.Style.long
        editDate.timeStyle = DateFormatter.Style.short
        
        let strDate = editDate.string(from: taskDatePicker.date)
        dateLabel.text = strDate
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addPicturePicker(_ sender: UIButton) {
        self.addPicture.allowsEditing = false
        self.addPicture.sourceType = .savedPhotosAlbum
        self.present(addPicture, animated: true, completion: nil)
    }
    @IBAction func addDatePicker(_ sender: UIDatePicker) {
        addDateLabel()
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if let image = imageView.image?.pngData(), let title = titleTask.text, let description = descriptionTask.text, let adress = addressTask.text {
            let task = Task(title: title, description: description, isActive: activity.isOn, image: image, date: taskDatePicker.date, adress: adress)
            let source = self.popoverPresentationController?.delegate as! ViewController
            source.saveTask(task: task)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension AddTaskTableViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkSaveOrNot()
    }
}

extension AddTaskTableViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        checkSaveOrNot()
    }
}

extension AddTaskTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}
