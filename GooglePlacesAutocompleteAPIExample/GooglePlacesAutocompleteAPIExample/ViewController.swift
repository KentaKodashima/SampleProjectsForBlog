//
//  ViewController.swift
//  GooglePlacesAutocompleteAPIExample
//
//  Created by Kenta Kodashima on 2019-01-18.
//  Copyright © 2019 Kenta Kodashima. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  // Present the Autocomplete view controller when the textField is tapped.
  @IBAction func textFieldTapped(_ sender: Any) {
    textField.resignFirstResponder()
    let acController = GMSAutocompleteViewController()
    acController.delegate = self
    present(acController, animated: true, completion: nil)
  }

}

extension ViewController: GMSAutocompleteViewControllerDelegate {
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    // Get the place name from 'GMSAutocompleteViewController'
    // Then display the name in textField
    textField.text = place.name
    // Dismiss the GMSAutocompleteViewController when something is selected
    dismiss(animated: true, completion: nil)
  }
  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // Handle the error
    print("Error: ", error.localizedDescription)
  }
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    // Dismiss when the user canceled the action
    dismiss(animated: true, completion: nil)
  }
}
