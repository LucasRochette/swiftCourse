//
//  WeatherViewController.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var datasets: [WeatherDay] = [] {
        didSet {
            self.tableView.reloadData() // recharge la tableview
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditTableView))
        // Si bundle == nil alors c'est votre projet :) eq. Bundle.main
        let cellNib = UINib(nibName: "WeatherDayTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "WEATHERDAY_CELL_ID")
        self.tableView.delegate = self
        self.tableView.dataSource = self
       /* self.datasetIndicatorView.startAnimating()
            self.datasetService.fetchDatasets { datasets in
            self.datasetIndicatorView.stopAnimating()
            self.datasets = datasets
        }*/
    }
    
    @objc func handleEditTableView() {
        UIView.animate(withDuration: 0.66) {
            self.tableView.isEditing = !self.tableView.isEditing
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataset = self.datasets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WEATHERDAY_CELL_ID", for: indexPath) as! WeatherDayTableViewCell
        cell.setDataset(dataset)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Sup", message: "C'est votre dernier mot ?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Oui JP", style: .destructive, handler: { _ in
            self.datasets.remove(at: indexPath.row)
        }))
        alertController.addAction(UIAlertAction(title: "Non", style: .cancel))
        self.present(alertController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let src = self.datasets.remove(at: sourceIndexPath.row)
        self.datasets.insert(src, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataset = self.datasets[indexPath.row]
        print(dataset.description)
    }
    

    @IBAction func handleSearch(_ sender: Any) {
        
        guard let location = self.locationTextField.text
                    else {
                    return
               }
               guard location.count > 0
                else {
                   return
                }
        
        let session = URLSession.shared
        
        let WEATHER_API_KEY
        = ProcessInfo.processInfo.environment["WEATHER_API_KEY"]
        
        let WEATHER_API_URL
        = ProcessInfo.processInfo.environment["WEATHER_API_URL"]
        
        let endpoint = WEATHER_API_URL! + location + "?key=" + WEATHER_API_KEY!
        
        let url = URL(string: endpoint)!

        let weatherTask = session.dataTask(with: url) {
        (data, response, error) in
            guard let data = data else { return }

            /// Process the weather data
            struct WeatherData: Decodable {
                 let resolvedAddress: String
                 let days: [WeatherDays]
             }

            struct WeatherDays: Decodable {
                 let datetime: String
                 let tempmax: Double
                 let tempmin: Double
                 let description: String
             }
         
            let weather: WeatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
    
            //let weatherDays =
            print("Weather forecast for: "+weather.resolvedAddress)
            for weatherDay in weather.days {
                 print("Forecast for date: ", weatherDay.datetime)
                 print(" General conditions: ", weatherDay.description)
                 print(" The high temperature will be  ", weatherDay.tempmax)
                 print(" The low temperature will be  ", weatherDay.tempmin)
                self.datasets.append(WeatherDay(date: weatherDay.datetime, tempMin: weatherDay.tempmin, tempMax: weatherDay.tempmax, description: weatherDay.description))
            }
            
        }
        self.tableView.reloadData()
          weatherTask.resume()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
