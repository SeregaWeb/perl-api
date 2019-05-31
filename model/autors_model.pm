package model::autors_model;
use Data::Dumper;
use controller::controller_books;
use controller::controller_autors;
use controller::controller_genres;
use utilities::database;
use JSON;


sub test {
    my $a = 'Model test OK';
    return $a;
}


sub fix_json
{
    my ($h,$data) = @_;
    $data =~ s/\[/\{/gx;
    $data =~ s/\]/\}/gx;
    $data =~ s/\\//gx;
    $data =~ s/\"\{/\{/gx; #fix "{
    $data =~ s/\}\"/\}/gx; #fix
    #print Dumper($data);
    return $data;
}

# получаем автора по ID
sub get_autors_books
{
    my ($h,$id) = @_;
    my $db = utilities::database->connect();
    my @fields_what = ($id);
    my @res = $db->select($id);
    my $sb_json = encode_json(\@res);
    return $sb_json;
}


# получаем автора по ID
sub get_autor
{
    my ($h,$id) = @_;
    my $db = utilities::database->connect();
    $db->set_table('autors');
    # конвертируем в JSON
    my @res = $db->select_query($id);
    my $sb_json = encode_json(\@res);
    #$sb_json =~ s/\[/\{/gx;
    #$sb_json =~ s/\]/\}/gx;
    #$sb_json =~ s/\\//gx;
    #$sb_json =~ s/\"\{/\{/gx; #fix "{
    #$sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}
# получаем все авторы из DB
sub select_all_autors
{
    my $db = utilities::database->connect();
    $db->set_table('autors');
    # конвертируем в JSON
    my @res = $db->select_query();
    my $sb_json = encode_json(\@res);
    #$sb_json =~ s/\[/\{/gx;
    #$sb_json =~ s/\]/\}/gx;
    #$sb_json =~ s/\\//gx;
    #$sb_json =~ s/\"\{/\{/gx; #fix "{
    #$sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}


 1;