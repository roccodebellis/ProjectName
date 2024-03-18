import ProjectDescription

private let bundleId: String = "com.roccodebellis.projectName"
private let version: String = "0.0.1"
private let bundleVersion: String = "1"
private let iOSTargetVersion: String = "16.0"
private let projectName: String = "ProjectName"


let target = Target.target(name: "iOS",
                           destinations: .iOS,
                           product: .app,
                           bundleId: bundleId,
                           infoPlist: makeInfoPlist(),
                           sources: ["Sources/**/*.swift"],
                           resources:  ["Resources/**"],
                           settings: baseSettings()
                          )

let project = Project(name: projectName,
                      packages: [],
                      settings: Settings.settings(configurations: makeConfigurations()),
                      targets: [
                        target
                      ],
                      additionalFiles: [
                        "README.md"
                      ])

/// Create extended plist for iOS
/// - Returns: InfoPlist
private func makeInfoPlist(merging other:  [String: ProjectDescription.Plist.Value] = [:]) -> InfoPlist {
    var extendedPlist: [String: ProjectDescription.Plist.Value] = [
        "UIApplicationSceneManifest" : ["UIApplicationSupportsMultipleScenes": true],
        "UILaunchScreen": [],
        "UISupportedInterfaceOrientations":
            ["UIInterfaceOrientationPortrait",],
        "CFBundleShortVersionString": "\(version)",
        "CFBundleVersion": "\(bundleVersion)",
        "CFBundleDisplayName": "$(APP_DISPLAY_NAME)",
    ]
    
    other.forEach { (key: String, value: ProjectDescription.Plist.Value) in
        extendedPlist[key] = value
    }
    
    return InfoPlist.extendingDefault(with: extendedPlist)
}

/// Create dev and release configuration
///  - Returns: Configuration Tuple
private func makeConfigurations() -> [Configuration] {
    let debug: Configuration = Configuration.debug(name: "Debug", xcconfig: "Configs/Debug.xcconfig")
    let release: Configuration = Configuration.debug(name: "Release", xcconfig: "Configs/Release.xcconfig")
    
    return [debug, release]
}

private func baseSettings() -> Settings {
    var settings = SettingsDictionary()
    
    return Settings.settings(base: settings,
                             configurations: [],
                             defaultSettings: .recommended)
}
