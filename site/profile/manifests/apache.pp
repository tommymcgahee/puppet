class profile::apache {
    
    class { 'apache':
        default_vhost => false,
    }

    $myApacheVhosts = hiera('apache::vhosts', {})
    create_resources('apache::vhost', $myApacheVhosts)
}