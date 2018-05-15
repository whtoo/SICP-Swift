import Foundation


public class MemFunc<T:Hashable,U> {
    public typealias EvalFunc = (T) -> U
    public typealias RecursiveFunc = (EvalFunc,T) -> U
    var evalTable : [T:U]
    var recursiveFunc : RecursiveFunc
    
    public init(initialEvalTable:[T:U],recursiveFunction: @escaping RecursiveFunc) {
        evalTable = initialEvalTable
        recursiveFunc = recursiveFunction
    }
    
    public func eval(_ param: T) -> U {
        if let val = evalTable[param] {
            print("lookup \(param)")
            return val
        } else {
            print("eval \(param)")
            let evalValue = recursiveFunc(eval,param)
            evalTable[param] = evalValue
            return evalValue
        }
    }
}
