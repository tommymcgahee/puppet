class profile::apache {

    # Include Apache
    class { 'apache':
        default_vhost => false,
    }
  
    # Create a hash from Hiera Data with the Vhosts
    $myApacheVhosts = hiera('apache::vhosts', {})

    # With Create Resource Converts a hash into a set of resources
    create_resources('apache::vhost', $myApacheVhosts)
}