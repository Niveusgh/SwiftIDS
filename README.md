# Swift Intrusion Detection System (SwiftIDS)

## Overview

SwiftIDS is a basic intrusion detection system implemented in Swift. It monitors network traffic and system logs to detect potential security threats and unauthorized access attempts.

## Features

- Real-time network traffic analysis
- System log monitoring
- Customizable rule-based detection
- Alert generation for suspicious activities
- Basic reporting functionality

## Requirements

- macOS 10.15+ or Linux with Swift support
- Swift 5.0 or later
- libpcap for packet capture (on macOS, this is included by default)

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/niveus/SwiftIDS.git
   ```

2. Navigate to the project directory:
   ```
   cd SwiftIDS
   ```

3. Build the project:
   ```
   swift build
   ```

## Usage

Run the program with sudo privileges to allow packet capture:

```
sudo .build/debug/SwiftIDS
```

### Configuration

Edit the `config.json` file to customize detection rules and alert thresholds:

```json
{
  "rules": [
    {
      "type": "port_scan",
      "threshold": 100
    },
    {
      "type": "failed_login",
      "threshold": 5
    }
  ],
  "log_file": "/var/log/system.log"
}
```

## Project Structure

- `Sources/SwiftIDS/`: Contains the main Swift source files
  - `main.swift`: Entry point of the application
  - `PacketAnalyzer.swift`: Handles network packet analysis
  - `LogMonitor.swift`: Monitors system logs
  - `AlertGenerator.swift`: Generates alerts for detected threats
- `Tests/`: Contains unit tests for the project
- `config.json`: Configuration file for detection rules and settings

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

This is a basic intrusion detection system intended for educational purposes. It should not be relied upon as a sole security measure in a production environment.
