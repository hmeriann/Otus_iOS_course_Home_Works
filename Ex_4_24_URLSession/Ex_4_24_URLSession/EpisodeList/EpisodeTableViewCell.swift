//
//  EpisodeTableViewCell.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

final class EpisodeTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    private func setUpUI() {
        nameLabel.textColor = .red
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -20)
        ])
    }
    
    // from storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    
    func configure(with episode: Episode) {
        nameLabel.text = episode.name
    }
}
