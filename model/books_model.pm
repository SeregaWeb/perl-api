package model::books_model;
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




# получаем все книги из DB
sub select_all_books
{
    my $db = utilities::database->connect();
    $db->set_table('books');
    # конвертируем в JSON
    my @res = $db->select_query();
    #print Dumper(@res);
    
    # $sb_json =~ s/\[/\{/gx;
    # $sb_json =~ s/\]/\}/gx;
    # $sb_json =~ s/\\//gx;
    # $sb_json =~ s/\"\{/\{/gx; #fix "{
    # $sb_json =~ s/\}\"/\}/gx; #fix
    #$sb_json =~ s/\[/\{\"obj\":/x; #fix
    #$sb_json =~ s/\}\"/\}/gx; #fix
    #my $a = fix_json($sb_json);
    # отдаем строку
    return encode_json(\@res);
}
# получаем книгу по ID из DB
sub get_book
{
    my ($h,$id) = @_;
    my $db = utilities::database->connect();
    $db->set_table('books');
    #конвертируем в JSON
    my @res = $db->select_query($id);
    my $sb_json = encode_json(\@res);
    $sb_json =~ s/\[/\{/gx;
    $sb_json =~ s/\]/\}/gx;
    $sb_json =~ s/\\//gx;
    $sb_json =~ s/\"\{/\{/gx; #fix "{
    $sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
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
    $sb_json =~ s/\[/\{/gx;
    $sb_json =~ s/\]/\}/gx;
    $sb_json =~ s/\\//gx;
    $sb_json =~ s/\"\{/\{/gx; #fix "{
    $sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}
# получаем жанр по ID
sub get_genre
{
    my ($h,$id) = @_;
    my $db = utilities::database->connect();
    $db->set_table('genres');
    # конвертируем в JSON
    my @res = $db->select_query($id);
    my $sb_json = encode_json(\@res);
    $sb_json =~ s/\[/\{/gx;
    $sb_json =~ s/\]/\}/gx;
    $sb_json =~ s/\\//gx;
    $sb_json =~ s/\"\{/\{/gx; #fix "{
    $sb_json =~ s/\}\"/\}/gx; #fix
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
    $sb_json =~ s/\[/\{/gx;
    $sb_json =~ s/\]/\}/gx;
    $sb_json =~ s/\\//gx;
    $sb_json =~ s/\"\{/\{/gx; #fix "{
    $sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}

# получаем все жанры из DB
sub select_all_genres
{
    my $db = utilities::database->connect();
    $db->set_table('genres');
    # конвертируем в JSON
    my @res = $db->select_query();
    my $sb_json = encode_json(\@res);
    $sb_json =~ s/\[/\{/gx;
    $sb_json =~ s/\]/\}/gx;
    $sb_json =~ s/\\//gx;
    $sb_json =~ s/\"\{/\{/gx; #fix "{
    $sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}

 1;