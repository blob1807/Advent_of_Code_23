package old
rows := len(lines)-1
columns := len(lines[0])

table := make([dynamic][dynamic]string)

for row in 0..<rows {
    append(&table, make([dynamic]string))
    for column in 0..<columns {
        char := lines[row][column]
        if '0' <= char && char <= '9' {
            if column != 0 && '0' <= lines[row][column-1] && lines[row][column-1] <= '9' {
                append(&table[row], table[row][column-1])
            } else {
                n := strings.builder_make()
                strings.builder_destroy(&n)
                for c, col := char, column; '0' <= c && c <= '9' && col < columns-1; {
                    strings.write_byte(&n, c)
                    col += 1
                    c = lines[row][col]
                }
                s, _ := strings.clone(strings.to_string(n))
                append(&table[row], s)
            }
        } else {
            s, _ := strings.clone(string([]u8{char}))
            append(&table[row], s)
        }
    }
}

nums := make([dynamic]int)
for row, rpos in table {
    last: string
    for cpos: int; cpos < len(row); cpos += 1{
        column := row[cpos]
        if last == column {
            continue
        }
        //fmt.print(column, "")
        num, ok := strconv.parse_int(column)
        if ok {
            for i in -1..=1 {
                if (i + cpos == -1) || (i + cpos == len(row)) {
                    continue
                }
                if rpos != 0 {
                    _, ok := strconv.parse_int(table[rpos-1][cpos+i])
                    if !ok && table[rpos-1][cpos+i] != "." {
                        //fmt.print(table[rpos-1][cpos+i])
                        append(&nums, num)
                        last = column
                        break
                    }
                }
                _, ok := strconv.parse_int(table[rpos][cpos+i])
                if !ok && table[rpos][cpos+i] != "." {
                    //fmt.print(table[rpos][cpos+i])
                    append(&nums, num)
                    last = column
                    break
                }
                if rpos != rows-1 {
                    _, ok := strconv.parse_int(table[rpos+1][cpos+i])
                    if !ok && table[rpos+1][cpos+i] != "." {
                        //fmt.print(table[rpos+1][cpos+i])
                        append(&nums, num)
                        last = column
                        break
                    }
                }
            }
        }          
    }
    //fmt.println()
}
p1 = math.sum(nums[:])
delete(nums)
for n in table {
    delete(n)
}
delete(table)

for row, rpos in table {
    for column, cpos in row{
        _, ok := strconv.parse_int(column)
        if !ok && column != "." {
            for i in -1..=1 {
                if rpos != 0 {
                    fmt.print(table[rpos-1][cpos+i], "")
                    num, ok := strconv.parse_int(table[rpos-1][cpos+i])
                    if ok {
                        p1 += num
                    }
                }
                fmt.print(table[rpos][cpos+i], "")
                num, ok := strconv.parse_int(table[rpos][cpos+i])
                if ok {
                    p1 += num
                }
                if rpos != rows {
                    fmt.print(table[rpos+1][cpos+i], "")
                    num, ok := strconv.parse_int(table[rpos+1][cpos+i])
                    if ok {
                        p1 += num
                    }
                }
                fmt.print("| ")
            }
            fmt.println()
        }
    }
}