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

# Why `withAnimation` Is Inside the ViewModel

The project intentionally places:

```swift
withAnimation(.easeInOut(duration: 0.5))
```

inside the `DroneVisionViewModel` instead of directly in the SwiftUI view.

Example:

```swift
func simulateDetection() {
    withAnimation(.easeInOut(duration: 0.5)) {

        confidence = Double.random(in: 0.3...1.0)

        if confidence > 0.75 {
            lockState = .locked
        } else if confidence > 0.45 {
            lockState = .detected
        } else {
            lockState = .searching
        }
    }
}
```

## Why?

For this lightweight educational prototype, the animation is considered part of the **state transition logic** itself.

The transition between:

- Searching
- Detected
- Locked

is tightly coupled to the simulated detection pipeline.

This keeps the demo:

- simple
- compact
- easy to read
- beginner friendly

while still showcasing modern SwiftUI animation behavior.

---

# MVVM Perspective

In stricter MVVM architectures, animations are often placed in the View layer because animation can be considered a presentation concern.

Example:

```swift
Button("Simulate") {
    withAnimation {
        vm.simulateDetection()
    }
}
```

However, with the modern Swift Observation framework (`@Observable`), SwiftUI allows a more state-driven approach where animations can naturally live alongside observable state changes.

---

# Educational Goal

This project intentionally favors:

- readability
- clarity
- reduced boilerplate
- easy experimentation

over strict enterprise-level separation rules.

The objective is to demonstrate how a small amount of SwiftUI code can simulate:

- confidence transitions
- HUD-style feedback
- visual acquisition states
- animated state-driven rendering

---

# Disclaimer

This project is for educational and visual simulation purposes only.

It does not:

- control drones
- perform real detection
- implement targeting logic
- provide operational guidance

The focus is purely on SwiftUI, UI design, and software architecture.
