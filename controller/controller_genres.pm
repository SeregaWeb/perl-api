package controller::controller_genres;
 use Data::Dumper;
 use JSON;
 use model::genres_model;


sub test {
    my $a = 'Controller genres test OK';
    return $a;
}


#получаем данные model отдаем JSON
sub all_genres
{
    my $c = model::genres_model->select_all_genres();
    return $c;
    #print "$c";
}

#get_autor_by_id
sub get_genre_by_id
{
    my ($h,$id) = @_;
    #print Dumper($id);
    my $c = model::genres_model->get_fields_from_tables_by_id($id);
    return $c;
    #print Dumper($c);
}


 
 1;