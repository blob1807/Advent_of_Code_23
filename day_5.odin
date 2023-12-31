package aoc23

import "core:os"
import "core:fmt"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"


@(private="file")
example :: `seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
`

@(private="file")
example_2 :: ``

@(private="file")
file :: #load("day_5_input.txt", string)


day5 :: proc() {
    lines := strings.split_lines(example)
    p1, p2: int

    // Part 1
    start := time.tick_now()
    for line in lines {
        
    }
    p1_time := time.tick_since(start)

    // Part 2
    start = time.tick_now()
    for line in lines {
        
    }

    p2_time := time.tick_since(start)

    fmt.println("Day 5:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}


day5_op :: proc() {
    lines := strings.split_lines(example)
    p1, p2: int

    // Part 1
    start := time.tick_now()     
    for line in lines {
        
    }
    p1_time := time.tick_since(start)

    // Part 2
    start = time.tick_now()
    for line in lines {
        
    }

    p2_time := time.tick_since(start)

    fmt.println("Day 5:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}