package Bencher::Scenario::FileWriteRotate::Startup;

# DATE
# VERSION

use strict;
use warnings;

use File::Temp;

our $scenario = {
    participants => [
        {
            module => 'File::Write::Rotate',
        },
        {
            module => 'Log::Dispatch::FileRotate',
        },
    ],
    module_startup => 1,
};

1;
# ABSTRACT:

=head1 SEE ALSO
