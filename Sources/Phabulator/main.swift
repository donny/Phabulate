import PhabulatorCore

let tool = Phabulator()

do {
	try tool.run()
} catch {
	print("Error \(error)")
}