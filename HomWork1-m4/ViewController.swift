//
//  ViewController.swift
//  HomWork1-m4
//
//  Created by Sultanbai Almaz on 16/8/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.dataSource = self
        view.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup() //вызов ф
    }
    
    private func setup() {
        view.backgroundColor = .white
        setupSubview()
        setupConstraints()
        fetchData()
        
    }
    
    private func setupSubview() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func fetchData() {
        NetworkService.shared.fetchData { [weak self] result in
            guard let safeSelf = self else { return }
            switch result {
            case .success(let data):
                safeSelf.products = data
                DispatchQueue.main.async {
                    safeSelf.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return products.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? ProductTableViewCell else { return UITableViewCell() }
        let model = products[indexPath.row]
        cell.setupData(model: model)
        return cell
    }
}
