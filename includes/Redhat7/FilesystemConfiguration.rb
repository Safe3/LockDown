require 'shellwords'


def bash(command)
  escaped_command = Shellwords.escape(command)
  system "bash -c #{escaped_command} > /dev/null 2>/dev/null"
end


tmp = 'grep "[[:space:]]/tmp[[:space:]]" /etc/fstab'
tmp_nosuid = 'grep "[[:space:]]/tmp[[:space:]]" /etc/fstab | grep nosuid'
tmp_nosuid_rec = 'ruby -i -p -e "gsub(/defaults/, \'defaults,nosuid\') if ~/tmp/" /etc/fstab'
tmp_nosuid_mnt = 'mount | grep "[[:space:]]/tmp[[:space:]]" | grep nosuid'
tmp_nosuid_mnt_rec = 'mount -o remount,nosuid /tmp'

tmp_nodev = 'grep "[[:space:]]/tmp[[:space:]]" /etc/fstab | grep nodev'
tmp_nodev_rec = 'ruby -i -p -e "gsub(/defaults/, \'defaults,nodev\') if ~/tmp/" /etc/fstab'
tmp_nodev_mnt = 'mount | grep "[[:space:]]/tmp[[:space:]]" | grep nodev'
tmp_nodev_mnt_rec = 'mount -o remount,nodev /tmp'

def verify_partition_tmp()
  if bash(tmp) == false
    puts "Error"
  elsif bash(tmp_nosuid) == false
    puts "nosuid added" if bash(tmp_nosuid_rec) == true
  elsif bash(tmp_nosuid_mnt) == false
    puts "nosuid added in a realtime" if bash(tmp_nosuid_mnt_rec)
  end
  elsif bash(tmp_nodev) == false
    puts "nosuid added" if bash(tmp_nodev_rec) == true
  elsif bash(tmp_nodev_mnt) == false
    puts "nosuid added in a realtime" if bash(tmp_nodev_mnt_rec)
  end
end
