# Incremental Compile Demo

[![Swift Version](https://img.shields.io/badge/Swift-3.0-orange.svg)]()

iOS sample application used to test incremental compilation issues with Swift


# Environment

- Xcode 8.1 
- Swift 3.0

# Instructions 

- Do a clean build of the `CompileDemo` target
- Make a change to a private method e.g. comment / uncomment a statement in a private function of `ViewController.swift`
- Do a build of the `CompileDemo` target

# Expected result
- Only source code files affected by the change i.e. the ViewController.swift are recompiled 

# Actual result 
- All files recompile (but faster)

# Links 

Forums: [https://forums.developer.apple.com/message/194088#194088](https://forums.developer.apple.com/message/194088#194088)
Radars: 28501724, 28292226
