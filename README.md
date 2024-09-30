# Wall Layout CollectionView

A sample iOS app demonstrating a custom `UICollectionViewFlowLayout` to create a dynamic, grid-like wall layout. This layout supports cells of varying sizes, making it ideal for apps with visually diverse content, such as photo galleries, Pinterest-style layouts, or dashboards with different widgets.

## Features

- **Dynamic Layout**: A wall-style layout with multiple cell sizes, including:
  - 2x2 cells
  - 1x2 cells
  - 2x1 cells
  - 1x1 cells
  - 3x2 cells
- **Custom `UICollectionViewFlowLayout`**: Cells are placed dynamically in a grid of 3 columns, with support for different aspect ratios.
- **Efficient Scrolling**: Uses a caching mechanism for layout attributes to ensure smooth scrolling, even with complex layouts.

## Table of Contents

- [Demo](#demo)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Demo

Here is a brief look at what the app looks like:

![demo](https://github.com/user-attachments/assets/87b6e15a-2f93-4dda-9a3b-3b9495fa1d5c)

The layout arranges cells in a "wall" pattern, perfect for apps where items need to have different visual weights.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/cesargiupponi/wall-layout.git
    ```

2. Open the project:

    ```bash
    cd wall-layout
    open WallLayout.xcodeproj
    ```

3. Run the app:

    - Select a simulator or connected device.
    - Build and run the project by pressing `Cmd + R`.

## Usage

This app is a template that can be integrated or extended for any iOS app that requires a custom collection view layout. Here’s a brief guide to understanding the code:

### ViewController

The `ViewController` manages the `UICollectionView` and its custom layout (`WallLayout`). The `mockData` array simulates different cell sizes using the `CellSize` enum. You can replace this mock data with real data from your app.

Key Methods:
- `collectionView(_:numberOfItemsInSection:)`: Returns the number of items to display.
- `collectionView(_:cellForItemAt:)`: Configures each cell with a specific size and background color.

### WallLayout

`WallLayout` is a subclass of `UICollectionViewFlowLayout` that arranges the cells in a grid-like layout with varying sizes.

- **`prepare()`**: Calculates the position and size of each cell before rendering.
- **`layoutAttributesForElements(in:)`**: Returns the layout attributes for the visible cells.
- **`collectionViewContentSize`**: Calculates the total height of the collection view content, ensuring all cells fit properly.

You can adjust the layout settings by modifying the constants, such as `numberOfColumns`, `cellPadding`, and others in the `prepare()` method.

### CellSize Enum

The `CellSize` enum defines various sizes that the cells can have:

- `.twoByTwo`: 2x2 grid cells
- `.oneByTwo`: 1x2 grid cells
- `.twoByOne`: 2x1 grid cells
- `.oneByOne`: 1x1 grid cells
- `.threeByTwo`: 3x2 grid cells

These sizes determine how much space each cell occupies in the collection view.

### Customization

You can easily customize this app to fit your needs. Here are a few ideas:
- **Different Grid Sizes**: Modify the number of columns (`numberOfColumns`) or adjust the padding between the cells (`cellPadding`).
- **Custom Cell Sizes**: Add or remove `CellSize` cases to support more diverse layouts.
- **Real Data Integration**: Replace the `mockData` array with data from your model or API.

## Customization

### Changing the Grid

To modify the grid layout (like number of columns or padding), edit the following in `CustomWallLayout.swift`:

```swift
let numberOfColumns = 3
let cellPadding: CGFloat = 6
```

### Adding New Cell Sizes

To add a new cell size, update the `CellSize` enum and provide `widthMultiplier` and `heightMultiplier` for the new size:

```swift
enum CellSize {
    case twoByTwo, oneByTwo, twoByOne, oneByOne, threeByTwo, newSize

    var widthMultiplier: Int {
        switch self {
        case .newSize: return 4 // Example: 4 columns wide
        // other cases
        }
    }

    var heightMultiplier: Int {
        switch self {
        case .newSize: return 3 // Example: 3 rows tall
        // other cases
        }
    }
}
```

## Contributing

Contributions are welcome! If you have suggestions for improvements or find any bugs, feel free to submit a pull request or open an issue.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add your feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

With this `README.md`, other developers will have a clear understanding of how to set up, use, and extend your app. Feel free to modify any sections based on your actual project setup.
