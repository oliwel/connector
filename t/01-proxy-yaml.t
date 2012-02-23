# Tests for Connector::Proxy::YAML
#

use strict;
use warnings;
use English;

use Test::More tests => 8;

diag "LOAD MODULE\n";

BEGIN {
    use_ok( 'Connector::Proxy::YAML' ); 
}

require_ok( 'Connector::Proxy::YAML' );


diag "Connector::Proxy::YAML tests\n";
###########################################################################
my $conn = Connector::Proxy::YAML->new(
    {
	LOCATION  => 't/config/config.yaml',
	PREFIX    => 'test.entry',
    });

is($conn->get('foo'), '1234');
is($conn->get('bar'), '5678');

is($conn->get('nonexistent'), undef);

# try full path access
is($conn->PREFIX(''), '');

# and repeat above tests
is($conn->get('test.entry.foo'), '1234');
is($conn->get('test.entry.bar'), '5678');
