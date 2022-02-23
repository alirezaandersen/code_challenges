# # Canadian postal codes are in the form "A1A 1A1", where "A" is an upper case letter
# # and "1" is a digit. Here is a subset of provinces and territories along with their
# # unique set of postal code prefixes:
# #
# # Province Code | Prefixes      | Province/Territory Name
# # ------------- | ------------- | -----------------------
# # ON            | K, L, M, N, P | Ontario
# # MB            | R             | Manitoba
# # NU            | X0A, X0B, X0C | Nunavut
# # NT            | X0E, X0G, X1A | Northwest Territories
# #
# # Using that subset:
# # 1) Write a `province_for` method which, given a postal code, returns the
# #    province code that corresponds, or null if none is found to match
# # e.g. province_for("K1P 1K9") => "ON"
# #      province_for("R3L 0T9") => "MB"
# #      province_for("Q1Q 1Q1") => null # no postal codes start with "Q"
# #      province_for("X0C 0E0") => "NU"
# #
# # 2) Write a `valid_for` method which, given a postal code and a province code,
# #    returns true if the postal code is valid for the province, or false otherwise
# # e.g. valid_for("M5W 1E6", "ON") => true
# #      valid_for("V6B 4A2", "ON") => false # V6B 4A2 is in BC
# #      valid_for("X0E 0T0", "NT") => true
# #      valid_for("X0A 0H0", "MB") => false # X0A 0H0 is in NU
