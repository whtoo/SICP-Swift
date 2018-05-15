//: Playground - noun: a place where people can play

import Cocoa

let memFib = MemFunc<Int,Int>.init(
    initialEvalTable:[1:1,2:1],
    recursiveFunction: {
        (f,x) in
        f(x-1) + f(x-2)
    }
)

memFib.eval(10)

