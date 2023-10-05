struct File: ~Copyable {
    let descriptor: Int32
    
    init(descriptor: Int32) {
        self.descriptor = descriptor
    }
    
    func read() {
        print("Reading file \(descriptor)")
    }
    
    mutating func write(completion: () -> Void) {
        completion()
    }
    
    consuming func close() {
        print("Closing file \(descriptor)")
        discard self
    }
    
    deinit {
        print("Closing file \(descriptor)")
    }
}
