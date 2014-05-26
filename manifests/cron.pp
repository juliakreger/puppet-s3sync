define s3sync::cron  ( $ensure = "present", $user, $backuptime, $localpath, $bucketpath ) {
  $s3cmdlocation = $operatingsystem ? {
    'SmartOS' => '/opt/local/bin',
    default   => '/usr/bin',
  }

  cron { "$title backup job":
    ensure  => $ensure,
    command => "${s3cmdlocation}/s3cmd sync ${localpath} s3://${bucketpath}",
    user    => $user,
    hour    => $backuptime[0],
    minute  => $backuptime[1],
  }
}
