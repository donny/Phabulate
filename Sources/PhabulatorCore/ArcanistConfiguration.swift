import Foundation

public class ArcConfig {
    private let configFileName = ".arcrc"

    public struct ArcHostConfig: Codable {
        let token: String
    }

    public struct ArcUserConfig: Codable {
        let hosts: [String: ArcHostConfig]
    }


    public init() {

    }

    public func read() throws -> ArcUserConfig {
        let filePath = configFilePath()

        let data = try Data(contentsOf: filePath)
        let arc = try JSONDecoder().decode(ArcUserConfig.self, from: data)

        return arc
    }

    // MARK: - Private

    private func configFilePath() -> URL {
        var filePath: URL

        if #available(OSX 10.12, *) {
            let fileManager = FileManager.default
            let homeDirectory = fileManager.homeDirectoryForCurrentUser
            filePath = homeDirectory.appendingPathComponent(configFileName)
        } else {
            filePath = URL(fileURLWithPath: NSHomeDirectory() + "/" + configFileName)
        }

        return filePath
    }
}
