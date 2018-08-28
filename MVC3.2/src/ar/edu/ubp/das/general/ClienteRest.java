package ar.edu.ubp.das.general;

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


public class ClienteRest implements ClienteServicio {

	@Override
	public String consumir(String url, String funcion) {
		// TODO Auto-generated method stub
		
		System.out.println("\n\t>> Consumiendo REST");
		
		URI uri = URI.create(url+funcion);            
        
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		
		nvps.add(new BasicNameValuePair(BundleManager.getBundle().getString("identifyParameterName"),
									    BundleManager.getBundle().getString("identifyParameterValue")));
		
		HttpPost req = new HttpPost();
        
		req.setURI(uri);
        
		try {
			req.setEntity(new UrlEncodedFormEntity(nvps));
		}
		catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		HttpClient client = HttpClientBuilder.create().build();
    		            
        HttpResponse resp = null;
		try {
			resp = client.execute(req);
		}
		catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        HttpEntity responseEntity = resp.getEntity();
        StatusLine responseStatus = resp.getStatusLine();

        String restResp = null;
		try {
			restResp = EntityUtils.toString(responseEntity);
		}
		catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

        if(responseStatus.getStatusCode() != 200) {

        	throw new RuntimeException("Failed to create service.");
        }
        
        return restResp;
	}
}
