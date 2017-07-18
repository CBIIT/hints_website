$(document).ready(function(){
    
    $('#menu-datasets').selectmenu({
       width: 135,
         change: function( event, data ) {
           
        }
    }).selectmenu( "open" );
    
    
    $('#menu-method').selectmenu({
       width: 160,
         change: function( event, data ) {
           
        }
    });
        
    $('#menu-format').selectmenu({
        width: 115,
         change: function( event, data ) {
           
        }
    });
    
    $('#menu-chartType').selectmenu({
        width: 120,
         change: function( event, data ) {
           
        }
    });
    
    $('#menu-group').selectmenu({
        width: 134,
         change: function( event, data ) {
           
        }
    });
    
    $('#menu-file').selectmenu({
        width: 105,
         change: function( event, data ) {
           
        }
    });
    

        
        
    
    function tableColumnCount(){
        var i = $("table.survey thead td").length;
        i = 84/i;
        
        $("table.survey tr:first-child td").css("width", i+"%");
    }
    
    tableColumnCount();
});
