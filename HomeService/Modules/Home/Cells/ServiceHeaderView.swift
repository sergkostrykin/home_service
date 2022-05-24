//
//  ServiceHeaderView.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit

class ServiceHeaderView: UIView {
    
    // MARK: - Properties
    private var onSelect: (()->())?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Actions
    @objc func contentViewClicked(_ sender: UITapGestureRecognizer) {
        onSelect?()
    }
    
    // MARK: - Merhods
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.contentViewClicked))
        self.addGestureRecognizer(tapGestureRecognizer)

    }

    func setup(title: String?, textColor: UIColor = .gray, onSelect: (()->())? = nil) {
        self.onSelect = onSelect
        titleLabel.text = title
        titleLabel.textColor = textColor
    }
}
