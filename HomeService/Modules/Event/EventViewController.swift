//
//  EventViewController.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class EventViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getEventsRequest()
    }

}

private extension EventViewController {
    func buildUI() {
//        tableView.embed(in: self.view)
    }
    
    func reloadData() {
//        tableView.reloadData()
    }
    
    // MARK: - Requests
    func getEventsRequest() {
        NetworkingService.events { [weak self] services, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
//                self.services = services ?? []
                self.reloadData()
            }
        }
    }
}
