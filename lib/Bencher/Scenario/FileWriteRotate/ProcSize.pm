package Bencher::Scenario::FileWriteRotate::ProcSize;

# DATE
# VERSION

use strict;
use warnings;

use File::Temp;

our $scenario = {
    participants => [
        {
            module => 'File::Write::Rotate',
            code_template => '1',
        },
        {
            module => 'Log::Dispatch::FileRotate',
            code_template => '1',
        },
    ],
    with_process_size => 1,
};

1;
# ABSTRACT:

=head1 SEE ALSO
