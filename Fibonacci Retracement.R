buonngay = tail(mutate(select(tq_get("MRNA", get = "stock.prices", from = begin, to = end),
                              3:6), id = row_number())[,c(5,1,2,3,4)],
                n=356);
FR100 = 178.5
FR0 = 65.49
# buonngay$FR1618 <- FR100 - (FR100 - FR0) * 1.618;
buonngay$FR0 <- FR100;
buonngay$FR24 <- FR100 - (FR100 - FR0) * 0.236;
buonngay$FR38 <- FR100 - (FR100 - FR0) * 0.382;
buonngay$FR62 <- FR100 - (FR100 - FR0) * 0.618;
buonngay$FR79 <- FR100 - (FR100 - FR0) * 0.786;
buonngay$FR100 <- FR100 - (FR100 - FR0);
buonngay$FR1618 <- FR100 - (FR100 - FR0) * 1.618;

# view(buonngay)
dygraph(buonngay, main = "Bieu Do Hinh Nen") %>%
  dyAxis("x", rangePad = 15) %>%
  dyCandlestick()