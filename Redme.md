# SwiftUIHokkaido

SwiftUIHokkaido is a modular SwiftUI-based application designed to demonstrate a reusable and dynamic framework for rendering various types of content using a provider-based architecture. This project showcases how to leverage SwiftUI's declarative UI capabilities to build scalable, maintainable, and extensible applications.

## Overview

The app dynamically renders a list of views (cells) based on a data model. Each cell is created by a specific provider, allowing for modular and reusable UI components. The architecture is designed to be flexible, enabling easy customization and extension.

## Key Features

- **Dynamic Content Rendering**: Cells are rendered dynamically based on a data model (`FrameworkUIState`).
- **Reusable Framework**: The `TheFramework` component handles the rendering of cells, making it easy to plug in new providers.
- **SwiftUI Declarative UI**: The app leverages SwiftUI's declarative syntax for clean and concise code.

---

## Project Structure

### 1. **`TheFramework`**
A reusable SwiftUI component that takes a `ViewModel` and a closure (`getCell`) to render a list of views. It uses a `LazyVStack` to efficiently render the cells.

### 2. **`ViewModel`**
An `ObservableObject` that holds the state of the app. It contains a list of types (`[Int]`) that determine which provider to use for each cell.

### 3. **`FrameworkUIState`**
A simple struct that represents the data model for the app. It contains an array of integers (`cells`) that map to provider types.

---

## How It Works

1. **Dynamic Content**:  
   The `ViewModel` is populated with mock data (`[1, 2, 3, 2, 2, 3]`), representing the types of cells to render.

2. **Rendering Cells**:  
   `TheFramework` iterates over the `types` array in the `ViewModel` and uses the provided closure (`getCell`) to generate the appropriate cell for each type.

---

## Running the App

1. Open the project in Xcode.
2. Build and run the app on a simulator or a physical device.
3. The app will display a scrollable list of cells, each rendered by the closure provided to `TheFramework`.

---

## Customization

### Adding New Cell Types
1. Define a new cell view that conforms to the expected structure.
2. Update the closure passed to `TheFramework` to handle the new cell type.
3. Update the `FrameworkUIState` mock data to include the new cell type.

---

## Testing

The project includes unit and UI tests:
- **Unit Tests**: Located in `SwiftUIHokkaidoTests/SwiftUIHokkaidoTests.swift`.
- **UI Tests**: Located in `SwiftUIHokkaidoUITests/SwiftUIHokkaidoUITests.swift` and `SwiftUIHokkaidoUITests/SwiftUIHokkaidoUITestsLaunchTests.swift`.

Run the tests using Xcode's test navigator to ensure the app behaves as expected.

---

## Future Improvements

- Add more cell types to support additional content.
- Integrate real data sources instead of mock data.
- Enhance the UI with animations and transitions.
- Improve accessibility for a wider audience.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.