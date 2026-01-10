library(dplyr)
library(jsonlite)
library(stringr)

# 建立完整的行政區代碼對照表
loc_df <- tibble(code_num = 100:983) %>%
  mutate(
    code = sprintf("%03d", code_num),
    county_name = case_when(
      code >= "100" & code <= "118" ~ "Taipei",
      code >= "200" & code <= "206" ~ "Keelung",
      (code >= "207" & code <= "253") | code == "207" ~ "New_Taipei",
      code >= "260" & code <= "272" ~ "Yilan",
      code == "300" ~ "Hsinchu_City",
      code >= "302" & code <= "315" ~ "Hsinchu_County",
      code >= "320" & code <= "338" ~ "Taoyuan",
      code >= "350" & code <= "369" ~ "Miaoli",
      code >= "400" & code <= "439" ~ "Taichung",
      code >= "500" & code <= "530" ~ "Changhua",
      code >= "540" & code <= "558" ~ "Nantou",
      code == "600" ~ "Chiayi_City",
      code >= "602" & code <= "625" ~ "Chiayi_County",
      code >= "630" & code <= "649" ~ "Yunlin",
      code >= "700" & code <= "745" ~ "Tainan",
      code >= "800" & code <= "852" ~ "Kaohsiung",
      code >= "880" & code <= "885" ~ "Penghu",
      code >= "890" & code <= "896" ~ "Kinmen",
      code >= "209" & code <= "212" ~ "Lienchiang",
      code >= "900" & code <= "947" ~ "Pingtung",
      code >= "950" & code <= "966" ~ "Taitung",
      code >= "970" & code <= "983" ~ "Hualien",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(county_name)) %>%
  select(code, county_name)

# 寫入 JSON 檔案
write_json(loc_df, "data/location_map.json", pretty = TRUE)
message("✅ Generated: data/location_map.json")