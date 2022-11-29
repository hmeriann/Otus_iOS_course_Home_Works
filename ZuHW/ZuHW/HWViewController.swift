//
//  HWViewController.swift
//  ZuHW
//
//  Created by Zuleykha Pavlichenkova on 29.11.2022.
//

import UIKit
import SnapKit

class HWViewController: UIViewController {
    override func viewDidLoad() {
        let label = UILabel()
        label.font = .systemFont(ofSize: 48, weight: .thin)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "It's just me"
    
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailingMargin.equalToSuperview().offset(-32.0)
            make.leading.equalToSuperview().offset(32.0)
        }
        view.backgroundColor = .orange
    }
    
}
