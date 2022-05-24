//
//  HomeViewController.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let maxServicesEnabled: Int = 3
    private var services = [HomeService]()
    private var unfoldedSections = [Int]()
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(cells: [R.reuseIdentifier.serviceTableViewCell.identifier])
        
        return table
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHomeServicesRequest()
    }

}

private extension HomeViewController {
    func buildUI() {
        tableView.embed(in: self.view)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: - Requests
    func getHomeServicesRequest() {
        NetworkingService.homeServices { [weak self] services, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.services = services ?? []
                self.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        services.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = services[section].serviceTypes?.count ?? 0
        return unfoldedSections.contains(section) ? count : min(count, maxServicesEnabled)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let count = services[section].serviceTypes?.count ?? 0
        return unfoldedSections.contains(section) || count <= maxServicesEnabled ? 0 : 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let service = services[section]
        let header: ServiceHeaderView = ServiceHeaderView.fromNib()
        header.setup(title: service.name)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            !unfoldedSections.contains(section),
            (services[section].serviceTypes?.count ?? 0) > maxServicesEnabled
        else {
            return nil
        }

        let header: ServiceHeaderView = ServiceHeaderView.fromNib()
        header.setup(title: R.string.localizable.servicesShowMore(), textColor: .systemBlue) { [weak self] in
            self?.unfoldedSections.append(section)
            tableView.reloadData()
        }
        return header

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let service = services[indexPath.section].serviceTypes?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.serviceTableViewCell, for: indexPath)!
        cell.setup(service: service)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
