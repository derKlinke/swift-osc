# swift-osc

SwiftOSC is a Swift Open Sound Control (OSC) 1.1 client and server framework.


## Quick Start
### OSC Server
#### Step 1
Import SwiftOSC framework into your project
```swift
import SwiftOSC
```
#### Step 2
Create Server
```swift
var server = OSCServer(address: "", port: 8080)
```
#### Step 3
Start server
```
server.start()
```

#### Step 4
Setup server delegate to handle incoming OSC Data
```swift
class OSCHandler: OSCServerDelegate {
    
    func didReceive(_ message: OSCMessage){
        if let integer = message.arguments[0] as? Int {
            print("Received int \(integer)")
        } else {
            print(message)
        }
    }
}
server.delegate =  OSCHandler()
```
### OSC Client
#### Step 1
Import SwiftOSC framework into your project
```swift
import SwiftOSC
```
#### Step 2
Create client
```swift
var client = OSCClient(address: "localhost", port: 8080)
```
#### Step 3
Create a message
```swift
var message = OSCMessage(
    OSCAddressPattern("/"), 
    100, 
    5.0, 
    "Hello World", 
    Blob(), 
    true, 
    false, 
    nil, 
    impulse, 
    Timetag(1)
)
```
Create a bundle
```swift
var bundle = OSCBundle(Timetag(secondsSinceNow: 5.0), message)
```

#### Step 4
Send message
```swift
client.send(message)
```
Send bundle
```swift
// If the server fully supports timetags, like SwiftOSC, the bundle will be delivered at the correct time.
client.send(bundle)
```
