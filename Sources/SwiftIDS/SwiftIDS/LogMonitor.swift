import Foundation

class LogMonitor {
    private let logFile: String
    private var lastPosition: Int64 = 0
    
    init(logFile: String = "/var/log/system.log") {
        self.logFile = logFile
    }
    
    func getLatestLogEntry() -> String? {
        guard let fileHandle = FileHandle(forReadingAtPath: logFile) else {
            print("Error: Unable to open log file")
            return nil
        }
        
        defer {
            fileHandle.closeFile()
        }
        
        fileHandle.seek(toFileOffset: UInt64(lastPosition))
        
        guard let data = fileHandle.readToEndOfFile(), !data.isEmpty else {
            return nil
        }
        
        lastPosition = fileHandle.offsetInFile
        
        return String(data: data, encoding: .utf8)
    }
    
    func analyzeLogEntry(_ logEntry: String) -> Bool {
        // TODO: Implement more sophisticated log analysis
        // This is a basic example that flags entries containing certain keywords
        
        let suspiciousKeywords = ["failed", "error", "warning", "unauthorized", "permission denied"]
        
        for keyword in suspiciousKeywords {
            if logEntry.lowercased().contains(keyword) {
                print("Suspicious log entry detected: \(logEntry)")
                return true
            }
        }
        
        return false
    }
}
