JQueryDOM 
==============================================
      
      Document Object Model

      Java Script : innerHTML, value

      JQuery : html(), text(), css(), attr(), prop()

          setter 
          css("background-color", "#ff0000")
          css({	
            "background-color":"#ff0000",
            "border":"3px solid"		});

          getter
          let v = $("#id").css("background-color");

          setter -> $(id, name, class, tag).val(값) <- input
                $(id, name, class, tag).css("특성명","값") <- 일반

          getter -> $(id, name, class, tag).val()
                $(id, name, class, tag).css( "특성명" )
  
  ------------------------------------
  attr() , prop()
  ------------------------------------
  *  attr() : HTML 의 속성(attribute)을 취급
  *  prop() : JavaScript의 프로퍼티(property)를 취급 


      <input type="checkbox" name="" id="chk" checked="checked">

      var $checkbox = $('#chk'); 

      console.log($checkbox.attr('checked')); // checked 

      console.log($checkbox.prop('checked')); // true



  
