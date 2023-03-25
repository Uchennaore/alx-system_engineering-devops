# Install the puppet-lint package
package { 'puppet-lint':
  ensure   => '2.2.3',
  provider => 'gem',
}
