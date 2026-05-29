# TargetDemo — Vision Lock Simulation

A lightweight SwiftUI prototype demonstrating a simplified vision-lock interface using modern Swift 6+ patterns.

This is **not a real targeting system**.  
It is a UI and architecture learning prototype.

---

# Overview

The demo simulates a simplified visual detection pipeline:

```swift
enum VisionPipeline {
    case cameraFeed
    case objectDetected
    case confidenceEvaluation
    case visualLock
    case uiOverlay
}
```

The interface transitions between:

- Searching
- Detected
- Locked

using a simple confidence-driven state model.

---

# Architecture

The project uses a lightweight **MVVM** architecture:

- **Model** → represents simple states such as lock status
- **ViewModel** → manages confidence and simulated detection logic
- **View** → displays the UI and reacts to state changes

The ViewModel uses Swift’s modern Observation framework:

```swift
@Observable
final class DroneVisionViewModel {
    var lockState: LockState = .searching
    var confidence: Double = 0.0
}
```

This keeps the code clean and avoids older Combine boilerplate.

---

# Reusable GlassCard Component

The project includes a reusable `GlassCard` component:

```swift
GlassCard {
    Text("Locked")
}
```

It uses:

```swift
.ultraThinMaterial
```

to create a modern glass-style interface inspired by visionOS-style design.

This makes the UI:

- reusable
- consistent
- easy to maintain
- visually modern

---

# GeometryReader and Path for Diamond Lock Overlay

This version uses `GeometryReader` and `Path` to draw a more precise custom HUD diamond:

```swift
GeometryReader { geo in
    Path { path in
        let w = geo.size.width
        let h = geo.size.height

        path.move(to: CGPoint(x: w / 2, y: 0))
        path.addLine(to: CGPoint(x: w, y: h / 2))
        path.addLine(to: CGPoint(x: w / 2, y: h))
        path.addLine(to: CGPoint(x: 0, y: h / 2))
        path.closeSubpath()
    }
    .stroke(.green, lineWidth: 4)
}
```

This allows scalable vector-based HUD graphics such as:

- diamonds
- reticles
- tracking boxes
- radar-style overlays

---

# Technologies Used

- Swift 6+
- SwiftUI
- MVVM architecture
- Observation framework with `@Observable`
- Reusable components
- `GlassCard`
- `GeometryReader`
- `Path`

---

# Educational Purpose

This project is intended to demonstrate how a small SwiftUI prototype can represent a larger software concept:

```swift
enum SoftwareConcept {
    case stateDrivenUI
    case simulatedDetection
    case visualFeedback
    case reusableComponents
    case cleanArchitecture
}
```

For non-coders, it shows how software can visually represent a detection state.

For developers, it demonstrates a clean SwiftUI architecture using reusable views and modern state management.

---

# Disclaimer

This project is for educational and visual simulation purposes only.

It does not:

- control drones
- perform real detection
- implement targeting logic
- provide operational guidance

The focus is purely on SwiftUI, UI design, and software architecture.
