class playonlinux::params{
  case $::osfamily {
  'Debian': {
    $package_name = 'playonlinux'
    case $::lsbdistid {
      'Ubuntu': {
        case $::lsbdistcodename {
            'trusty','saucy','precise': {
              $needs_repository = true
              $repository_uri   = 'http://deb.playonlinux.com'
              $repository_key   = 'http://deb.playonlinux.com/public.gpg'
              $repository_key_id= '74F7358425EEB6176094C884E0F72778C4676186'
            }
            default: {
              $needs_repository = false
            }
          }
        }
      }
    }
  }
}
