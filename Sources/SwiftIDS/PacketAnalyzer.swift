import Foundation
import libpcap

class PacketAnalyzer {
    private var pcapHandle: OpaquePointer?
    private let device: String = "en0"  // Default to first Ethernet interface on macOS
    
    init() {
        setupPcap()
    }
    
    deinit {
        if let handle = pcapHandle {
            pcap_close(handle)
        }
    }
    
    private func setupPcap() {
        var errbuf = [Int8](repeating: 0, count: Int(PCAP_ERRBUF_SIZE))
        guard let handle = pcap_open_live(device, 65535, 1, 1000, &errbuf) else {
            print("Error opening device \(device): \(String(cString: errbuf))")
            return
        }
        pcapHandle = handle
    }
    
    func capturePacket() -> Data? {
        guard let handle = pcapHandle else {
            print("PCAP not initialized")
            return nil
        }
        
        var header: UnsafeMutablePointer<pcap_pkthdr>?
        var packet: UnsafePointer<UInt8>?
        
        let result = pcap_next_ex(handle, &header, &packet)
        if result == 1, let packetData = packet, let headerData = header?.pointee {
            return Data(bytes: packetData, count: Int(headerData.len))
        }
        
        return nil
    }
    
    func analyzePacket(_ packet: Data) -> Bool {
        // TODO: Implement more sophisticated packet analysis
        // This is a basic example that flags any packet larger than 1000 bytes
        
        if packet.count > 1000 {
            print("Large packet detected: \(packet.count) bytes")
            return true
        }
        
        // Basic port scan detection (multiple packets to different ports)
        if detectPortScan(packet) {
            print("Possible port scan detected")
            return true
        }
        
        return false
    }
    
    private func detectPortScan(_ packet: Data) -> Bool {
        // TODO: Implement actual port scan detection logic
        // This is a placeholder and should be replaced with real logic
        return false
    }
}
