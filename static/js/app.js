$( document ).ready(function() {

    $.get( "router/router.cgi", { controller: "books", method: "all" }, function( data ) {
        let myArr = parceStringInArray(data);
        
        for (var i = 0 ; i < myArr.length; i++){
                var template = "<div class='card'>"+
                    "<img class='card-img' src='"+myArr[i][3]+"' alt='"+myArr[i][1]+"'>"+
                    "<p class='card-desk'>"+myArr[i][1]+"</p>"+
                    "<p class='card-text'>"+myArr[i][2]+"</p>"+
                    "<button class='card-btn' data-id='"+myArr[i][0]+"'>show</button>"
                "</div>"; 
            $('.print-res').append(template);
        }
    });
    });

    function parceStringInArray(data){
        var arr = [];
        for (var i = 0 ; i < data.length; i++){
            console.log(data[i]);
            string = data[i].replace(/["[]/g, '');
            string = string.slice(0, -1);
            string = string.split(',');
            arr.push(string);
        }
        return arr;
    }

    function getAll(){
            // $('.print-res').html('');
            $.get( "router/router.cgi", { controller: "books", method: "all" }, function( data ) {
            // $('.print-res').html( data );
            console.log(JSON.parse(data));
            alert( "Load was performed." );
            });
        }
        function getOne(id){
            $.get( "router/router.cgi", { controller: "books", method: "one" , index: id }, function( data ) {
            $( ".print-res" ).html( data );console.log(id);
            alert( "Load was performed." );
            });
        }
        function getAuthors(){
           
        $.get( "router/router.cgi", { controller: "authors", method: "all" }, function( data ) {
            let myArr = parceStringInArray(data);
        
        for (var i = 0 ; i < myArr.length; i++){
            var template = "<li data-author='"+ myArr[i][0]+"'>"+ myArr[i][1]+"</li>"
            $('.js-authors').append(template);
        }
        });
        }
        function getGenres(){
           
        $.get( "router/router.cgi", { controller: "genres", method: "all" }, function( data ) {
            let myArr = parceStringInArray(data);
            for (var i = 0 ; i < myArr.length; i++){
                var template = "<li data-genre='"+ myArr[i][0]+"'>"+ myArr[i][1]+"</li>"
                $('.js-genres').append(template);
        }});
        }
        function getOneAuthor(id)
        {
            $('.print-res').html('');
            $.get( "router/router.cgi", { controller: "authors", method: "one", index: id }, function( data ) {
            $( ".print-res" ).html( data );
            alert( "Load was performed." );
        });
        }
        function getOneGenre(id)
        {
            $('.print-res').html('');
            $.get( "router/router.cgi", { controller: "genres", method: "one", index: id }, function( data ) {
            $( ".print-res" ).html( data );
            alert( "Load was performed." );
        });
        }