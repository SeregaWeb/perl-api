#!/usr/bin/perl -w 

use strict;
use warnings;
#use File::Basename qw(dirname);
#use lib dirname(__FILE__);
use lib '/home/user11/public_html/perlproject';
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML) ;
use CGI::Carp qw(fatalsToBrowser); 
use vars qw(%in);
use Data::Dumper;
use utilities::database;
use router::router;
use controller::controller_books;
use controller::controller_autors;
use controller::controller_genres;
#use lib '/home/user11/public_html/perlproject/controller';
#use lib::controller::controller_a;


print "Content-type: application/json\n\n";
#print "Content-Type: application/vnd.api+json\n\n";
# print "Content-Type: application/json;charset=utf-8\n\n";
#print "Content-type: text/html; charset=utf-8\n\n";



my $json = {
    cards => [1..5],
    repairs => [6..10],
};


ReadParse();
#controller::controller_books()->test();
#my $test = utilities::database->test();
#$test->test();
#my $controller_books = controller::controller_books();
#$controller_books->test();




#print to_json($json);
#print "<pre>";
my $uri_test = $ENV{'REQUEST_URI'};
my $dir = $ENV{'PATH_INFO'};
#print Dumper($ENV{'REQUEST_URI'});
#print "\n";
#$string =~ s/ .*? .*&method= /$1/gx; рабочий метод
#$string =~ s/ .*? .*?(controller=.+?) /$1/gx; #выбрать все
#####Нужный вариант парсинга URL
#$string =~ s/.+(index\.html) /$1/gx; #выбрать router и всё после него
#my $data = $string;
#$data =~ s/.+\?(a+?) /$1/gx; #выбрать переменные
#print "$data\n";



#my $a = controller::controller_books->test();
#print $a;
 my $db = utilities::database->connect();
    #$db->update_query(); $db->insert_query(5,"AKULA");
    #$db->select_query();
    #$db->delete_query(5);


sub test ()
{
    return 'test index cgi OK';
}

my $controller = $in{'controller'};
my $method = $in{'method'};
my $id = $in{'index'};
#print Dumper($id,$method,$controller);

# yo controllers! 

if($controller eq "books" && $method eq "one"){
        #print 'mothod1';
        print controller::controller_books->get_book_by_id($id);
}else{
        print '';
}



if($controller eq "books" && $method eq "all"){
        #print 'mothod2';
        print controller::controller_books->all_books();
}else{
        print '';
}

if($controller eq "genres" && $method eq "all"){
        #print 'mothod3';
        print controller::controller_genres->all_genres();
}else{
        print '';
}

if($controller eq "authors" && $method eq "all"){
        #print 'mothod4';
        print controller::controller_autors->all_autors();
}else{
        print '';
}

if($controller eq "genres" && $method eq "one"){
        #print 'mothod6';
        print controller::controller_genres->get_genre_by_id(1);
}else{
        print '';
}

if($controller eq "authors" && $method eq "one"){
        #print 'mothod5';
        print controller::controller_autors->get_autor_by_id(1);
}else{
        print '';
}
#print Dumper(controller::controller_autors->get_autor_by_id(1));
#result();
    ##### test router
    #print router::router->test();
    #print "\n";
    ##### test controller
    #  work variant for test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #print "TESTING STRING router.cgi\n\n print all from books: \n";
    #print controller::controller_books->select_all_books();


    #TESTING ZONE
    #ALL BOOKS
    #print controller::controller_books->all_books();
    #ALL AUTORS
    #print controller::controller_autors->all_autors();
    #ALL GENRES
    #print controller::controller_genres->all_genres();
    #GET BOOK BY ID
    #print controller::controller_books->get_book_by_id(2);
    #GET AUTHOR BY ID
    #print controller::controller_books->get_book_by_id(2);

        
    # print controller::controller_books->all_books();
    