//
//  WallLayout.swift
//  WallLayoutApp
//
//  Created by Cesar Giupponi on 30/09/24.
//

import UIKit

class WallLayout: UICollectionViewFlowLayout {

    private var cache: [UICollectionViewLayoutAttributes] = []  // Cache to store layout attributes
    private var contentHeight: CGFloat = 0  // Total content height, dynamically calculated
    private var numberOfColumns = 3  // Number of columns in the layout
    private var cellPadding: CGFloat = 10  // Padding between cells    
    var items: [CellSize] = []

    // Returns the size of the collection view's content, based on the calculated height
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width, height: contentHeight)
    }

    // Prepare the layout and calculate positions for each item
    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else { return }

        // Calculate the width of each column based on the number of columns and padding
        let columnWidth = (collectionView.bounds.width - (CGFloat(numberOfColumns + 1) * cellPadding)) / CGFloat(numberOfColumns)

        // Track the X positions (horizontal offsets) for each column
        var xOffsets: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffsets.append(cellPadding + CGFloat(column) * (columnWidth + cellPadding))
        }

        var column = 0  // Track the current column
        // Track the next available Y position for each column
        var yOffsets: [CGFloat] = Array(repeating: cellPadding, count: numberOfColumns)


        // Loop through all items in the collection view
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)

            // Get the cell size from the items
            let cellSize = items[indexPath.item]
            let widthMultiplier = cellSize.widthMultiplier
            let heightMultiplier = cellSize.heightMultiplier



            let width = columnWidth * CGFloat(widthMultiplier) + (CGFloat(widthMultiplier - 1) * cellPadding)
            let height = columnWidth * CGFloat(heightMultiplier) + (CGFloat(heightMultiplier - 1) * cellPadding)

            // Ensure the item fits within columns
            if column + widthMultiplier > numberOfColumns {
                column = 0
            }

            // Create the frame for the cell
            let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: width, height: height)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes) // Add the attributes to the cache

            // Update yOffset for this column
            for col in column..<column + widthMultiplier {
                yOffsets[col] = yOffsets[column] + height + cellPadding
            }

            column = column + widthMultiplier >= numberOfColumns ? 0 : column + widthMultiplier
        }

        contentHeight = (yOffsets.max() ?? 0) + cellPadding
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return newBounds.size != collectionView?.bounds.size
    }
}
