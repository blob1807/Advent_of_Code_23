package aoc23

import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"
import uni "core:unicode"
import "core:unicode/utf8"
import "core:time"


@(private="file")
example :: `Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green`

@(private="file")
example_2 :: `Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green`

@(private="file")
file :: #load("day_2_input.txt", string)


day2 :: proc() {
    lines := strings.split_lines(file)
    p1, p2: int
    colours :: enum{Red,Green,Blue}

    // Part 1
    start := time.tick_now()
    //max_die := [colours]int{.Red=12, .Green=13, .Blue=14}
    /*max_game: int
    {  
        temp, _ := strings.split(lines[len(lines)-1], ":")
        max_game = strconv.atoi(string(temp[0][5:]))
    }
    games := make([dynamic]bool, max_game)*/
    
    for line in lines {
        temp, _ := strings.split(line, ":")
        // game := strconv.atoi(string(temp[0][5:]))
        sets, _ := strings.split(temp[1], ";")
        die_count := [colours]int{}

        for s in sets {
            dice, _ := strings.split(s, ",")
            for die in dice {
                t, _ := strings.split(die, " ")
                n := strconv.atoi(t[1])
                switch t[2] {
                    case "blue":
                        if n > die_count[.Blue] {
                            die_count[.Blue] = n
                        }
                    case "green":
                        if n > die_count[.Green] {
                            die_count[.Green] = n
                        }
                    case "red":
                        if n > die_count[.Red] {
                            die_count[.Red] = n
                        }
                }
            }
        }
        //if die_count[.Blue] <= max_die[.Blue] && die_count[.Green] <= max_die[.Green] && die_count[.Red] <= max_die[.Red]{
        if die_count[.Blue] <= 14 && die_count[.Green] <= 13 && die_count[.Red] <= 12{
            //games[game-1] = true
            p1 += strconv.atoi(string(temp[0][5:])) //game
        }
    }
    p1_time := time.tick_since(start)

    // Part 2
    start = time.tick_now()
    for line in lines {
        temp, _ := strings.split(line, ":")
        sets, _ := strings.split(temp[1], ";")
        die_count := [colours]int{}

        for s in sets {
            dice, _ := strings.split(s, ",")
            for die in dice {
                t, _ := strings.split(die, " ")
                n := strconv.atoi(t[1])
                switch t[2] {
                    case "blue":
                        if n > die_count[.Blue] {
                            die_count[.Blue] = n
                        }
                    case "green":
                        if n > die_count[.Green] {
                            die_count[.Green] = n
                        }
                    case "red":
                        if n > die_count[.Red] {
                            die_count[.Red] = n
                        }
                }
            }
        }
        p2 += die_count[.Blue] * die_count[.Red] * die_count[.Green] 
    }
    p2_time := time.tick_since(start)

    fmt.println("Day 2:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)

}

day2_op :: proc() {
    lines := strings.split_lines(file)
    p1, p2: int
    colours :: enum{Red,Green,Blue}

    // Part 1
    start := time.tick_now()
    dice := make([dynamic]string)
    t := make([dynamic]string)
    for line in lines {
        temp, _ := strings.split(line, ":")
        die_count := [colours]int{}
        size: int
        for pos: int; pos < len(temp[1]); pos += 1 {
            switch temp[1][pos] {
                case ',', ';':
                    append(&dice, temp[1][pos-size:pos])
                    size = 0
                case:
                    size += 1
            }
        }
        append(&dice, temp[1][len(temp[1])-size:len(temp[1])])
        for die in dice {
            size: int
            for pos: int; pos < len(die); pos += 1 {
                switch die[pos] {
                    case ' ':
                        append(&t, die[pos-size:pos])
                        size = 0
                    case:
                        size += 1
                }
            }
            append(&t, die[len(die)-size:len(die)])
            n := strconv.atoi(t[1])
            switch t[2][0] {
                case 'b':
                    if n > die_count[.Blue] {
                        die_count[.Blue] = n
                    }
                case 'g':
                    if n > die_count[.Green] {
                        die_count[.Green] = n
                    }
                case 'r':
                    if n > die_count[.Red] {
                        die_count[.Red] = n
                    }
            }
            clear(&t)
        }
        if die_count[.Blue] <= 14 && die_count[.Green] <= 13 && die_count[.Red] <= 12{
            p1 += strconv.atoi(string(temp[0][5:]))
        }
        clear(&dice)
    }
    p1_time := time.tick_since(start)
    delete(dice)
    delete(t)

    start = time.tick_now()
    dice = make([dynamic]string)
    t = make([dynamic]string)
    for line in lines {
        temp, _ := strings.split(line, ":")
        die_count := [colours]int{}
        size: int
        for pos: int; pos < len(temp[1]); pos += 1 {
            switch temp[1][pos] {
                case ',', ';':
                    append(&dice, temp[1][pos-size:pos])
                    size = 0
                case:
                    size += 1
            }
        }
        append(&dice, temp[1][len(temp[1])-size:len(temp[1])])
        for die in dice {
            size: int
            for pos: int; pos < len(die); pos += 1 {
                switch die[pos] {
                    case ' ':
                        append(&t, die[pos-size:pos])
                        size = 0
                    case:
                        size += 1
                }
            }
            append(&t, die[len(die)-size:len(die)])
            n := strconv.atoi(t[1])
            switch t[2][0] {
                case 'b':
                    if n > die_count[.Blue] {
                        die_count[.Blue] = n
                    }
                case 'g':
                    if n > die_count[.Green] {
                        die_count[.Green] = n
                    }
                case 'r':
                    if n > die_count[.Red] {
                        die_count[.Red] = n
                    }
            }
            clear(&t)
        }
        p2 += die_count[.Blue] * die_count[.Red] * die_count[.Green] 
        clear(&dice)
    }
    p2_time := time.tick_since(start)

    fmt.println("Day 2:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}