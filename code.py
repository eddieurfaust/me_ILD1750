file = "0_all_data.dat"

# bool to 'skip' invalid sensor data ('0x8004')
pause = False # TODO maybe we don't need this, see below
# buffer, to gather contigous valid data blocks before writing them
buffer = ""
# counter for no of valid lines
conseq_lines = 0

with open('output.csv', 'wt') as outf:
    outf.write("timestamp, dist_in_mm, sensor_status") # write header
    with open(file, 'rt') as inf:
        for line in inf:
            # WARNING test for string "0x8004" is error prone! (see manual, page 65), we should look at individual bits!
            if "0x8004" in line and not pause:
                if conseq_lines > 1000: # found at least 1000 valid lines
                    outf.write(buffer)
                buffer = "" # reset buffer
                conseq_lines = 0 # reset counter
                outf.write("\n\n") # data block separator (gnuplot)
                # TODO get rid of 'pause', test for (buffer == "") instead?
                pause = True # only come here, when we got at least one valid line
            # WARNING test for string "0x8000" is error prone! (see manual, page 65), we should look at individual bits!
            if "0x8000" in line:
                pause = False
                #outf.write(line)
                conseq_lines += 1
                buffer += line

    if conseq_lines > 1000:
        outf.write(buffer)
    buffer = ""
