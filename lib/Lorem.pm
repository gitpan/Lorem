package Lorem;
{
  $Lorem::VERSION = '0.200';
}

use Lorem::Document;
use Lorem::Surface::Pdf;
use Lorem::Surface::PrintOperation;


sub new_document {
    Lorem::Document->new;
}


1;



__END__

=pod

=head1 NAME

Lorem - Cross-platform document renderer

=head1 SYNOPSIS

  use Lorem;

  use Lorem::Util qw( in2pt );

  $doc = Lorem->new_document;

  $doc->new_header( center => 'Lorem Document' );
  
  $doc->new_page( style => 'align: center' );
  
  $page->new_text( content => 'Lorem Ipsum' );
  
  # save to pdf file
  $pdf = Lorem::Surface::Pdf->new (

    file_name => 'output.pdf',

    width => in2pt( 8.5 ),

    height => in2pt( 11 ),

  );
  
  $pdf->print( $doc );

  # send to printer

  $printer = Lorem::Surface::PrintOperation->new(

    gtk_window = Gtk2::Window->new,

  );

  $printer->print( $doc );

=head1 DESCRIPTION

Lorem is a library for creating printable reports. Lorem is a layer over the
Pango/Cairo/Gtk2 Perl bindings that provides support for headers, margins,
tables and other document elements.

=head1 ALPHA VERSION

*THIS IS NEW SOFTWARE. IT IS STILL IN DEVELOPMENT. THE API MAY CHANGE IN FUTURE
VERSIONS WITH NO NOTICE.*

=head1 METHODS

=over 4

=item new_document 

Returns a new L<Lorem::Document> object.

=back

=head1 SEE ALSO

=over 4

=item L<Cairo>

=item L<Gtk2>

=item L<Pango>

=back

=head1 SUPPORT

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 AUTHORS

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2010-2012 Jeffrey Ray Hallock.
    
    This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=cut


