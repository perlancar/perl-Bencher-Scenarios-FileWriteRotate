package Bencher::Scenario::FileWriteRotate::Writing;

# DATE
# VERSION

use strict;
use warnings;

use File::Temp;

our $scenario = {
    summary => 'Benchmark writing using File::Write::Rotate',
    modules => {
        'File::Write::Rotate' => {version=>'0.28'},
    },
    precision => 6,
    participants => [
        {
            name => 'fwr',
            module => 'File::Write::Rotate',
            function => 'write',
            code_template => <<'_',
state $tempdir = File::Temp::tempdir(CLEANUP => 1);
state $fwr = File::Write::Rotate->new(dir => $tempdir, prefix=>'fwr');
$fwr->write(<str>) for 1..1000;
_
        },
        {
            name => 'fwr(lock_mode=none)',
            module => 'File::Write::Rotate',
            function => 'write',
            code_template => <<'_',
state $tempdir = File::Temp::tempdir(CLEANUP => 1);
state $fwr = File::Write::Rotate->new(dir => $tempdir, prefix=>'fwr', lock_mode=>'none');
$fwr->write(<str>) for 1..1000;
_
        },
        {
            name => 'fwr(lock_mode=exclusive)',
            module => 'File::Write::Rotate',
            function => 'write',
            code_template => <<'_',
state $tempdir = File::Temp::tempdir(CLEANUP => 1);
state $fwr = File::Write::Rotate->new(dir => $tempdir, prefix=>'fwr', lock_mode=>'exclusive');
$fwr->write(<str>) for 1..1000;
_
        },
        {
            name => 'fwr(rotate_probability=0.1)',
            module => 'File::Write::Rotate',
            function => 'write',
            code_template => <<'_',
state $tempdir = File::Temp::tempdir(CLEANUP => 1);
state $fwr = File::Write::Rotate->new(dir => $tempdir, prefix=>'fwr', rotate_probability=>0.1);
$fwr->write(<str>) for 1..1000;
_
        },
        {
            name => 'normal',
            code_template => <<'_',
state $tempdir = File::Temp::tempdir(CLEANUP => 1);
state $fh = do { open my $fh, ">", "$tempdir/nf"; $fh };
print { $fh } <str> for 1..1000;
_
        },
    ],
    datasets => [
        {name => "1k x 100b", args => {str => "a" x 100}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
