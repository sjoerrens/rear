# check wether the archive is actually there

# Don't check when backup is on a tape device
if [ "$NETFS_PROTO" == "tape" ]; then
	return
fi

[ -s "$backuparchive" ]
StopIfError "Backup archive '$backuparchive' not found !"

LogPrint "Calculating backup archive size"

du -sh "$backuparchive" >$TMP_DIR/backuparchive_size
StopIfError "Failed to determine backup archive size."

read backuparchive_size junk <$TMP_DIR/backuparchive_size
LogPrint "Backup archive size is $backuparchive_size${BACKUP_PROG_COMPRESS_SUFFIX:+ (compressed)}"
