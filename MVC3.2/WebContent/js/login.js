 $(document).ready(function () {
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    }); 
    
    $('.pass-reset-submit').click(function(event) {
      $(".pr-wrap").removeClass("show-pass-reset");
    }); 
});
var jLogin= {
		 
		 validar : function(){		
			 
				jUtils.hiding("message",true);
				
				var lang = $("#lang").val();
				var vUrl = "";
				var user = $("#txtUsuario").val();
				var pass = $("#txtPassword").val();
				
				if (user === undefined || user == "") 
				{
					alert("user");
					$("#txtUsuario").focus();
					return;
				}

				if (pass === undefined || pass == "") 
				{
					alert("pass");
					$("#txtPassword").focus();
					return;
				}		
				
				jUtils.executing("cargando");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/admin/Validar.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"tipoUsuario":"admin","tipoDoc":"","usuario":user,"password":pass}), 
		            error: function(hr){
		            	jUtils.showing("error",hr.responseText);
		            },
		            success: function(html) {
		            	if(isNaN($("#txtUsuario").val())){
		            		window.location = "/admin/Dashboard.do?lang="+lang; 
							return false;	
						}
		            	else{
		            		window.location = "/admin/Compradores.do?lang="+lang;
							return false;
		            	}
		            }
		        });
			}
 }