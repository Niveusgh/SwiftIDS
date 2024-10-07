import XCTest
@testable import SwiftIDS

final class PacketAnalyzerTests: XCTestCase {
    var packetAnalyzer: PacketAnalyzer!
    
    override func setUp() {
        super.setUp()
        packetAnalyzer = PacketAnalyzer()
    }
    
    override func tearDown() {
        packetAnalyzer = nil
        super.tearDown()
    }
    
    func testLargePacketDetection() {
        // Create a mock packet larger than 1000 bytes
        let largePacket = Data(repeating: 0, count: 1500)
        
        // Test that the large packet is detected as suspicious
        XCTAssertTrue(packetAnalyzer.analyzePacket(largePacket), "Large packet should be detected as suspicious")
        
        // Create a mock packet smaller than 1000 bytes
        let smallPacket = Data(repeating: 0, count: 500)
        
        // Test that the small packet is not detected as suspicious
        XCTAssertFalse(packetAnalyzer.analyzePacket(smallPacket), "Small packet should not be detected as suspicious")
    }
    
    func testPacketCapture() {
        // This test requires network access and may not always succeed in all environments
        if let capturedPacket = packetAnalyzer.capturePacket() {
            XCTAssertFalse(capturedPacket.isEmpty, "Captured packet should not be empty")
        } else {
            XCTFail("Failed to capture a packet")
        }
    }
    
    // Add more tests as you implement more features in PacketAnalyzer
    
    static var allTests = [
        ("testLargePacketDetection", testLargePacketDetection),
        ("testPacketCapture", testPacketCapture),
    ]
}