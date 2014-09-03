/* 
 * zcms-utils.js
 * 
 * This file will contain the JavaScript that handles all ajax and modal requests as well as any other basic 
 * functions that are needed.
 * 
 */

$(document).ready(function(){
    
    var ajax_url = $(location).attr('href').split('backend/')[0] + 'backend/ajax/';
    var data;
    var zcms_actions = {
        
        zcms_del_file_conf : function(){
            
            var modal = '<div id="del-file-conf" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> \
                            <div class="modal-header"> \
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> \
                                    <h3 id="myModalLabel">Warning</h3> \
                            </div>\
                            <div class="modal-body"> \
                            ' + data.conf + '\
                            </div>\
                            <div class="modal-footer"> \
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button> \
                                <button class="btn btn-danger zcms-action zcms-del-file"';
            
            $.each(data,function(index,value){
                if(index != 'conf')
                    modal += ' data-' + index + '="' + value + '"';
            });                             
             
            modal += '><i class="icon-trash icon-white"></i>Delete</button> \
                            </div>\
                         </div>';
            
            $('body').append(modal);
            $('#del-file-conf').modal('show');
        },
        
        zcms_del_file : function() {
    
            $('#del-file-conf').modal('hide');
            $('#del-file-conf').remove();
            
            $.ajax(ajax_url + 'delete_file',{
                data : data,
                dataType : 'json',
                success : function(data){
                    if(data.ok === 1)
                    {
                        $('#zcms-file-' + data.file).remove();
                    }
                }
            });
        }
    };
    
    $(document).on('click','.zcms-action', function(e){
        
        e.preventDefault();
        var classes = $(this).attr('class').split(' ');
        data = $(this).data();
        
        $.each(classes,function(index, value){
            
            var method = value.replace(/-/g, '_');
            if(zcms_actions[method])
                return zcms_actions[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        });
    });
    
});