$(document).ready(function(){
    $(document).on('click','.zcms-ajax', function(e){
        e.preventDefault();
        $.ajax({
           url : $(this).attr('href'),
           data : $(this).data(),
           type : 'POST',
           success : function(data){
               data = $.parseJSON(data);
               $('#zcms-ajax-modal').html(data.html);
               $('#zcms-ajax-modal').modal('show');
           }
        });
    });
    
    $(document).on('submit','.zcms-ajax-form', function(e){
        e.preventDefault();
        var post = $(this).serialize();
        var url = $(this).attr('action');
        
        $.ajax({
           url : url,
           data : post,
           type : 'POST',
           success : function(data){
               data = $.parseJSON(data);
               $('#zcms-ajax-modal').html(data.html);
           }
        });
    });
    
    $(document).on('click','.zcms-ajax-refresh', function(e){
        e.preventDefault();
        location.reload();
    });
});

