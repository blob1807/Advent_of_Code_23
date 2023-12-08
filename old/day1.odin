package old
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
            case 'o', 't', 'f', 's', 'e', 'n':
                if pos+5 < line_len {
                    if line[pos:pos+5] == "three" {
                        p2 += 30
                        break l1
                    } else if line[pos:pos+5] == "seven" {
                        p2 += 70
                        break l1
                    } else if line[pos:pos+5] == "eight" {
                        p2 += 80
                        break l1
                    } 
                }
                if pos+4 < line_len {
                    if line[pos:pos+4] =="four" {
                        p2 += 40
                        break l1
                    } else if line[pos:pos+4] == "five" {
                        p2 += 50
                        break l1
                    } else if line[pos:pos+4] == "nine" {
                        p2 += 90
                        break l1
                    }
                }
                if pos+3 < line_len {
                    if line[pos:pos+3] == "one" {
                        p2 += 10
                        break l1
                    } else if line[pos:pos+3] == "two" {
                        p2 += 20
                        break l1
                    } else if line[pos:pos+3] == "six" {
                        p2 += 60
                        break l1
                    }
                }
        }
    }
    l2: for pos := line_len - 1; pos >= 0; pos-=1 {
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
            case 'e', 'o', 'r', 'x', 'n', 't':
                if pos-4 >= 0 {
                    if line[pos-4:pos+1] == "three" {
                        p2 += 3
                        break l2
                    } else if line[pos-4:pos+1] == "seven" {
                        p2 += 7
                        break l2
                    } else if line[pos-4:pos+1] == "eight" {
                        p2 += 8
                        break l2
                    } 
                }
                if pos-3 >= 0 {
                    if line[pos-3:pos+1] =="four" {
                        p2 += 4
                        break l2
                    } else if line[pos-3:pos+1] == "five" {
                        p2 += 5
                        break l2
                    } else if line[pos-3:pos+1] == "nine" {
                        p2 += 9
                        break l2
                    }
                }
                if pos-2 >= 0 {
                    if line[pos-2:pos+1] == "one" {
                        p2 += 1
                        break l2
                    } else if line[pos-2:pos+1] == "two" {
                        p2 += 2
                        break l2
                    } else if line[pos-2:pos+1] == "six" {
                        p2 += 6
                        break l2
                    }
                }
        }
    }
}

for line in lines {
    line_len := len(line)
    l111: for pos: int; pos < line_len; pos+=1 {
        c := line[pos]
        switch c {
            case '1':
                p4 += 10
                break l111
            case '2':
                p4 += 20
                break l111
            case '3':
                p4 += 30
                break l111
            case '4':
                p4 += 40
                break l111
            case '5':
                p4 += 50
                break l111
            case '6':
                p4 += 60
                break l111
            case '7':
                p4 += 70
                break l111
            case '8':
                p4 += 80
                break l111
            case '9':
                p4 += 90
                break l111
            case 'o':
                if strings.has_prefix(line[pos:], "one") {
                    p4 += 10
                    break l111
                }
            case 't':
                if strings.has_prefix(line[pos:], "two") {
                    p4 += 20
                    break l111
                }else if strings.has_prefix(line[pos:], "three") {
                    p4 += 30
                    break l111
                }
            case 'f':
                if strings.has_prefix(line[pos:], "four") {
                    p4 += 40
                    break l111
                } else if strings.has_prefix(line[pos:], "five") {
                    p4 += 50
                    break l111
                }
            case 's':
                if strings.has_prefix(line[pos:], "six") {
                    p4 += 60
                    break l111
                }else if strings.has_prefix(line[pos:], "seven") {
                    p4 += 70
                    break l111
                }
            case 'e':
                if strings.has_prefix(line[pos:], "eight") {
                    p4 += 80
                    break l111
                } 
            case 'n':
                if strings.has_prefix(line[pos:], "nine") {
                    p4 += 90
                    break l111
                } 
        }
    }
    l222: for pos := line_len - 1; pos >= 0; pos -= 1 {
        c := line[pos]
        switch c {
            case '1':
                p4 += 1
                break l222
            case '2':
                p4 += 2
                break l222
            case '3':
                p4 += 3
                break l222
            case '4':
                p4 += 4
                break l222
            case '5':
                p4 += 5
                break l222
            case '6':
                p4 += 6
                break l222
            case '7':
                p4 += 7
                break l222
            case '8':
                p4 += 8
                break l222
            case '9':
                p4 += 9
                break l222
            case 'e':
                if strings.has_prefix(line[pos:], "one") {
                    p4 += 1
                    break l222
                } else if strings.has_prefix(line[pos:], "five") {
                    p4 += 5
                    break l222
                } else if strings.has_prefix(line[pos:], "nine") {
                    p4 += 9
                    break l222
                } else if strings.has_prefix(line[pos:], "three") {
                    p4 += 3
                    break l222
                }
            case 'o':
                if strings.has_prefix(line[pos:], "two") {
                    p4 += 2
                    break l222
                }
                
            case 'r':
                if strings.has_prefix(line[pos:], "four") {
                    p4 += 4
                    break l222
                }
            case 'x':
                if strings.has_prefix(line[pos:], "six") {
                    p4 += 6
                    break l222
                }
            case 'n':
                if strings.has_prefix(line[pos:], "seven") {
                    p4 += 7
                    break l222
                }
            case 't':
                if strings.has_prefix(line[pos:], "eight") {
                    p4 += 8
                    break l222
                }
        }
    }
}