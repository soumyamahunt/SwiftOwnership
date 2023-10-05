import Foundation

struct Lock: ~Copyable {
    struct Acquire: ~Copyable {
        private let lock: UnsafeMutablePointer<os_unfair_lock>
        
        fileprivate init(lock: UnsafeMutablePointer<os_unfair_lock>) {
            self.lock = lock
        }
        
        deinit {
            print("Releasing lock")
            os_unfair_lock_unlock(lock)
        }
    }
    
    private let _value: UnsafeMutablePointer<os_unfair_lock>

    private init(_ value: UnsafeMutablePointer<os_unfair_lock>) {
        self._value = value
    }
  
    init() {
        _value = .allocate(capacity: 1)
        _value.initialize(to: os_unfair_lock())
    }
  
    deinit {
        _value.deinitialize(count: 1)
    }
    
    func clone() -> Self {
        return .init(_value)
    }
  
    func lock() -> Acquire {
        print("Acquiring lock")
        os_unfair_lock_lock(_value)
        return .init(lock: _value)
    }
}
