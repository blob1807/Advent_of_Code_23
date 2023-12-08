package old
que := make([dynamic]int)
for n in 0..<len(cards) {
    append(&que, n)
}
p2 += len(cards)
max_len := len(que)

for len(que) != 0 {
    card_pos := que[0]
    card := cards[card_pos]

    if card == "" {
        if res, ok := pop_front_safe(&que); !ok {
            fmt.eprintln(res)
            break
        }
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
            count += 1
        }
    }
    p2 += count
    if res, ok := pop_front_safe(&que); !ok {
        fmt.eprintln(res)
        break
    }
    for n in card_pos+1..<card_pos+1+count {
        append(&que, n)
    }
    if max_len < len(que) {
        max_len = len(que)
    }
    log.info(p2, len(que))
}
fmt.println(max_len)