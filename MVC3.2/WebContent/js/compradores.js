var jCompradores = {
		
		datosPersonales: function() {
			jUtils.executing("idDivDatosPersonales");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/compradores/DatosPersonales.do",
	            type: "post",
	            dataType: "html",
	            //data: $.param({"tipoDoc":"DNI","documento":"35894335"}),
	            error: function(hr){
	                jUtils.hiding("idDivDatosPersonales");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("idDivDatosPersonales", html);
	            }
	        });
		},

		detallePlan: function() {
		
			jUtils.executing("idDivDatosPersonales");
		    jUtils.hiding("message");
		    	$.ajax({
			        url: "/compradores/DetallePlan.do",
			        type: "post",
			        dataType: "html",
			        error: function(hr){
			            jUtils.hiding("idDivDatosPersonales");
			            jUtils.showing("message", hr.responseText);
			        },
			        success: function(html) {
			            jUtils.showing("idDivDatosPersonales", html);
			        }
		    	});
			},
		
		updateComprador: function() {
			var nom = $("#exampleInputNombre").val();
		    var ape = $("#exampleInputApellido").val(); 
		    var tdoc = $("#exampleInputTipoDoc").val();
		    var doc = $("#exampleInputDocumento").val();
		    var sexo = $("#exampleInputSexo").val();
		    var cucu = $("#exampleInputCuitCuil").val();
		    var ema = $("#exampleInputEmail").val();
		    var tel = $("#exampleInputTelefono").val();
		    var tmov = $("#exampleInputTelefonoMov").val();
		    var pais = $("#exampleInputPais").val();
		    var prov = $("#exampleInputProvincia").val();
		    var cpos = $("#exampleInputCodPostal").val();
		    var bar = $("#exampleInputBarrio").val();
		    var calle = $("#exampleInputCalle").val();
		    var ncall = $("#exampleInputNumCalle").val();
		    var ntorr = $("#exampleInputNumTorre").val();
		    var npiso = $("#exampleInputNumPiso").val();
		    var dpto = $("#exampleInputDpto").val();
		    
			jUtils.executing("idDivDatosPersonales");
		    jUtils.hiding("message");

		    	$.ajax({
			        url: "/compradores/UpdateDatos.do",
			        type: "post",
			        dataType: "html",
			        data: $.param({"tdoc":tdoc,"doc":doc,"nom":nom,"ape":ape,"sexo":sexo
			        				,"cucu":cucu,"ema":ema,"tel":tel,"tmov":tmov,"pais":pais,"prov":prov,"cpos":cpos
			        				,"bar":bar,"calle":calle,"ncall":ncall,"ntorr":ntorr,"npiso":npiso,"dpto":dpto}),
			        error: function(hr){
			            jUtils.hiding("idDivDatosPersonales");
			            jUtils.showing("message", hr.responseText);
			        },
			        success: function(html) {
			        	
			           jUtils.showing("idDivDatosPersonales", html);
			           jCompradores.datosPersonales();
			        }
		    	});
			}
}