package ar.edu.ubp.das.src.sorteo.utils;

import java.util.ResourceBundle;

public class BundleManager {

	private static ResourceBundle bundle = ResourceBundle.getBundle("data");
	
	public BundleManager() {
		
	}

	public static ResourceBundle getBundle() {
		return bundle;
	}

	public static void setBundle(ResourceBundle bundle) {
		BundleManager.bundle = bundle;
	}
}
