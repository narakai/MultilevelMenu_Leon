//
//  CustomHeaderView.swift
//  MultilevelMenu_Leon
//
//  Created by lai leon on 2017/12/20.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()

    let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .left
        return title
    }()

    let detail: UILabel = {
        let detail = UILabel()
        return detail
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(imageView)
        addSubview(title)
        addSubview(detail)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
        title.frame = CGRect(x: frame.height, y: 0, width: frame.width - 2 * frame.height, height: frame.height)
        detail.frame = CGRect(x: frame.width - frame.height, y: 0, width: frame.height, height: frame.height)
    }

    func buildUI(province: Province) {
        imageView.image = UIImage(named: province.isOpen ? "向下" : "向右")
        title.text = province.name
        detail.text = String(province.citys.count) + "个市"
    }
}
