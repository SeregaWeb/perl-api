#!/usr/bin/perl -w 
use strict;
use warnings;
use Data::Dumper;
#use controller::controller_books;
use lib '/home/user11/public_html/perlproject/';

# первый параметр принимаемый скриптом из терминала
#print $ARGV[0];

sub test()
{
    return '= test router OK =';
}

sub get_all()
{
    return lib::controller::controller_books->select_all_books();
}

sub get_books_by_id()
{
    return '[test get_books_by_id OK]';
}

