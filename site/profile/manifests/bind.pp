class profile::bind {
    
    include dns::server
    
    # Forwarders
    dns::server::options { '/etc/bind/named.conf.options':
      forwarders => [ '192.168.1.1','8.8.8.8', '8.8.4.4' ]
    }
    
    # Forward Zone
    dns::zone { 'mcgahee.homelab':
      soa         => 'dns.mcgahee.homelab',
      soa_email   => 'admin.mcgahee.homelab',
      nameservers => ['dns']
    }
    
    # Reverse Zone
    dns::zone { '1.168.192.IN-ADDR.ARPA':
      soa         => 'dns.mcgahee.homelab',
      soa_email   => 'admin.mcgahee.homelab',
      nameservers => ['dns']
    }
    
    # A Records:
    dns::record::a {
      'puppet':
        zone => 'mcgahee.homelab',
        data => ['192.168.1.104'],
        ptr  => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
      'dns':
        zone => 'mcgahee.homelab',
        data => ['192.168.1.107'],
        ptr  => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
      'gitlab':
        zone => 'mcgahee.homelab',
        data => ['192.168.1.109'],
        ptr  => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
    }
}