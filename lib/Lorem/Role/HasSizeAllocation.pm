package Lorem::Role::HasSizeAllocation;
{
  $Lorem::Role::HasSizeAllocation::VERSION = '0.23.1';
}

use Moose::Role;
use MooseX::SemiAffordanceAccessor;

has 'size_allocation' => (
    is => 'rw',
    isa => 'Maybe[HashRef]',
    default => undef,
    writer => 'set_size_allocation',
);



1;
