$( document ).ready(function() {

    getAll();
    getAuthors();
    getGenres();

    $(document).on('click','.js-button-submit', function(){
        let id = $(this).attr('data-id');
        console.log(id);
        getOne(id);
    })

    $(document).on('click','.js-author', function(){
        let id = $(this).attr('data-author');
        console.log(id);
        getOneAuthor(id);
    })

    $(document).on('click','.js-genre', function(){
        let id = $(this).attr('data-genre');
        console.log(id);
        getOneGenre(id);
    })

});
var template404 = "<h1 class='not-found'><span>404</span> book not found</div>";
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
        $('.print-res').html('');
        $('.js-title').text('all book');
            $.get( "router/router.cgi", { controller: "books", method: "all" }, function( data ) {
                let myArr = parceStringInArray(data);
                console.log(data);
                for (var i = 0 ; i < myArr.length; i++){
                        var template = "<div class='card'>"+
                            "<img class='card-img' src='"+myArr[i][3]+"' alt='"+myArr[i][1]+"'>"+
                            "<p class='card-desk'>"+myArr[i][1]+"</p>"+
                            "<button class='card-btn js-button-submit' data-id='"+myArr[i][0]+"'>show</button>"
                        "</div>"; 
                    $('.print-res').append(template);
                }
            });
        }
        function getOne(id){
            $('.print-res').html('');
            $('.js-title').text('one book');
            $.get( "router/router.cgi", { controller: "books", method: "one" , index: id }, function( data ) {
                let myArr = parceStringInArray(data);
                if(myArr.length == 0){
                    $('.print-res').append(template404); 
                }else{
                for (var i = 0 ; i < myArr.length; i++){    
                    var template = "<div class='card one'>"+
                        "<img class='card-img' src='"+myArr[i][3]+"' alt='"+myArr[i][1]+"'>"+
                        "<div>"+
                        "<p class='card-desk'>"+myArr[i][1]+"</p>"+
                        "<p class='card-text'>"+myArr[i][2]+"</p>"+
                        "</div>"+
                        "</div>"; 
                    $('.print-res').append(template);
                }
            }
            });
        }
        function getAuthors(){
            $('.js-authors').html('');
        $.get( "router/router.cgi", { controller: "authors", method: "all" }, function( data ) {
            let myArr = parceStringInArray(data);
        
        for (var i = 0 ; i < myArr.length; i++){
            var template = "<li class='js-author btn' data-author='"+ myArr[i][0]+"'>"+ myArr[i][1]+"</li>"
            $('.js-authors').append(template);
        }
        });
        }
        function getGenres(){
            $('.js-genres').html('');
        $.get( "router/router.cgi", { controller: "genres", method: "all" }, function( data ) {
            let myArr = parceStringInArray(data);
            for (var i = 0 ; i < myArr.length; i++){
                var template = "<li class='js-genre btn' data-genre='"+ myArr[i][0]+"'>"+ myArr[i][1]+"</li>"
                $('.js-genres').append(template);
            }
        });
        }
        function getOneAuthor(id)
        {
            $('.print-res').html('');
            $('.js-title').text('one author');
            $.get( "router/router.cgi", { controller: "authors", method: "one", index: id }, function( data ) {
                let myArr = parceStringInArray(data);
                if(myArr.length == 0){
                    $('.print-res').append(template404); 
                }else{
                for (var i = 0 ; i < myArr.length; i++){
                    var template = "<div class='card'>"+
                        "<img class='card-img' src='"+myArr[i][3]+"' alt='"+myArr[i][1]+"'>"+
                        "<p class='card-desk'>"+myArr[i][1]+"</p>"+
                        "<button class='card-btn js-button-submit' data-id='"+myArr[i][0]+"'>show</button>"
                    "</div>"; 
                $('.print-res').append(template);
                }
            }

        });
        }
        function getOneGenre(id)
        {
            $('.print-res').html('');
            $('.js-title').text('one genre');
            $.get( "router/router.cgi", { controller: "genres", method: "one", index: id }, function( data ) {
            let myArr = parceStringInArray(data);
            if(myArr.length == 0){
                $('.print-res').append(template404); 
            }else{
            for (var i = 0 ; i < myArr.length; i++){
                var template = "<div class='card'>"+
                    "<img class='card-img' src='"+myArr[i][3]+"' alt='"+myArr[i][1]+"'>"+
                    "<p class='card-desk'>"+myArr[i][1]+"</p>"+
                    "<button class='card-btn js-button-submit' data-id='"+myArr[i][0]+"'>show</button>"
                "</div>"; 
            $('.print-res').append(template);
            }
            }
        });
        }