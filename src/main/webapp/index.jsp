<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domain.OpenWeatherMap" %>
<%@ page import="domain.CurrentWeather" %>
<%@ page import="domain.Clouds" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <body>
  <jsp:useBean id="OpenWeatherMap" class="domain.OpenWeatherMap" scope="application" />
        <%
        final String cityIds[] = {"3099434", "756135", "3094802", "3081368", "706075", "3093133", "3096472"};

        	List<domain.CurrentWeather> cityList = new ArrayList<domain.CurrentWeather>();
        	for (String city : cityIds) { cityList.add(OpenWeatherMap.getActualWeather(city));}
		for (domain.CurrentWeather city : cityList){
			%>
			<b><%= city.getName() %></b><br/>

			Zachmurzenie <%= city.getClouds().getAll() +" %" %> <br/>
			Temperatura: <%= city.getMain().getTemp()+" ºC" %><br/>
			Ciśnienie: <%= city.getMain().getPressure() +" hPa" %><br/>
			Prędkosć wiatru:<%= city.getWind().getSpeed() +" m/s" %><br/><br/><br/>
			<%
		}

        %>

    </body>
</html>