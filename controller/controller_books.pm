package controller::controller_books;
 use Data::Dumper;
 use JSON;
 use model::books_model;


sub test {
    my $a = 'Controller books test OK';
    return $a;
}


#получаем данные model отдаем JSON
sub all_books
{
    my $c = model::books_model->select_all_books();
    #print Dumper(\@c);
    #print (model::books_model->select_all());
    #my $json_string = encode_json(\@c);
    #$json_string =~ s/\\]/\}/;
    #print Dumper($json_string);
    #return encode_json(\@c);
    #print Dumper($c."88888888");
    #print $c;   # в конце делает 1
    return $c;
}


sub get_book_by_id
{
    my ($h,$id) = @_;
    #print Dumper($id);
    #print Dumper($id);
    my $c = model::books_model->get_book($id);
    return $c;
    #print "$c";

}

 
 1;