package Lorem::Element::Header;
{
  $Lorem::Element::Header::VERSION = '0.23.1';
}

use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
with 'MooseX::Clone';

use Cairo;
use Pango;

use Lorem::Element::Text;
use Lorem::Types qw( LoremText );


extends 'Lorem::Element::Box';



has 'left' => (
    is => 'rw',
    isa => LoremText,
    required => 1,
    traits => [qw(Clone)],
);

has 'center' => (
    is => 'rw',
    isa => LoremText,
    required => 1,
    traits => [qw(Clone)],
);

has 'right' => (
    is => 'rw',
    isa => LoremText,
    required => 1,
    traits => [qw(Clone)],
);

sub BUILD {
    my $self = shift;
    $_->set_parent( $self ) for $self->left, $self->right, $self->center;
    push @{ $self->children }, $self->left, $self->right, $self->center; 
}

sub BUILDARGS {
    my $class = shift;
    
    my %args = @_;
    
    for (qw/left center right/) {
        
        # if position not exist, create it
        if ( ! $args{$_} ) {
            $args{$_} = Lorem::Element::Text->new( content => '' );
        }
        # if position is not a text element, coerce
        elsif ( ! blessed $args{$_} || ! $args{$_}->isa('Lorem::Element::Text') ) {
            $args{$_} = Lorem::Element::Text->new( content => $args{$_} );
        }
        
        $args{$_}->style->set_text_align($_);
    }
    
    return \%args;
}


sub child_size_allocate {
    my ( $self, $cr, $x, $y, $width, $height ) = @_;
    
    for my $child ( @{ $self->children } ) {
        $child->size_allocate( $cr, $x, $y, $width, $height);
    }
    
}


1;
