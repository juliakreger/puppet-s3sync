class s3-sync {
  $s3cmdpackage = $operatingsystem ? {
    'SmartOS'  => 'py27-s3cmd',
    default    => 's3cmd',
  }
  package { 'Install s3cmd package':
    name       => $s3cmdpackage,
    ensure     => present,
  }
}
