//
//  ServiceTableViewCell.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit
import Kingfisher

class ServiceTableViewCell: UITableViewCell {

    private var thumbnail: String?
    
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        serviceImageView.layer.cornerRadius = 10
    }

    func setup(service: ServiceType?) {
        serviceTitleLabel.text = service?.name
        self.thumbnail = service?.imageThumbUrl?.sm
        serviceImageView.kf.setImage(with: service?.imageThumbUrl?.sm?.url, placeholder: UIImage.placeholder) { [weak self] result in
            switch result {
            case .success(let imageResult):
                guard let thumbnail = self?.thumbnail, thumbnail == imageResult.source.url?.absoluteString else { return }
                self?.serviceImageView.kf.setImage(with: service?.imageThumbUrl?.lg?.url)
            default:
                break
            }
        }
    }
}
