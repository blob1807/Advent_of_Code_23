
from datetime import date

out = ""
with open("day_template.txt", "r") as f:
    out = f.read()

day = str(date.today().day)
out = out.replace("{day num}", day)

with open(f"day_{day}.odin", "w") as f:
    f.write(out)