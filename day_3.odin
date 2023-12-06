package aoc23

import "core:os"
import "core:fmt"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"
import "core:slice"


@(private="file")
example :: 
`467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
`

@(private="file")
example_2 :: 
`467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
`

@(private="file")
file :: #load("day_3_input.txt", string)


day3 :: proc() {
    lines := strings.split_lines(file)
    p1, p2: int

    // Part 1
    start := time.tick_now()
    for row, rpos in lines {
        is_part: bool
        num: int
        for c, cpos in row {
            if is_part && ('0' <= c && c <= '9'){
                continue
            }
            is_part = false

            if '0' <= c && c <= '9' {
                if num == 0 {
                    size: int
                    for char := row[cpos]; '0' <= char && char <= '9' && cpos+size < len(row); {
                        char = row[cpos+size]
                        size += 1
                    }
                    num, _ = strconv.parse_int(string(row[cpos:cpos+size]))
                }
                for i in -1..=1 {
                    if (i + cpos == -1) || (i + cpos == len(row)){
                        continue
                    }
                    char: u8
                    if rpos != 0 {
                        char = lines[rpos-1][cpos+i]
                        if (char < '0' || '9' < char) && char != '.' {
                            is_part = true
                            p1 += num
                            num = 0
                            break
                            
                        }
                    }
                    char = lines[rpos][cpos+i]
                    if (char < '0' || '9' < char) && char != '.' {
                        is_part = true
                        p1 += num
                        num = 0
                        break
                        
                    }
                    if rpos != len(row)-1 {
                        char = lines[rpos+1][cpos+i]
                        if (char < '0' || '9' < char) && char != '.' {
                            is_part = true
                            p1 += num
                            num = 0
                            break
                            
                        }
                    }
                }
            } else {
                num = 0
            }
        }
    }
    p1_time := time.tick_since(start)

    // Part 2
    start = time.tick_now()

    get_num :: proc(cpos: int, row: string) -> (num: int, ok: bool) {
        if cpos >= len(row) || cpos < 0 || row[cpos] < '0' || '9' < row[cpos] {
            return
        }

        size_min, size_max: int
        char := row[cpos]

        for {
            char = row[cpos-size_min]
            if char < '0' || '9' < char {
                break
            }
            size_min += 1
            if cpos-size_min < 0 {
                break
            }
        }
        size_min -= 1
        char = row[cpos]

        for {
            char = row[cpos+size_max]
            if char < '0' || '9' < char {
                break
            }
            size_max += 1
            if cpos+size_max >= len(row) {
                break
            }
        }
        //fmt.print(string(row[cpos-size_min:cpos+size_max]), size_min, size_max, "| ")
        return strconv.parse_int(string(row[cpos-size_min:cpos+size_max]))
    }

    Num_Pos :: enum {up, down, level}

    for row, rpos in lines {
        num: int
        is_num: bool
        for c, cpos in row {
            if c == '*' {
                sum := 1
                count := 0
                last: [Num_Pos]bool
                for i in -1..=1 {
                    if (i + cpos == -1) || (i + cpos == len(row)) {
                        continue
                    }
                    char := lines[rpos][cpos+i]
                    num, is_num = get_num(cpos+i, lines[rpos])
                    if is_num && !last[.level] {
                        //fmt.print(num, count, "")
                        count += 1
                        sum *= num
                    }
                    last[.level] = is_num

                    if rpos != 0 {
                        char = lines[rpos-1][cpos+i]
                        //fmt.print(string([]u8{char}), "")
                        num, is_num = get_num(cpos+i, lines[rpos-1])
                        if is_num && !last[.up] {
                            count += 1
                            sum *= num
                        }
                        last[.up] = is_num
    
                    }
                    if rpos != len(row)-1{
                        char = lines[rpos+1][cpos+i]
                        num, is_num = get_num(cpos+i, lines[rpos+1])
                        if is_num && !last[.down] {
                            //fmt.print(num, count, "")
                            count += 1
                            sum *= num
                        }
                        last[.down] = is_num    
                    }
                }
                if count == 2 {
                    //fmt.println(sum)
                    p2 += sum
                }
            } else {
                num = 0
            }
        }
    }

    p2_time := time.tick_since(start)

    fmt.println("Day 3:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}

day3_op :: proc() {
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

    fmt.println("Day 3:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}