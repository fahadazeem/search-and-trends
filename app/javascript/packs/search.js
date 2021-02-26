console.log('searching...')
import $ from 'jquery'

$(document).ready(function () {

    const search_element = $('#search')

    search_element.on('input',function(){

        const typed_query = $(this).val();

        if(typed_query.length > 1 && typed_query.endsWith(' ')){
            console.log(typed_query)
            $.ajax({
                type: "GET",
                url: "/articles.json",
                data: {query: typed_query},
                dataType: "JSON",
                success: function (response) {
                    if (response['data'].length > 0){
                        $('#searchOptions').html('')

                        $.each(response['data'], function (i, value) {
                            $('#searchOptions').append('<option data-remote="true">' + value.title + '</option>');
                        });
                    }
                    console.log(response)
                }
            });
        }
    });

    search_element.on('change', function (){
        window.location.href = "/articles?query=" + $(this).val()
    });
});

