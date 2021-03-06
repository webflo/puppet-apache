# == Definition: apache::confd::file_exists
#
# Defines a file if, and only if, the file is not defined
# anywhere else.
#
# Uses the +path+  as name for the file resource. Also defaults the
# owner and group to what is defined in apache::params (daemon_user/group)
#
# For these kind of files, we do not notify the service my default since
# the resource that called this will probably do so on itself.
#
define apache::confd::file_exists (
  $ensure,
  $path,
  $notify_service = false,
  $owner          = undef,
  $group          = undef,
  $purge          = false,
  $target         = undef
) {

  require apache::params

  $fowner = $owner ? {
    undef   => $::apache::params::daemon_user,
    default => $owner,
  }

  $fgroup = $group ? {
    undef   => $::apache::params::daemon_group,
    default => $group,
  }

  if defined(File[$path]) {
    info("The folder ${path} is already defined. Skipping creation.")
  }
  else {
    file {$path:
      ensure => $ensure,
      owner  => $fowner,
      group  => $fgroup,
      purge  => $purge,
      target => $target,
    }
    if $notify_service {
      File[$path] {
        notify => Service['apache'],
      }
    }
  }


}
