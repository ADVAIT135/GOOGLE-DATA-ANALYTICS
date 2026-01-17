ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="City Hotel" & 
                                  hotel_bookings$market_segment=="Online TA"))
View(onlineta_city_hotels)

onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")
View(onlineta_city_hotels_v2)

ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children))
