import Foundation

public final class Phabulator {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) { 
        self.arguments = arguments
    }

    public func run() throws {

        let arc = try ArcConfig().read()

        print(arc.hosts.first?.key)
        print(arc.hosts.first?.value.token)




    }
}
