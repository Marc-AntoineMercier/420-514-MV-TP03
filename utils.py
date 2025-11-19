from os import getcwd
from pandas import isna, to_datetime


root_dirname = getcwd()

def create_data_path(file: str, dirname: str = "/data", format: str = "csv") -> str:
    print(root_dirname)
    if not "/" in dirname:
        dirname = "/" + dirname
    if not "/" in file:
        file = "/" + file
    if not "." in file:
        file = file + "." + format
    
    return root_dirname + dirname + file

def parse_hours(h: str) -> float:
    if isna(h) or h.strip() == "" or h in ["0:0-0:0", "0:0-0:0 ", " "]:
        return 0.0
    
    try:
        start, end = h.split("-")

        start = to_datetime(start, format="%H:%M")
        end   = to_datetime(end,   format="%H:%M")

        diff = (end - start).total_seconds() / 3600

        if diff < 0:
            diff += 24

        return diff
    
    except:
        return 0.0

