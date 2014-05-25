puppet-s3-sync
==============

A very simple puppet module for keeping things in sync with S3.

One quick note, this was developed to run against SmartOS, it however it should work for Ubuntu.  I created it to backup some websites and databases to S3, and as such this is a very simple applicaiton.

How to use:

I broke this module into 3 individual invocations, which you'd likely want to make from your node manifest.

Step 1) Lets make sure s3cmd is installed.

    class {'s3-sync': }

Step 2) Lets Setup a .s3cfg file!

    s3-sync::user { 'a whitty resource title':
      user           => 'your username',
      aws_key_id     => 'your aws key id',
      aws_secret_key => 'your aws secret key',
      gpg_passphrase => 'a passphrase for gpg encryption',
      path           => '/path/to/your/users/home/folder/',
    }

Part of the complexity for this setp is due to puppets insistance that all paths must be absolute.  If there is a better way, please fork, and send me back a pull request because I don't quite like it, but it works for now.

Step 3) Go ahead set us up some cron jobs to make sure my stuff gets synced out to S3.

    s3-sync::cron {'a whitty backup job resource title':
      user       => 'your username',
      localpath  => '/path/to/your/files/you/want/synced',
      bucketpath => 'bucketname/bucketfolder/',
      backuptime => [ '12', '00' ],
    }

The backup time is in the form of ['hour', 'minute'] and will execute daily.

