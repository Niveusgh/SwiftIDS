import Foundation

enum AlertType {
    case suspiciousPacket
    case suspiciousLogEntry
    case other(String)
}

class AlertGenerator {
    private var alertCount: Int = 0
    
    func generateAlert(type: AlertType) {
        alertCount += 1
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        
        var alertMessage: String
        switch type {
        case .suspiciousPacket:
            alertMessage = "Suspicious network activity detected"
        case .suspiciousLogEntry:
            alertMessage = "Suspicious system log entry detected"
        case .other(let message):
            alertMessage = message
        }
        
        print("ALERT #\(alertCount) - \(timestamp): \(alertMessage)")
        
        // TODO: Implement more sophisticated alert handling
        // e.g., sending email, SMS, or integrating with a SIEM system
    }
    
    func getAlertCount() -> Int {
        return alertCount
    }
}
