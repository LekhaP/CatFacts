//
//  ViewController.swift
//  CatFacts
//
//  Created by Preeti Lekha on 10/29/19.
//  Copyright © 2019 Preeti Lekha. All rights reserved.
//

import UIKit

class CatFactsMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var catFactsTableView: UITableView!
    var catsNames: [String] = ["Tigger", "Tiger", "Max", "Smokey", "Sam", "Kitty", "Sassy", "Shadow"]
    var catsFacts: [CatFact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCatFacts()
    }

    private func fetchCatFacts() {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: "https://catfacts-api-2.herokuapp.com/catfacts")!

        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            // Parse the data in the response and use it

            if error == nil {
                print(response!)
            }

            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }

            self.parseData(responseData: dataResponse)
            self.catFactsTableView.reloadData()
        })
        task.resume()
    }


    func parseData(responseData: Data) {
        do{
            let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: [])
            guard let jsonArray = jsonResponse as? [[String: Any]] else {
                return
            }

            for element in jsonArray {
                self.catsFacts.append(CatFact(element))
            }

        } catch let parsingError {
            print("Error", parsingError)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return catsNames.count
        return catsFacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factCell : CatFactsCell = tableView.dequeueReusableCell(withIdentifier: "factCell") as! CatFactsCell
        //factCell.setFacts(fact: catsNames[indexPath.row])
        factCell.setFacts(fact: catsFacts[indexPath.row].fact)
        return factCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 100;
        return UITableView.automaticDimension;
    }
}

