package aoc23

import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"
import uni "core:unicode"
import "core:unicode/utf8"
import "core:time"


@(private="file")
example :: "1abc2\n" +
"pqr3stu8vwx\n" +
"a1b2c3d4e5f\n" +
"treb7uchet"

@(private="file")
example_2 :: "two1nine\n" +
"eightwothree\n" +
"abcone2threexyz\n" +
"xtwone3four\n" +
"4nineeightseven2\n" +
"zoneight234\n" +
"7pqrstsixteen"



day1 :: proc() {
    file, _ := os.read_entire_file("day_1_input.txt")
    lines, _ := strings.split_lines(string(file))
    p1, p2, l_pos: int
    start := time.tick_now()
    for line in lines {
        num: string
        for c in line {
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }
            
        }
        #reverse for c in line{
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }
        }
        p1 += strconv.atoi(num)
    }
    p1_time := time.tick_lap_time(&start)

    for l_pos < len(lines) {
        line := utf8.string_to_runes(lines[l_pos])
        line_len := len(line)
        c_pos: int
        num: string
        c_l: for c_pos < line_len {
            c := line[c_pos]
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }

            if c_pos+5 < line_len {
                switch utf8.runes_to_string(line[c_pos:c_pos+5]) {
                    case "three":
                        num = fmt.aprint(num, "3", sep="")
                        break c_l
                    case "seven":
                        num = fmt.aprint(num, "7", sep="")
                        break c_l
                    case "eight":
                        num = fmt.aprint(num, "8", sep="")
                        break c_l
                }
            }
            if c_pos+4 < line_len {
                switch utf8.runes_to_string(line[c_pos:c_pos+4]) {
                    case "four":
                        num = fmt.aprint(num, "4", sep="")
                        break c_l
                    case "five":
                        num = fmt.aprint(num, "5", sep="")
                        break c_l
                    case "nine":
                        num = fmt.aprint(num, "9", sep="")
                        break c_l
                }
            }
            if c_pos+3 < line_len {
                switch utf8.runes_to_string(line[c_pos:c_pos+3]) {
                    case "one":
                        num = fmt.aprint(num, "1", sep="")
                        break c_l
                    case "two":
                        num = fmt.aprint(num, "2", sep="")
                        break c_l
                    case "six":
                        num = fmt.aprint(num, "6", sep="")
                        break c_l
                }
            }
            c_pos += 1
        }

        c_pos = line_len-1
        c_l_r: for c_pos >= 0 {
            c := line[c_pos]
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }

            if c_pos-4 >= 0 {
                switch utf8.runes_to_string(line[c_pos-4:c_pos+1]) {
                    case "three":
                        num = fmt.aprint(num, "3", sep="")
                        break c_l_r
                    case "seven":
                        num = fmt.aprint(num, "7", sep="")
                        break c_l_r
                    case "eight":
                        num = fmt.aprint(num, "8", sep="")
                        break c_l_r
                }
            }
            if c_pos-3 >= 0 {
                switch utf8.runes_to_string(line[c_pos-3:c_pos+1]) {
                    case "four":
                        num = fmt.aprint(num, "4", sep="")
                        break c_l_r
                    case "five":
                        num = fmt.aprint(num, "5", sep="")
                        break c_l_r
                    case "nine":
                        num = fmt.aprint(num, "9", sep="")
                        break c_l_r
                }
            }
            if c_pos-2 >= 0 {
                switch utf8.runes_to_string(line[c_pos-2:c_pos+1]) {
                    case "one":
                        num = fmt.aprint(num, "1", sep="")
                        break c_l_r
                    case "two":
                        num = fmt.aprint(num, "2", sep="")
                        break c_l_r
                    case "six":
                        num = fmt.aprint(num, "6", sep="")
                        break c_l_r
                }
            }
            c_pos -= 1
        }
        p2 += strconv.atoi(num)
        l_pos += 1
    }

    p2_time := time.tick_lap_time(&start)

    fmt.println("Day 1:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)

}

