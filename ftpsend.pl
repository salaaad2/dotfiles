use strict;
use warnings;
use Net::FTP;

my ($ftp, $host, $user, $pass);

$host = "saladslab.karabo.ga";
$user = "";
$pass = "";
$ftp = Net::FTP->new("saladslab.karabo.ga", Debug => 0)
    or die "cant connect";
$ftp->login($user, $pass)
    or die "cant login";
$ftp->cwd("saladslab")
    or die "cwd failed";
foreach my $f ($ftp->ls()) { print "$f\n" }

foreach my $file (@ARGV)
{
    $ftp->put("$file", "$file")
        or die "cant put $file\n", $ftp->message;
}
$ftp->quit;
