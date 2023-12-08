package aoc23

import "core:os"
import "core:fmt"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"
import "core:slice"
import "core:log"


@(private="file")
example :: `Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
`

@(private="file")
example_2 :string: `Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11`

@(private="file")
file :: #load("day_4_input.txt", string)


day4 :: proc() {
    lines := strings.split_lines(file)
    p1, p2: int

    // Part 1
    start := time.tick_now()
    for card in lines {
        if card == "" {
            continue
        }
        numbers, _ := strings.split(card, ":")
        numbers, _ = strings.split(numbers[1], "|")
        winning, _ := strings.split(numbers[0], " ")
        count: int

        for y in strings.split_iterator(&numbers[1], " ") {
            if y == "" {
                continue
            } else if slice.contains(winning, y) {
                if count == 0 {
                    count += 1
                } else {
                    count += count
                } 
                //fmt.print(y, "")
            }
        }
        //fmt.println("|", count)
        p1 += count
    }
    p1_time := time.tick_since(start)
    
    // Part 2
    start = time.tick_now()
    // build a array of each game that says if it wins, what cards you get & 1 total cards
    // then go in reverce order finding the full amount of cards. uses the total cards where able
    Card :: struct{id: int, copied: [dynamic]int, total: int}
    cards := make([dynamic]Card)
    defer delete(cards)
    defer {
        for card in cards {
            delete(card.copied)
        }
    }

    for card in lines {
        if card == "" {
            continue
        }
        numbers, _ := strings.split(card, ":")
        game, _ := strings.split(numbers[0][5:], " ")
        numbers, _ = strings.split(numbers[1], "|")
        winning, _ := strings.split(numbers[0], " ")
        card_num, ok := strconv.parse_int(game[len(game)-1])
        count := 0
        copied := make([dynamic]int)

        for y in strings.split_iterator(&numbers[1], " ") {
            if y == "" {
                continue
            } else if slice.contains(winning, y) {
                count += 1
                append(&copied, card_num+count)
            }
        }
        append(&cards, Card{card_num, copied, count})

    }
    p2 += len(cards)

    for n := len(cards)-1; 0 <= n; n -= 1 {
        card := &cards[n]
        for c in card.copied {
            card.total += cards[c-1].total
        }
        p2 += card.total
    }
    p2_time := time.tick_since(start)

    fmt.println("Day 4:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)

}


day4_op :: proc() {
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

    fmt.println("Day 4:")
    fmt.println("   Part 1:", p1)
    fmt.println("       Time:", p1_time)
    fmt.println("   Part 2:", p2)
    fmt.println("       Time:", p2_time)
}