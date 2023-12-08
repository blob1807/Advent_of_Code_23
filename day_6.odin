package aoc23

import "core:os"
import "core:fmt"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"


@(private="file")
example :: `Time:      7  15   30
Distance:  9  40  200
`

@(private="file")
example_2 :: ``

@(private="file")
file :: #load("day_6_input.txt", string)


day6 :: proc() {
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

    fmt.println("Day 6:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}


day6_op :: proc() {
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

    fmt.println("Day 6:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}