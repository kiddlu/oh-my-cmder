@rem | emptybin {drive} 
@rem | Empty the Recycle Bin. the {drive} parameter specifies the drive of the Recycle Bin that you want to empty. If the {drive} parameter is not specified, all Recycle Bin on all drives will be emptied. 
@rem | Example: 
@rem | emptybin f: 
@rem | emptybin

@%~dp0\nircmd.exe emptybin %*
