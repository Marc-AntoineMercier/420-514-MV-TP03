from os import getcwd

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
