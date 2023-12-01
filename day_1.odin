package aoc23

import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"
import uni "core:unicode"
import "core:unicode/utf8"


@(private="file")
example :: "1abc2\n" +
"pqr3stu8vwx\n" +
"a1b2c3d4e5f\n" +
"treb7uchet"

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
    part_1, part_2: int
    nums := make([dynamic]string)

    for line in lines {
        num: string
        for c in line {
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }
            
        }
        for c in strings.reverse(line){
            if uni.is_digit(c) {
                num = fmt.aprint(num, c, sep="")
                break
            }
        }
        part_1 += strconv.atoi(num)
    }

    l_pos: int
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
        part_2 += strconv.atoi(num)
        l_pos += 1
    }

    fmt.println("Day1:")
    fmt.println("   Part 1:", part_1)
    fmt.println("   Part 2:", part_2)

}