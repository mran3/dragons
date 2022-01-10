//
//  ListLocationsViewController.swift
//  Dragon Ride
//
//  Created by Andrés A.
//  Copyright © 2021 Andrés A.. All rights reserved.
//

import UIKit

struct RouteSection {
    var route: String
    var flights: [Flight]
}

class ListFlightsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListFlightsView {
    
    private var tableView = UITableView()
    private var activityIndicator = UIActivityIndicatorView()
    private var valueToPass: String?
    private var lastLatitude: Double?
    private var lastLongitude: Double?
    private var flights:[Flight] = []
    private var presenter = ListFlightsPresenter()
    private let heightRow = 44
    private var sections: [RouteSection] = []
    
    override func viewDidLoad() {
        presenter.attachView(self)
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        requestInfo()
    }
    
    // This is a simple view so decided to set the constraints here.
    // For bigger projects, one can extract this information in other
    // function or even other files (for example using an extension).
    override func loadView() {
        super.loadView()
        self.title = "Dragon rides"
        if let bgImage = UIImage(named: "pattern") {
            view.backgroundColor = UIColor(patternImage: bgImage)
        }
        navigationController?.isNavigationBarHidden = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellProduct")
        tableView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.85)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        
        // Table view constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Activity indicator constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    deinit {
        presenter.detachView(self)
    }
    func requestInfo(){
        showIndicator()
        presenter.getFlights()
    }
    func hideIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func showIndicator(){
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.activityIndicator)
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "To " + self.sections[section].route
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellProduct", for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = .clear
        let section = self.sections[indexPath.section]
        let flight = section.flights[indexPath.row]
        let price = String(flight.price.price) + " " + flight.price.currency
        cell.textLabel?.text = flight.outbound.origin + " > " + flight.outbound.destination + " " + price
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightRow)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueToPass = self.flights[indexPath.row].outbound.destination
        let message = """
        If you hire me, you will get the chance to see some beautiful, handcrafted detail views I will create for Odigeo...
        We can even include dragons if you want! 🐉🐉🐉
        """
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(buttonAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func flightsLoaded(flights: [Flight]) {
        self.flights = flights
        let groups = Dictionary(grouping: flights) { (flight) -> String in
            return flight.outbound.destination
        }
        self.sections = groups.map (RouteSection.init(route: flights:))
        self.hideIndicator()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
