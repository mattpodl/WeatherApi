package domain;

import java.io.IOException;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import org.codehaus.jackson.map.ObjectMapper;

public class OpenWeatherMap {

	private static final String API_CODE = "4b2bf8448ddd7d21e028b182c1108c98";

    public CurrentWeather getActualWeather(String city) throws IOException{
        ClientConfig clientConfig = new DefaultClientConfig();
        Client client = Client.create(clientConfig);
        WebResource webResource = client.resource("http://api.openweathermap.org/data/2.5/weather?id="+city+"&units=metric"+"&APPID="+API_CODE);

        String response = webResource.get(String.class);

        ObjectMapper mapper = new ObjectMapper();
        CurrentWeather weather = mapper.readValue(response, CurrentWeather.class);
        return weather;
    }


}
