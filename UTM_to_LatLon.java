package Midterm;


public class UTM_to_LatLon {
	public static double[] main(String[] argv) {
		String[] utm = argv; // input: ZONE NORTHING EASTING
		
		CoordinateConversion coorConvert = new CoordinateConversion();

		double[] latlong = coorConvert.utm2LatLon(utm.toString());
		
		return latlong;
	}


}
