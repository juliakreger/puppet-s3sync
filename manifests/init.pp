# == Class: s3sync
#
# A simple puppet module for keeping a backup on S3.
#
# === Parameters
#
# See Examples
#
# === Variables
#
# See Examples.
#
# === Examples
#
#  Sets up environment for module to work, namely installs s3cmd.
#
#  class { s3sync: }
#  
#  Sets up an .s3cfg file.
#
#  s3sync::user { 'a whitty resource title':
#    user           => 'your username',
#    aws_key_id     => 'your aws key id',
#    aws_secret_key => 'your aws secret key',
#    gpg_passphrase => 'a passphrase for gpg encryption',
#    path           => '/path/to/your/users/home/folder/',
#  }
#
# Sets up a cron job to push files to S3
#
#  s3sync::cron {'a whitty backup job resource title':
#    user       => 'your username',
#    localpath  => '/path/to/your/files/you/want/synced',
#    bucketpath => 'bucketname/bucketfolder/',
#    backuptime => [ '12', '00' ],
#  }
#
# === Authors
#
# Julia Kreger <jkreger@gmail.com
#
# === Copyright
#
# Copyright 2014 Julia Kreger 
#
class s3sync {
  $s3cmdpackage = $operatingsystem ? {
    'SmartOS'  => 'py27-s3cmd',
    default    => 's3cmd',
  }
  package { 'Install s3cmd package':
    name       => $s3cmdpackage,
    ensure     => present,
  }
}
