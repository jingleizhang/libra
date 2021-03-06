module M {
    // Test a unit return value.
    f1(): () { }

    // Test a single type return value.
    f2(): u64 { 1 }
    // FIXME: Current lalrpop grammar does not allow parens with a single return type.
    // f3(): (u64) { 1 }
    f4(p: &u64): &u64 { p }

    // Test multiple return values.
    f5(): (u64, u64) { (1, 2) }
}
