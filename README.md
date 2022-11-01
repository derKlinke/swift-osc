# swift-osc

SwiftOSC is a Swift Open Sound Control (OSC) 1.1 client and server library which has been developed initially by [Existential Audio](https://github.com/ExistentialAudio/SwiftOSC) and then adapted to be used with Swift Package Manager, as well as some minor API changes.


## Quick Start
### OSC Server

Create Server and start it
```swift
var server = OSCServer(address: "", port: 8080)
```

### OSCServerDelegate
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

Create a client with an adress and port it will send the messages to.

```swift
var client = OSCClient(address: "localhost", port: 8080)
```

and create a message we want to send and send it.

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

client.send(message)
```
