KBCApplication is a SwiftUI app and uses MVVM + Coordinator pattern.
Colors are retrieved from Theme.swift.
Unit tests are inside KBCApplicationTests.

The app uses 3 submodules: Core, UICore, Tasks.
Core module should ideally contain the core business logic of the company. For example some shared cache or sensitive data which can be passed to plugins when plugged.
Tasks module is implemented as a plugin. 
It uses onion architecture and has 3 layers: Domain, Infrastructure and Application. 
There are a few unit tests implemented there.
