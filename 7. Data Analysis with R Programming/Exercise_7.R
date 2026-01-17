colnames(hotel_bookings)


ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=market_segment))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)


ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment)


ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type)

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment)



ggplot(data = hotel_bookings) +   
  geom_bar(mapping = aes(x = distribution_channel)) +   
  facet_wrap(~deposit_type)
