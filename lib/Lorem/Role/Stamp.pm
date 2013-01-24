package Lorem::Role::Stamp;
{
  $Lorem::Role::Stamp::VERSION = '0.21';
}

use Moose::Role;
use MooseX::SemiAffordanceAccessor;

requires 'imprint';

1;
