import os
import subprocess

# Files
lstOfExistingFiles = []
lstForToDo = []
lstForApt = []

# Adding To-Do
out = subprocess.Popen(
        ['calcurse','-D','/home/mike0609king/.config/calcurse','-t','--format-todo',"%m %n\n"],
        stdout = subprocess.PIPE,
        stderr = subprocess.STDOUT,
        universal_newlines=True
        )
stdout,stderr = out.communicate()
lstFile = stdout.splitlines()
for potentialFile in lstFile:
    # should do...
    toDos = potentialFile.split(' ')
    # Concat string
    st = ''
    for s in toDos[:-1]:
        st += s + ' '
    # inserting
    if len(toDos[-1]) > 30:
        lstForToDo.append([st,toDos[-1]])
        lstOfExistingFiles.append(toDos[-1])

# Adding Events and Appointments
out = subprocess.Popen(
        ['calcurse','-D','/home/mike0609king/.config/calcurse','--output-datefmt','%d/%m/%y','-r365','--format-apt',"%m %n\n",'--format-event',"%m %n\n"],
        stdout = subprocess.PIPE,
        stderr = subprocess.STDOUT,
        universal_newlines=True
        )
stdout,stderr = out.communicate()
lstFile = stdout.splitlines()
lastDate = ''
for potentialFile in lstFile:
    if potentialFile.find('/') != -1:
        lastDate = potentialFile[:-1]
    else:
        apt = potentialFile.split(' ')
        # Concat string
        st = ''
        for s in apt[:-1]:
            st += s + ' '
        # inserting
        if len(apt[-1]) > 30:
            lstForApt.append([st,apt[-1],lastDate])
            lstOfExistingFiles.append(apt[-1])

# Clearing out trash
lst = os.listdir(".")
for relativeLink in lst:
    # if it is really a MD-File
    if (relativeLink.find('.') == -1 and relativeLink not in lstOfExistingFiles):
        ans = input('Sure that you want to remove {}. (y)es/(n)o   '.format(relativeLink))
        # ans = 'y' # No reason to ask...
        if 'y' == ans:
            os.system("trash {}".format(relativeLink))
            print('Removed {}'.format(relativeLink))
        else:
            print('{} didn\'t got removed'.format(relativeLink))

# Reading 
readmeFile = open("README.md","w")
readmeFile.write("# Markdown files\n")

lastDate = ''
# writing Appointments and Events
readmeFile.write("## Appointment And Events\n")
for relativeLink in lstForApt:
    if relativeLink[2] != lastDate:
        readmeFile.write("\n- {}\n".format(relativeLink[2]))
        lastDate = relativeLink[2]
    readmeFile.write("  - [{}]({})\n".format(relativeLink[0],relativeLink[1]))

# writing todo
readmeFile.write("## TO-DOs\n")
for relativeLink in lstForToDo:
    readmeFile.write("- [{}]({})\n".format(relativeLink[0],relativeLink[1]))
readmeFile.close()
