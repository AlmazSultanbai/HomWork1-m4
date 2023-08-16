//
//  ProductTableViewCell.swift
//  HomWork1-m4
//
//  Created by Sultanbai Almaz on 16/8/23.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    private lazy var image: UIImageView = {
        let view = UIImageView()
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        contentView.backgroundColor = .white
        setupSubview()
        setupConstraints()
    }
    
    private func setupSubview() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(image)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(image.snp.leading).offset(-10)
            $0.top.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(image.snp.leading).offset(-10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        image.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(60)
        }
    }
    
    func setupData(model: Product) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        image.image = UIImage(systemName: "person")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
