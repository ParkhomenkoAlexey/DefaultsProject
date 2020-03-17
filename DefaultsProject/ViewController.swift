//
//  ViewController.swift
//  DefaultsProject
//
//  Created by Алексей Пархоменко on 17.03.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

enum SexType: String {
    case male
    case female
}

class UserModel {
    
    let name: String
    let surname: String
    let city: String
    let sex: SexType
    
    init(name: String, surname: String, city: String, sex: SexType) {
        self.name = name
        self.surname = surname
        self.city = city
        self.sex = sex
    }
}

class ViewController: UIViewController {
    
    let cities = ["Mountain View", "Sunnyvale", "Cupertino", "Santa Clara", "San Jose"]
    let sexArray = ["Мужской", "женский"]
    var pickedCity: String?
    var pickedSex: SexType?

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
    }

    @IBAction func nameTextField(_ sender: Any) {
        print(name.text)
        
    }
    
    
    @IBAction func surnameTextField(_ sender: Any) {
        print(surname.text)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pickedSex = .male
        case 1:
            pickedSex = .female
        default:
            break
        }
        let nameTrimmingText = name.text!.trimmingCharacters(in: .whitespaces)
        let surnameTrimmingText = name.text!.trimmingCharacters(in: .whitespaces)
        print(nameTrimmingText)
        
        guard let pickedCity = pickedCity, let pickedSex = pickedSex else { return }
        let userObject = UserModel(name: nameTrimmingText, surname: surnameTrimmingText, city: pickedCity, sex: pickedSex)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let city = cities[row]
        return city
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedCity = cities[row]
        print(pickedCity)
    }
}

