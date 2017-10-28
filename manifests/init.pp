class sclo {
  
  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
  } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }

    if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ and $os_maj_release == '7' {
        package { [
                'centos-release-scl'
            ]:
                ensure => 'latest'
        }
    }
    else {
        notice ("Cannot install centos-release-scl ${::operatingsystem}")
    }
}