#!/usr/bin/perl -w 

package router::router;
use strict;
use warnings;
use Data::Dumper;
use utilities::database;
use controller::controller_books;


sub test()
{
    return '= test router OK =';
}

sub get_all()
{
    return controller::controller_books->select_all_books();
}

sub get_books_by_id()
{
    return '[test get_books_by_id OK]';
}



 1;