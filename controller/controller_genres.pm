package controller::controller_genres;
 use Data::Dumper;
 use JSON;
 use model::books_model;


sub test {
    my $a = 'Controller genres test OK';
    return $a;
}


#получаем данные model отдаем JSON
sub all_genres
{
    my $c = model::books_model->select_all_genres();
    return $c;
    #print "$c";
}

sub get_genre_by_id
{
    my ($h,$id) = @_;
    #print Dumper($id);
    my $c = model::books_model->get_genre($id);
    return $c;
    #print "$c";
}



 
 1;