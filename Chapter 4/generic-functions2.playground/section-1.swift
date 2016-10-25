func areEqual<T : Equatable> (a : T, b : T) -> Bool
{
    return a == b
}


areEqual(22, 99)
areEqual("Apple", "Apple")