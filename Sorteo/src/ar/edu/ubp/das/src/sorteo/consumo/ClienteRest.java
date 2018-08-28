package ar.edu.ubp.das.src.sorteo.consumo;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import ar.edu.ubp.das.src.sorteo.utils.BundleManager;

public class ClienteRest implements ClienteServicio {

	@Override
	public String consumir(String url, String funcion, String fechaSorteo) {
		
		System.out.println("#\t -- Consumiendo WS REST ");
		
		URI uri = URI.create(url+funcion);            
        
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		
		nvps.add(new BasicNameValuePair(BundleManager.getBundle().getString("identifyParameterName"),
									    BundleManager.getBundle().getString("identifyParameterValue")));
		nvps.add(new BasicNameValuePair("fechaSorteo", fechaSorteo));
		HttpPost req = new HttpPost();
        
		req.setURI(uri);
        
		try {
			req.setEntity(new UrlEncodedFormEntity(nvps));
		}
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
		HttpClient client = HttpClientBuilder.create().build();
    		            
        HttpResponse resp = null;
		try {
			resp = client.execute(req);
		}
		catch (ClientProtocolException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
        
        HttpEntity responseEntity = resp.getEntity();
        StatusLine responseStatus = resp.getStatusLine();

        String restResp = null;
		try {
			restResp = EntityUtils.toString(responseEntity);
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}	

        if(responseStatus.getStatusCode() != 200) {

        	throw new RuntimeException("Failed to create service.");
        }
        
        return restResp;
	}
	
	@Override
	public String notificarGanador(String url, String nombre, String apellido, String idCliente, String idSorteo, String idConcesionaria) {

		System.out.println("#\t -- WS REST");
		
		URI uri = URI.create(url+"ganador");            
        
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		
		nvps.add(new BasicNameValuePair("nombre", nombre));
		nvps.add(new BasicNameValuePair("apellido", apellido));
		nvps.add(new BasicNameValuePair("concesionaria", idConcesionaria));
		nvps.add(new BasicNameValuePair("idCliente", idCliente));
		nvps.add(new BasicNameValuePair("idSorteo", idSorteo));
		
		HttpPost req = new HttpPost();
        
		req.setURI(uri);
        
		try {
			req.setEntity(new UrlEncodedFormEntity(nvps));
		}
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
		HttpClient client = HttpClientBuilder.create().build();
    		            
        HttpResponse resp = null;
		try {
			resp = client.execute(req);
		}
		catch (ClientProtocolException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
        
        HttpEntity responseEntity = resp.getEntity();
        StatusLine responseStatus = resp.getStatusLine();

        String restResp = null;
		try {
			restResp = EntityUtils.toString(responseEntity);
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}	

        if(responseStatus.getStatusCode() != 200) {

        	throw new RuntimeException("Failed to create service.");
        }
        
        return restResp;
	}
	
}
