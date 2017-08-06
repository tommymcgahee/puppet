class profile::apache {
    
    class { 'apache':
        default_vhost => false,
    }

    $myApacheVhosts = hiera('apache::vhosts', {})

    $createSelfSignedCerts = exec { 'create_self_signed_sslcert':
        command => "openssl req -newkey rsa:2048 -nodes -keyout ${apache::vhost::vhost_name}.key  -x509 -days 365 -out ${apache::vhost::vhost_name}.crt -subj '/CN=${apache::vhost::vhost_name}'",
        cwd     => "/etc/ssl/",
        creates => [ "/etc/ssl/${apache::vhost::vhost_name}.key", "/etc/ssl/${apache::vhost::vhost_name}.crt", ],
        path    => ["/usr/bin", "/usr/sbin"],
    }
    
    create_resources('apache::vhost', $myApacheVhosts, $createSelfSignedCerts)
}