package controller::controller_autors;
use Data::Dumper;
use JSON;
use model::books_model;

sub test {
    my $a = 'Controller autors test OK';
    return $a;
}

#получаем данные model отдаем JSON
sub all_autors
{
    my $c = model::books_model->select_all_autors();
    return $c;
    #print "$c";
}

#get_autor_by_id
sub get_autor_by_id
{
    my ($h,$id) = @_;
    #print Dumper($id);
    my $c = model::books_model->get_autor($id);
    return $c;
    #print "$c";
}


 
 1;