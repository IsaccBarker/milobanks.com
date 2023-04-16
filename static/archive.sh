set -e

remote="UNKNOWN"
remote_path="UNKNOWN"

do_it () {
	echo "Doing it at $1"
	cd $1
	tar -czf $2.tar . -C $2
	doas gpg --output $2.tar.gpg --encrypt --recipient milobanks@rowlandhall.org $2.tar
	echo "Syncing..."
	rsync $2.tar $remote:$remote_path
}

do_it /usr/local/www/ nginx
