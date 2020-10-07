# Bash Projects

This file goes into short detail about what each Project does exactly.

Project-Auto-Bash:
    This will autocreate a bash script file for you. It is interactive, as it asks you the file name and path for the newly created file.
    
Project-Custom-Perm-Fix:
    This is interactive. It will ask what permissions you want set and what path to set them on. It is recursive, be careful. You can not revert.


Project-DNS-Records:
  NOT DONE


Project-Full-Server-Backup:
  NOT DONE

Project-Remote-User-Backup:
    This will remotely access a machine that is specified. Then it will verify that a name of teh soon to be created backup does not exist on the remote server. Then it        will create a tar archieve that is compressed with GZP. From there using rsync it will sync the backup to the localhost.
    
Project-Server-Review:
    This will basically give a overview of the resource usage, memory usage, and more.
    
Project-User-Backup:
    This is ran on the localhost. It will create a backup of the files in the users home directory.

