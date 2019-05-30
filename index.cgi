#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename qw(dirname);
use lib dirname(__FILE__);
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML) ;
use CGI::Carp qw(fatalsToBrowser); 
use vars qw(%in);
use Data::Dumper;
use JSON;
use DBI;
use utilities::database;
use router::router;
use controller::controller_a;
#use lib '/home/user11/public_html/perlproject/controller';
#use lib::controller::controller_a;


print "Content-type: application/json\n\n";

my $json = {
    cards => [1..5],
    repairs => [6..10],
};


ReadParse();
#controller::controller_a()->test();
#my $test = utilities::database->test();
#$test->test();
#my $controller_A = controller::controller_a();
#$controller_A->test();




#print to_json($json);
#print Dumper(\%in)."<br>";
#print "<pre>";
# print Dumper(\%ENV);
my $uri_test = $ENV{'REQUEST_URI'};
my $dir = $ENV{'PATH_INFO'};
my $string = $uri_test;
#print $string;
#print "\n";
#$string =~ s/ .*? .*&method= /$1/gx; рабочий метод
#$string =~ s/ .*? .*?(controller=.+?) /$1/gx; #выбрать все
$string =~ s/ .*? .*?(\&.+?) /$1/gx; #выбрать все
#print $string;
#print $uri_test;



#my $a = controller::controller_a->test();
#print $a;
 my $db = utilities::database->connect();
    #$db->update_query(); $db->insert_query(5,"AKULA");
    #$db->select_query();
    print "------JUST TEST INDEX-----\n";
    #$db->delete_query(5);


sub test ()
{
    return 'test index cgi OK';
}
    ##### test router
    print router::router->test();
    print "\n";
    ##### test controller
    print controller::controller_a->select_all_books();