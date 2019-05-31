package model::genres_model;
use Data::Dumper;
use controller::controller_books;
use controller::controller_autors;
use controller::controller_genres;
use utilities::database;
use JSON;
use Scalar::Util qw(looks_like_number);

sub test {
    my $a = 'Model test OK';
    return $a;
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
    #$sb_json =~ s/\[/\{/gx;
    #$sb_json =~ s/\]/\}/gx;
    #$sb_json =~ s/\\//gx;
    #$sb_json =~ s/\"\{/\{/gx; #fix "{
    #$sb_json =~ s/\}\"/\}/gx; #fix
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
    #$sb_json =~ s/\[/\{/gx;
    #$sb_json =~ s/\]/\}/gx;
    #$sb_json =~ s/\\//gx;
    #$sb_json =~ s/\"\{/\{/gx; #fix "{
    #$sb_json =~ s/\}\"/\}/gx; #fix
    # отдаем строку
    return $sb_json;
}


# получить все поля из двух таблиц (test mode)
sub get_fields_from_tables_by_id
{
    my ($h,$id,@fields,@tables,$where) = @_;
    my $db = utilities::database->connect();
    #хардкодим поля и таблицы
    my @fields = ('books.id','books.name','description','picture');
    my @tables = ('books','books_genres','genres');
    #хардкодим условие

    #формируем запрос
    my $f = join(",", @fields);
    my $t = join(",", @tables);
    my $querystring = "SELECT $f FROM $t ";

    my $w;
    # если прилетел id число 
    if (looks_like_number($id))
            {
                unless ( $id ) {
                    # если он пустой
                } else {
                    # если id не пустой формируем условие
                $w = (' WHERE books.id=books_genres.id_book AND genres.id=books_genres.id_genre AND  id_genre='.$id);
                }
            }
    $querystring .= $w;
    #print "MODEL\n ---- \n";

    # конвертируем в JSON
    my @res = $db->select($querystring);
    my $sb_json = encode_json(\@res);

    # отдаем строку
    return $sb_json;
}


 1;