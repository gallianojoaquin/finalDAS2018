var jAdmin = {
		
		openModal:function(){
			alert('Entra');
			var obj = $(this);
			var fileName = $(this).data("file");
			$("#basicModal").data("fileName", fileName).modal("toggle", obj);
		},
				
		pruebaWS: function(){
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Prueba.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"habilitada":""}),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
			
			
			
		},
		
		guardarConfig: function(idConcesionaria, pagina) {

			var urlWS = $('#txtUrlWS_' + idConcesionaria).val();
	        var sufijoWS = $('#txtWS_' + idConcesionaria).val();
	        var estado = $('#selectStatus_' + idConcesionaria).val();
	        
			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/ConfigConcesionaria.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"id":idConcesionaria,"habilitada":estado,"url":urlWS,"sufijo":sufijoWS}),
	            error: function(hr){
            		jAdmin.aceptadas();	            	
	            },
	            success: function(html) {	  
            		jAdmin.aceptadas();
	            }
	        });
		},
		
		resumen: function() {

			jUtils.executing("divCentral");
	        jUtils.hiding("message");	       	        
	        
	        $.ajax({
	            url: "/admin/Resumen.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		pingConcesionaria: function(idConcesionaria){
			
			jUtils.executing('divPing_' + idConcesionaria);
			
			var urlWS = $('#txtUrlWS_' + idConcesionaria).val();
	        var tipoWS = $('#txtWS_' + idConcesionaria + " option:selected").text();
	        var estado = $('#selectStatus_' + idConcesionaria).val();
						
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Ping.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"idConcesionaria":idConcesionaria, "tipoWs":tipoWS, "urlWs": urlWS}),
	            error: function(hr){
	            	jUtils.showing('divPing_' + idConcesionaria, "<button type='button' class='btn btn-danger'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>");	            
	            },
	            success: function() {
	            	jUtils.showing('divPing_' + idConcesionaria, "<button type='button' class='btn btn-success'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button>");
	            }
	        });
		},
		
		aceptadas: function() {

			jUtils.executing("divCentral");
	        jUtils.hiding("message");	       	        
	        
	        $.ajax({
	            url: "/admin/Aceptadas.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"habilitada":"a"}),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},

		verParticipantesSorteo: function(idSorteo) {
			
			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/ParticipantesSorteos.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"idSorteo":idSorteo}),
	            error: function(hr){
	            	jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		detalleSorteos: function() {
			jUtils.hiding("participantesSorteo");
			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/DetalleSorteos.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	            	jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		obtenerFechas: function() {

			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Sorteos.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	            	jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		guardarSorteo : function() {
			
			var fechaSorteo = $( "#fechaSorteo" ).val();		
			if( fechaSorteo == '' ) {
				
				alert('Debe ingresar una fecha.');
				return;
			}
			var fechaToSave = fechaSorteo.substring(6,10) + "-" + fechaSorteo.substring(3,5) + "-" + fechaSorteo.substring(0,2)
	        jUtils.executing( "guardandoSorteo" );
	        $.ajax({
	            url: "/admin/CargarSorteo.do",
	            type: "post",
	            data: $.param({"fechaSorteo":fechaToSave}),
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("guardandoSorteo");
	                jUtils.showing("error", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.hiding("error");
	                jAdmin.cargarSorteos();
	            }
	        });
		},
		
		eliminarSorteo : function(idSorteo) {			
	        jUtils.executing( "eliminarSorteo_" +idSorteo );
	        $.ajax({
	            url: "/admin/EliminarSorteo.do",
	            type: "post",
	            data: $.param({"idSorteo":idSorteo}),
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("eliminarSorteo_" + idSorteo);
	                jUtils.showing("errorEliminar_" + idSorteo, hr.responseText);
	            },
	            success: function(html) {
	                jUtils.hiding("errorEliminar_" + idSorteo);
	                jAdmin.cargarSorteos();
	            }
	        });
		},
		
//		########################################################################################
		pendientes: function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Pendientes.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"habilitada":"p"}),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},		
		
		declinadas: function() {

			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Declinadas.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"habilitada":"d"}),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		aceptarConcesionaria: function(idConcesionaria, pagina) {

			var urlWS = $("txtUrlWS").val();
	        var sufijoWS = $("txtSufijoWS").val();
	        
			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/EstadoConcesionaria.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"id":idConcesionaria,"habilitada":"a","url":urlWS,"sufijo":sufijoWS}),
	            error: function(hr){
	            	if(pagina == "aceptadas")
	            		jAdmin.aceptadas();
	            	else if (pagina== "declinadas")
	            		jAdmin.declinadas();
	            	else
	            		jAdmin.pendientes();
	            },
	            success: function(html) {	    
	            	if(pagina == "aceptadas")
	            		jAdmin.aceptadas();
	            	else if (pagina== "declinadas")
	            		jAdmin.declinadas();
	            	else
	            		jAdmin.pendientes();
	            }
	        });
		},
		
		
		
		declinarConcesionaria: function(idConcesionaria, pagina) {

			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/EstadoConcesionaria.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"id":idConcesionaria,"habilitada":"d"}),
	            error: function(hr){
	            	if(pagina == "aceptadas")
	            		jAdmin.aceptadas();
	            	else if (pagina== "declinadas")
	            		jAdmin.declinadas();
	            	else
	            		jAdmin.pendientes();
	            },
	            success: function(html) {
	            	if(pagina == "aceptadas")
	            		jAdmin.aceptadas();
	            	else if (pagina== "declinadas")
	            		jAdmin.declinadas();
	            	else
	            		jAdmin.pendientes();
	            }
	        });
		},
		
		
		
		actualizarClientes: function() {

			jUtils.executing("divProcesando");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Clientes.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	            	jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		
		colapsar : function(id){
			if ($("#"+id).hasClass('a')){
				
				$("#"+id).removeClass('a');
				$("#"+id).slideUp();
				
		    }
			else{				
		    	$("#"+id).addClass('a');
		    	$("#"+id).slideDown();
		    }
		},

		updateSorteos : function(){
			$("input:text").each(function(){
				alert($(this).attr("id"));
			});
			
		},
		noticiaPal: function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/NoticiaPal.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateNoticiaPal: function() {
			var not = $("#idTextNoticiaPrincipal").val();
			var id = $("#idHiddenNoticiaPal").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateNoticiaPal.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"not":not,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		titulo : function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Titulo.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateTitulo : function() {
			var tit = $("#idTextTitulo").val();
			var id = $("#idHiddenTitulo").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateTitulo.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"tit":tit,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		proxSorteo : function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/ProxSorteo.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateProxSorteo : function() {
			var psort = $("#idTextProxSorteo").val();
			var id = $("#idHiddenProxSorteo").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateProxSorteo.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"psort":psort,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		avisos : function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Avisos.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateAvisos : function() {
			var avi = $("#idTextAviso").val();
			var id = $("#idHiddenAviso").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateAvisos.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"avi":avi,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		informacion : function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Informacion.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateInfo : function() {
			var inf = $("#idTextInformacion").val();
			var id = $("#idHiddenInformacion").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateInfo.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"inf":inf,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		novedades : function() {
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/Novedades.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		updateNovedad : function() {
			var nov = $("#idTextNovedades").val();
			var id = $("#idHiddenNovedades").val();
			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/UpdateNovedades.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"nov":nov,"id":id }),
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		},				
		
		cargarSorteos : function() {

	        jUtils.executing( "divCentral" );
	        $.ajax({
	            url: "/admin/Sorteos.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("error", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.hiding("error");	      
	                jUtils.showing("divCentral", html);
	            }
	        });
		},
		
		inicializarFechaSorteo : function( ultimaFechaSorteo ) {
			
			var proxFechaDisponible = new Date(ultimaFechaSorteo);
			
			proxFechaDisponible.setMonth( proxFechaDisponible.getMonth() + 1 );
			
			$( "#fechaSorteo" ).attr( "min", jAdmin.formatearFecha(proxFechaDisponible) );
		},
		
		formatearFecha : function (date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [year, month, day].join('-');
		},
		
		listarClientes :function(){

			jUtils.executing("divCentral");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/admin/ListaClientes.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("divCentral");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	                jUtils.showing("divCentral", html);
	            }
	        });
		}
}