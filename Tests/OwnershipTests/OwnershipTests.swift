import XCTest
@testable import Ownership

final class OwnershipTests: XCTestCase {
    
    func testNonCopyingTypeInClass() {
        let file = File(descriptor: 1)
        let foo = Foo(fd: file)
        DispatchQueue.concurrentPerform(iterations: 10) { count in
            let file = File(descriptor: Int32(count))
            foo.fd = file
        }
    }
}

class Foo {
  var fd: File

  init(fd: consuming File) { self.fd = fd }
}
