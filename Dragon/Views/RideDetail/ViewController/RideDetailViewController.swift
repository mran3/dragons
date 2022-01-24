//
//  RideDetailViewController.swift
//  Dragon Riders
//
//  Created by Andres Acevedo on 9/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

enum DetailSections: String {
    case origin = "Origin"
    case destination = "Destination"
    case price = "Price"
}
class RideDetailViewController: UIViewController {
    private let vStackView = UIStackView()
    private let activityIndicator = UIActivityIndicatorView()
    private let label = UILabel()
    private let infoTable = UITableView()
    private let heightRow:CGFloat = 50.0
    private let titles: [DetailSections] = [.origin, .destination, .price]
    private var flight: Flight!
    
    
    init(flight: Flight) {
        self.flight = flight
        super.init(nibName: nil, bundle: nil)
        self.title = flight.outbound.origin + " > " + flight.outbound.destination
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()        
        if let bgImage = UIImage(named: "pattern") {
            view.backgroundColor = UIColor(patternImage: bgImage)
        }
        navigationController?.isNavigationBarHidden = false
        view.addSubview(infoTable)
        view.addSubview(activityIndicator)
        setUpConstraints()
    }
    override func viewDidLoad() {
        infoTable.register(TitleInfoTableCell.self, forCellReuseIdentifier: "TitleInfoTableCell")
        infoTable.delegate = self
        infoTable.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    func setUpConstraints(){
        // Table view constraints
        infoTable.translatesAutoresizingMaskIntoConstraints = false
        infoTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        infoTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true       

        
        // Activity indicator constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension RideDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleInfoTableCell", for: indexPath) as? TitleInfoTableCell else {
            print("Could not instantiate custom cell")
            return UITableViewCell()
        }
        cell.titleLabel.text = titles[indexPath.row].rawValue
        switch titles[indexPath.row] {
        case .origin:
            cell.infoLabel.text = self.flight.outbound.origin
        case .destination:
            cell.infoLabel.text = self.flight.outbound.destination
        case .price:
            cell.infoLabel.text = self.flight.price.price.description
        }
        return cell
    }
    
    
}
