struct SharedFile: ~Copyable {
    private let descriptor: Int32
    private let count: UnsafeMutablePointer<UInt>
    
    init(descriptor: Int32) {
        self.descriptor = descriptor
        self.count = .allocate(capacity: 1)
        self.count.initialize(to: 1)
    }
    
    private init(descriptor: Int32, count: UnsafeMutablePointer<UInt>) {
        self.descriptor = descriptor
        self.count = count
    }
    
    func read() {
        print("Reading file \(descriptor)")
    }
    
    func clone() -> Self {
        count.pointee += 1
        return .init(descriptor: descriptor, count: count)
    }
    
    deinit {
        count.pointee -= 1
        guard count.pointee == 0 else { return }
        print("Closing file \(descriptor)")
    }
}
