include postfix

postfix::config { 'relay_domains':
  ensure  => present,
  value   => 'localhost gitlab.mcgahee.homelab',
}

class { 'gitlab':
  external_url => 'https://gitlab.mcgahee.homelab',
  nginx        => {
     redirect_http_to_https => true,
  },
  gitlab_rails => {
    'webhook_timeout' => 10,
    'gitlab_default_theme' => 2,
  },
  logging      => {
    'svlogd_size' => '200 * 1024 * 1024',
  },
}
