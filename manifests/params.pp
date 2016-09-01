class playonlinux::params{
	case $::osfamily {
		'Debian': {
		    $package = 'playonlinux'
			case $::lsbdistid {
				'Ubuntu': {
					case $::lsbdistcodename {
						'trusty','saucy','precise': {
							$needs_repository = true
							$repository_uri   = "http://deb.playonlinux.com"
							$repository_key   = 'http://deb.playonlinux.com/public.gpg'
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
