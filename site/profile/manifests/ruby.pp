class profile::ruby {
    class { '::ruby':
      version         => '2.4.1', 
      gems_version    => 'latest', 
      rubygems_update => false,
    }
}