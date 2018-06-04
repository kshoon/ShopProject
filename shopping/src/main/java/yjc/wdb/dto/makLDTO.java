package yjc.wdb.dto;

public class makLDTO {
//	function deg2rad(deg) {
//        return deg * (Math.PI/180)
//    }
//
//  var R = 6371; // Radius of the earth in km
//    var dLat = deg2rad(whido-mylat);  // deg2rad below
//    var dLon = deg2rad(gyungdo-mylon);
//    var a = Math.sin(dLat/2)*Math.sin(dLat/2)+Math.cos(deg2rad(mylat))*Math.cos(deg2rad(whido))*Math.sin(dLon/2)*Math.sin(dLon/2);
//    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
//    var d = R * c; // Distance in km    
    public double distance(double lat1, double lon1, double lat2, double lon2) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
         dist = dist * 1609.344; //미터로 변환
 
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }


}
