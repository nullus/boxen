class people::nullus {
  include boxen::development

  include sublime_text
  include iterm2::dev

  user { $::boxen_user:
    shell => '/usr/local/bin/fish',
    require => Package['fish'],
  }
}
