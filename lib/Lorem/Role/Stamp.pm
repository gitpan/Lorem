package Lorem::Role::Stamp;
{
  $Lorem::Role::Stamp::VERSION = '0.200';
}

use Moose::Role;
use MooseX::SemiAffordanceAccessor;

requires 'imprint';

1;