day1_op :: proc() {
    file, _ := os.read_entire_file("day_1_input.txt")
    lines, _ := strings.split_lines(string(file))
    p1, p2: int

    start := time.tick_now()
    for line in lines {
        line_len := len(line)
        last: int
        for pos: int; pos < line_len; pos+=1 {
            c := line[pos]
            switch c {
            case '1':
                if last == 0 do p1 += 10
                last = 1
            case '2':
                if last == 0 do p1 += 20
                last = 2
            case '3':
                if last == 0 do p1 += 30
                last = 3
            case '4':
                if last == 0 do p1 += 40
                last = 4
            case '5':
                if last == 0 do p1 += 50
                last = 5
            case '6':
                if last == 0 do p1 += 60
                last = 6
            case '7':
                if last == 0 do p1 += 70
                last = 7
            case '8':
                if last == 0 do p1 += 80
                last = 8
            case '9':
                if last == 0 do p1 += 90
                last = 9
            }
        }
        p1 += last
    }
    p1_time := time.tick_since(start)

    start = time.tick_now()
    for line in lines {
        line_len := len(line)
        l1: for pos: int; pos < line_len; pos+=1 {
            c := line[pos]
            switch c {
                case '1':
                    p2 += 10
                    break l1
                case '2':
                    p2 += 20
                    break l1
                case '3':
                    p2 += 30
                    break l1
                case '4':
                    p2 += 40
                    break l1
                case '5':
                    p2 += 50
                    break l1
                case '6':
                    p2 += 60
                    break l1
                case '7':
                    p2 += 70
                    break l1
                case '8':
                    p2 += 80
                    break l1
                case '9':
                    p2 += 90
                    break l1
                case 'o':
                    if pos+3 < line_len && line[pos:pos+3] == "one" {
                        p2 += 10
                        break l1
                    }
                case 't':
                    if pos+3 < line_len && line[pos:pos+3] == "two" {
                        p2 += 20
                        break l1
                    }else if pos+5 < line_len && line[pos:pos+5] == "three" {
                        p2 += 30
                        break l1
                    }
                case 'f':
                    if pos+4 < line_len && line[pos:pos+4] =="four" {
                        p2 += 40
                        break l1
                    } else if pos+4 < line_len && line[pos:pos+4] == "five" {
                        p2 += 50
                        break l1
                    }
                case 's':
                    if pos+3 < line_len && line[pos:pos+3] == "six" {
                        p2 += 60
                        break l1
                    }else if pos+5 < line_len && line[pos:pos+5] == "seven" {
                        p2 += 70
                        break l1
                    }
                case 'e':
                    if pos+5 < line_len && line[pos:pos+5] == "eight" {
                        p2 += 80
                        break l1
                    } 
                case 'n':
                    if pos+4 < line_len && line[pos:pos+4] == "nine" {
                        p2 += 90
                        break l1
                    } 
            }
        }

        l2: for pos := line_len - 1; pos >= 0; pos -= 1 {
            c := line[pos]
            switch c {
                case '1':
                    p2 += 1
                    break l2
                case '2':
                    p2 += 2
                    break l2
                case '3':
                    p2 += 3
                    break l2
                case '4':
                    p2 += 4
                    break l2
                case '5':
                    p2 += 5
                    break l2
                case '6':
                    p2 += 6
                    break l2
                case '7':
                    p2 += 7
                    break l2
                case '8':
                    p2 += 8
                    break l2
                case '9':
                    p2 += 9
                    break l2
                case 'e':
                    if pos-2 > -1 && line[pos-2:pos+1] == "one" {
                        p2 += 1
                        break l2
                    } else if pos-3 > -1 && line[pos-3:pos+1] == "five" {
                        p2 += 5
                        break l2
                    } else if pos-3 > -1 && line[pos-3:pos+1] == "nine" {
                        p2 += 9
                        break l2
                    } else if pos-4 > -1 && line[pos-4:pos+1] == "three" {
                        p2 += 3
                        break l2
                    }
                case 'o':
                    if pos-2 > -1 && line[pos-2:pos+1] == "two" {
                        p2 += 2
                        break l2
                    }
                    
                case 'r':
                    if pos-3 > -1 && line[pos-3:pos+1] =="four" {
                        p2 += 4
                        break l2
                    }
                case 'x':
                    if pos-2 > -1 && line[pos-2:pos+1] == "six" {
                        p2 += 6
                        break l2
                    }
                case 'n':
                    if pos-4 > -1 && line[pos-4:pos+1] == "seven" {
                        p2 += 7
                        break l2
                    }
                case 't':
                    if pos-4 > -1 && line[pos-4:pos+1] == "eight" {
                        p2 += 8
                        break l2
                    }
            }
        }
    }
    p2_time := time.tick_since(start)
    fmt.println("Day 1:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)

}