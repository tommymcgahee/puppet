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
}