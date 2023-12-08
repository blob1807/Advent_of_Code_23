package aoc23

import "core:os"
import "core:fmt"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"


@(private="file")
example :: `seed  soil
0     0
1     1
...   ...
48    48
49    49
50    52
51    53
...   ...
96    98
97    99
98    50
99    51
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