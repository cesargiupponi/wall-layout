//
//  ViewController.swift
//  WallLayoutApp
//
//  Created by Cesar Giupponi on 30/09/24.
//

import UIKit

class ViewController: UIViewController {


    // Mock items simulating different cell sizes
    let items: [CellSize] = [
        .twoByTwo, .oneByOne,
        .twoByOne, .oneByTwo,
        .threeByTwo,
    ]

    lazy var collectionView: UICollectionView = {
        let layout = WallLayout()
        layout.items = items
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let cellSize = items[indexPath.item]

        switch cellSize {
        case .twoByTwo:
            cell.backgroundColor = .red
        case .oneByTwo:
            cell.backgroundColor = .green
        case .twoByOne:
            cell.backgroundColor = .blue
        case .oneByOne:
            cell.backgroundColor = .yellow
        case .threeByTwo:
            cell.backgroundColor = .orange
        }

        cell.layer.cornerRadius = 8
        return cell
    }
}

