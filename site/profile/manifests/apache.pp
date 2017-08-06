class profile::apache {
    
    class { 'apache':
        default_vhost => false,
    }

    $myApacheVhosts = hiera('apache::vhosts', {})
    $createSelfSignedCerts = hiera('apache::vhosts::selfcerts', {})
    
    create_resources('apache::vhost', $myApacheVhosts, $createSelfSignedCerts)
}