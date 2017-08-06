class profile::apache {

    exec {'create_self_signed_sslcert':
        command => "openssl req -newkey rsa:2048 -nodes -keyout ${::fqdn}.key  -x509 -days 365 -out ${::fqdn}.crt -subj '/CN=${::fqdn}'",
        cwd     => "/etc/apache2/ssl/",
        creates => [ "/etc/apache2/ssl/${::fqdn}.key", "/etc/apache2/ssl/${::fqdn}.crt", ],
        path    => ["/usr/bin", "/usr/sbin"]
    }
    
    class { 'apache':
        default_vhost => false,
    }

  
    $myApacheVhosts = hiera('apache::vhosts', {})
    create_resources('apache::vhost', $myApacheVhosts)
}