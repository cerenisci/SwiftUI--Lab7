//
//  ViewController.swift
//  table_app_x
//
//  Created by Ceren Isci on 2025-02-15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

        
        @IBOutlet weak var calculateButton: UIButton!
        @IBOutlet weak var resultsTableView: UITableView!
        @IBOutlet weak var numberTextField: UITextField!
        var results: [String] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            resultsTableView.delegate = self
            resultsTableView.dataSource = self
            resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
        }
        
        @IBAction func calculateButtonTapped(_ sender: UIButton) {
            generateMultiplicationTable()
        }
        
        func setupUI() {
            calculateButton.layer.cornerRadius = 10
            calculateButton.backgroundColor = UIColor.systemBlue
            calculateButton.setTitleColor(.white, for: .normal)

            numberTextField.layer.cornerRadius = 8
            numberTextField.layer.borderWidth = 1
            numberTextField.layer.borderColor = UIColor.lightGray.cgColor
            numberTextField.keyboardType = .numberPad
        }
        
        func generateMultiplicationTable() {
            guard let text = numberTextField.text, !text.isEmpty, let number = Int(text) else {
                showAlert()
                return
            }
            
            results = (1...10).map { "\(number) × \($0) = \(number * $0)" }
            resultsTableView.reloadData()
        }
        
        func showAlert() {
            let alert = UIAlertController(title: "Error", message: "Please enter a valid number.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return results.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
            cell.textLabel?.text = results[indexPath.row]
            return cell
        }
    }



