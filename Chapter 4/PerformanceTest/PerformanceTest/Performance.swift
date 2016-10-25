//
//  Performance.swift
//  PerformanceTest
//
//  Created by Mike Rogers on 11/30/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//


class Performance
{
    func countPrimes()
    {
        for num in 1...15000 {
            var i = 2
            while i <= num {
                if num % i == 0 {
                    break
                }
                i++
            }
        }
    }
}