package utilities::database;
 use DBI;
 use Data::Dumper;
 use JSON;
use Scalar::Util qw(looks_like_number);

    $myConnection;
    $table_name;
    $where;
    $field;

     #$table_name = 'tableA';
            sub test {
                $a = 'Test DB OK';
                return $a;
            }

            ##############  выбор таблицы
            sub set_table 
            {
                my ($dbh,$vares) = @_;
                my ($dbh) = $myConnection;
                $table_name = $vares;
                #print $vares;
            }

            ##############  условие WHERE 
            sub set_where 
            {
                my ($dbh,$vares) = @_;
                my ($dbh) = $myConnection;
                $where = $vares;
                #print $where;
            }

            ##############  выбор поля 
            sub set_field 
            {
                my ($dbh,$vares) = @_;
                my ($dbh) = $myConnection;
                $field = $vares;
                #print $field;
            }
        
     sub connect
     {
         my $class = ref($_[0])|| $_[0];
          my $this ||= {};
          $myConnection = DBI->connect("dbi:mysql:database=user7;host    =127.0.0.1;","user7","user7");
          return bless($this, $class);
      }
 
      sub DESTROY 
      {
          $myConnection->disconnect();
          # $myConnection->do("SELECT * FROM $table_name");
          # printf $myConnection;
      }
 
      sub select_query
      {
          my ($h,$id) = @_;
          print $id;
          my @dept;
          my ($dbh) = $myConnection;
          my $sql = "SELECT *
                      FROM $table_name";
        
            if (looks_like_number($id))
            {
                print 'NUL';
            }
          my $sth = $dbh->prepare($sql);
          $sth->execute();

            while (@result = $sth->fetchrow_array()) {
                my $j=encode_json(\@result);
                push @dept,$j;
                #push %ages,@result;
                #print Dumper(%ages);
            }
          $sth->finish();
            
          return @dept;
      }

      sub update_query
      {
          my ($dbh) = $myConnection;
 
          my $sql = "UPDATE $table_name
                  SET name = ?
              WHERE id = ?";
 
          my $sth = $dbh->prepare($sql);
          $sth->execute();
      }



  
    1;