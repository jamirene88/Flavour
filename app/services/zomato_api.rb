require 'httparty'

ZOMATO_KEY = "4a5c28544b40b024523586c5424409a5"
URL = "https://developers.zomato.com/api/v2.1/"

class ZomatoApi

  # get city_id from location api
  def check_location(user_city, user_country)
    search = "locations?query=#{user_city} #{user_country}&count=10"
    headers = { user_key: ZOMATO_KEY }


    response = HTTParty.get(URL+search, headers: headers)

    country_match = response["location_suggestions"].select {|country| country["country_name"] == user_country }

    city_match = country_match["location_suggestions"].select { |city| city["city_name"] == user_city}

    data = city_match[0]

    entity_type = data["entity_type"]

    entity_id = data["entity_id"]

  end

# get restaurnats listed nearby and parse top rated restaurant
  def get_top_restaurant(entity_id, entity_type)
    search = "location_details?entity_id=#{entity_id}&entity_type=#{entity_type}"
    headers = { user_key: ZOMATO_KEY }

    response = HTTParty.get(URL+search, headers: headers)

    top_rated_restaurant = response["best_rated_restaurant"][0]

    restaurant_keys = [{ name: top_rated_restaurant["restaurant"]["name"]},
          { address: top_rated_restaurant["restaurant"]["location"]["address"]},
          { latitude: top_rated_restaurant["restaurant"]["location"]["latitude"]},
          { longitude: top_rated_restaurant["restaurant"]["location"]["longitude"]},
          { avg_price: top_rated_restaurant["restaurant"]["average_cost_for_two"]},
          { website: top_rated_restaurant["restaurant"]["url"]},
          { currency: top_rated_restaurant["restaurant"]["currency"]},
          { zomato_restaurant_id: top_rated_restaurant["restaurant"]["R"]["res_id"]}]

  end
end
