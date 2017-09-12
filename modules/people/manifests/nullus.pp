class people::nullus {
  include boxen::development

  include sublime_text
  include iterm2::dev

  package { 'fish':
    ensure => latest,
  }
  -> file_line { 'fish_shell':
    path => '/etc/shells',
    line => '/usr/local/bin/fish',
  }

  # Can't add a relationship here since the homebrew install has an implicit dependency on the user
  user { $::boxen_user:
    shell => '/usr/local/bin/fish',
  }

  # override global gitignore
  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore_global"
  }
}
