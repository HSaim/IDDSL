/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Prevent space in a textbox
function nospaces(t){

    if(t.value.match(/\s/g) ){

        t.value=t.value.replace(/\s/g,'');
       // $("t.#divCheckSpace").html("Space not allowed!");
        //$("t.#divCheckSpace").css("color","red");
        $(t).popover({
              title: 'Warning!',
              content: 'Space not allowed',
              placement: 'bottom'
          }).popover('toggle');
        /*switch(t.id) {
            case 'firstname':
              $("#firstnameCheckSpace").html("Space not allowed!"); 
              $("#firstnameCheckSpace").css("color","red");
            case 'lastname':
                $("#lastnameCheckSpace").html("Space not allowed!"); 
                $("#lastnameCheckSpace").css("color","red");
            default:
              $("firstnameCheckSpace").html("");
        }*/
    }
    else{
         $(t).popover('destroy');
    }


}


//No warning
function nowarning(){
     $("firstnameCheckSpace").html("");
     $("lastnameCheckSpace").html("");
}
